import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:foresight_care/core/constants/app_constants.dart';

class DioClient {
  late final Dio _dio;
  final FlutterSecureStorage _secureStorage;

  DioClient(this._secureStorage) {
    // Print network configuration for debugging
    AppConstants.printNetworkConfig();
    
    _dio = Dio(BaseOptions(
      baseUrl: AppConstants.baseUrl,
      connectTimeout: const Duration(milliseconds: AppConstants.connectTimeout),
      receiveTimeout: const Duration(milliseconds: AppConstants.requestTimeout),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ));

    // Add interceptors
    _dio.interceptors.add(_AuthInterceptor(_secureStorage));
    _dio.interceptors.add(_ErrorInterceptor());
    _dio.interceptors.add(_CustomLogInterceptor());
  }

  Dio get dio => _dio;
}

class _AuthInterceptor extends Interceptor {
  final FlutterSecureStorage _secureStorage;

  _AuthInterceptor(this._secureStorage);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    // Skip auth for login endpoint
    if (options.path.contains('/auth/login')) {
      print('[AUTH] Skipping auth for login endpoint: ${options.path}');
      return handler.next(options);
    }

    print('[AUTH] Processing request to: ${options.path}');
    
    // Add authorization header for other requests
    final token = await _secureStorage.read(key: AppConstants.accessTokenKey);
    print('[AUTH] Retrieved token: ${token != null ? '${token.substring(0, 20)}...' : 'NULL'}');
    
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
      print('[AUTH] Added Bearer token to headers');
    } else {
      print('[AUTH] ❌ No token found in storage! Key: ${AppConstants.accessTokenKey}');
    }

    print('[AUTH] Request headers: ${options.headers}');
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // Handle 401 unauthorized - token expired
    if (err.response?.statusCode == 401) {
      // Clear stored tokens
      await _secureStorage.delete(key: AppConstants.accessTokenKey);
      await _secureStorage.delete(key: AppConstants.userDataKey);
      
      // You could also trigger a logout event here
      print('[AUTH] Token expired, cleared storage');
    }

    handler.next(err);
  }
}

class _ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    String errorMessage = 'Unknown error occurred';

    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        errorMessage = 'Connection timeout. Please check your internet connection.';
        break;
      case DioExceptionType.badResponse:
        errorMessage = _handleStatusCode(err.response?.statusCode);
        break;
      case DioExceptionType.cancel:
        errorMessage = 'Request was cancelled';
        break;
      case DioExceptionType.connectionError:
        errorMessage = 'No internet connection. Please check your network.';
        break;
      case DioExceptionType.unknown:
        errorMessage = 'Something went wrong. Please try again.';
        break;
      default:
        errorMessage = 'Unexpected error occurred';
    }

    print('[ERROR] ${err.type}: $errorMessage');
    
    // Create a new DioException with user-friendly message
    final newError = DioException(
      requestOptions: err.requestOptions,
      response: err.response,
      type: err.type,
      error: errorMessage,
      message: errorMessage,
    );

    handler.next(newError);
  }

  String _handleStatusCode(int? statusCode) {
    switch (statusCode) {
      case 400:
        return 'Bad request. Please check your input.';
      case 401:
        return 'Unauthorized. Please login again.';
      case 403:
        return 'Access denied. You don\'t have permission.';
      case 404:
        return 'Resource not found.';
      case 409:
        return 'Conflict. Resource already exists.';
      case 422:
        return 'Invalid data provided.';
      case 500:
        return 'Server error. Please try again later.';
      case 502:
        return 'Bad gateway. Server is temporarily unavailable.';
      case 503:
        return 'Service unavailable. Please try again later.';
      default:
        return 'Server error (${statusCode ?? 'Unknown'})';
    }
  }
}

