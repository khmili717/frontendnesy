# Authentication Flow Debug Analysis

## Issue Identified
Users can log in successfully and reach the secretary dashboard, but when API calls are made to protected endpoints (`/patients`), they receive a **401 Unauthorized** error.

## Debug Steps

### 1. **Check Login Response Format**
Based on the DIO logs and backend response, the login is successful and returns:
```json
{
  "message": "Authentication reussite", 
  "role": "secretaire",
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
  "archived": false
}
```

### 2. **Token Storage Issue Investigation**

The issue is likely one of these:

#### **Possibility 1: Token Not Being Stored**
```dart
// In AuthProvider.login()
await _secureStorage.write(
  key: AppConstants.accessTokenKey,  // 'access_token'
  value: response.accessToken,       // This should be the JWT token
);
```

#### **Possibility 2: Token Not Being Retrieved**
```dart
// In DioClient._AuthInterceptor
final token = await _secureStorage.read(key: AppConstants.accessTokenKey);
if (token != null) {
  options.headers['Authorization'] = 'Bearer $token';
}
```

#### **Possibility 3: LoginResponse Parsing Issue**
```dart
// In api_client.dart LoginResponse.fromJson()
return LoginResponse(
  accessToken: token,  // This should contain the JWT
  user: user,
);
```

### 3. **Debugging Actions Needed**

Add debug logging to check each step:

1. **Check if token is properly extracted from login response**
2. **Verify token is stored in secure storage**
3. **Confirm token is retrieved in auth interceptor**
4. **Validate the Bearer token format in requests**

### 4. **Expected vs Actual Flow**

**Expected Flow:**
1. User logs in → Backend returns JWT token
2. JWT stored in secure storage
3. Protected endpoint calls → Auth interceptor adds Bearer token
4. Backend validates token → Returns data

**Current Issue:**
1. ✅ User logs in → Backend returns JWT token
2. ❓ JWT stored in secure storage (NEED TO VERIFY)
3. ❓ Auth interceptor retrieves and adds token (NEED TO VERIFY)
4. ❌ Backend returns 401 Unauthorized

### 5. **Next Steps**

1. **Add debug logging** to track token flow
2. **Verify token storage** immediately after login
3. **Check token retrieval** in auth interceptor
4. **Inspect actual HTTP requests** to see if Bearer token is present
5. **Test token validity** with a manual API call

### 6. **Key Files to Check**

- `lib/features/auth/presentation/providers/auth_provider.dart` (login method)
- `lib/core/network/api_client.dart` (LoginResponse parsing)
- `lib/core/network/dio_client.dart` (Auth interceptor)
- `lib/core/constants/app_constants.dart` (Storage keys)

### 7. **Common Issues**

1. **Async/Await Issues**: Token not fully stored before API calls
2. **Key Mismatch**: Different keys used for storing vs retrieving
3. **Token Format**: Incorrect JWT token extraction from response
4. **Timing Issues**: Auth interceptor called before token is available

### 8. **Quick Test**

To verify, we need to:
1. Add logging to see the actual token value at each step
2. Check if the token exists in storage after login
3. Verify the Bearer header is being added to API requests
4. Confirm the JWT token format is correct 