class _CustomLogInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('[CUSTOM_LOG] =====================================================');
    print('[CUSTOM_LOG] 📤 REQUEST to: ${options.path}');
    print('[CUSTOM_LOG] Method: ${options.method}');
    print('[CUSTOM_LOG] Headers: ${options.headers}');
    if (options.data != null) {
      print('[CUSTOM_LOG] Request data: ${options.data}');
    }
    print('[CUSTOM_LOG] =====================================================');
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print('[CUSTOM_LOG] =====================================================');
    print('[CUSTOM_LOG] 📥 RESPONSE from: ${response.requestOptions.path}');
    print('[CUSTOM_LOG] Status: ${response.statusCode} ${response.statusMessage}');
    print('[CUSTOM_LOG] Response headers: ${response.headers}');
    
    // Special handling for patients endpoint
    if (response.requestOptions.path.contains('/patients')) {
      print('[CUSTOM_LOG] 👥 PATIENTS RESPONSE ANALYSIS:');
      
      if (response.data is List) {
        final List patients = response.data;
        print('[CUSTOM_LOG] ✅ Response is a List with ${patients.length} items');
        
        if (patients.isNotEmpty) {
          print('[CUSTOM_LOG] 🔍 First patient sample:');
          final firstPatient = patients.first;
          
          if (firstPatient is Map<String, dynamic>) {
            print('[CUSTOM_LOG] Patient is a Map with keys: ${firstPatient.keys.toList()}');
            
            // Check required fields
            final nom = firstPatient['nomPatient'];
            final prenom = firstPatient['prenPatient'];
            final id = firstPatient['id'] ?? firstPatient['_id'];
            final pendingDeletion = firstPatient['pendingDeletion'];
            
            print('[CUSTOM_LOG] ID: $id (${id.runtimeType})');
            print('[CUSTOM_LOG] nomPatient: "$nom" (${nom.runtimeType})');
            print('[CUSTOM_LOG] prenPatient: "$prenom" (${prenom.runtimeType})');
            print('[CUSTOM_LOG] pendingDeletion: $pendingDeletion (${pendingDeletion.runtimeType})');
            
            // Show all fields for debugging
            print('[CUSTOM_LOG] 📋 All patient fields:');
            firstPatient.forEach((key, value) {
              print('[CUSTOM_LOG]   $key: "$value" (${value.runtimeType})');
            });
            
            if (patients.length > 1) {
              print('[CUSTOM_LOG] 🔍 Second patient sample:');
              final secondPatient = patients[1];
              if (secondPatient is Map<String, dynamic>) {
                final nom2 = secondPatient['nomPatient'];
                final prenom2 = secondPatient['prenPatient'];
                print('[CUSTOM_LOG] nomPatient: "$nom2", prenPatient: "$prenom2"');
              }
            }
          } else {
            print('[CUSTOM_LOG] ❌ First patient is NOT a Map: ${firstPatient.runtimeType}');
            print('[CUSTOM_LOG] Content: $firstPatient');
          }
        } else {
          print('[CUSTOM_LOG] ⚠️  Response is an empty List');
        }
      } else {
        print('[CUSTOM_LOG] ❌ Response is NOT a List: ${response.data.runtimeType}');
        print('[CUSTOM_LOG] Response content: ${response.data}');
      }
    } else {
      // For non-patients endpoints, show limited info
      if (response.data != null) {
        final dataStr = response.data.toString();
        if (dataStr.length > 500) {
          print('[CUSTOM_LOG] Response data (truncated): ${dataStr.substring(0, 500)}...');
        } else {
          print('[CUSTOM_LOG] Response data: $dataStr');
        }
      }
    }
    
    print('[CUSTOM_LOG] =====================================================');
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    print('[CUSTOM_LOG] =====================================================');
    print('[CUSTOM_LOG] ❌ ERROR from: ${err.requestOptions.path}');
    print('[CUSTOM_LOG] Error type: ${err.type}');
    print('[CUSTOM_LOG] Error message: ${err.message}');
    print('[CUSTOM_LOG] Response: ${err.response?.data}');
    print('[CUSTOM_LOG] Status code: ${err.response?.statusCode}');
    print('[CUSTOM_LOG] =====================================================');
    handler.next(err);
  }
} 