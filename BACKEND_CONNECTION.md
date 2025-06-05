# Backend Connection Guide

## Overview
This Flutter app is now configured to connect to your NestJS backend API instead of using mock data. All user authentication, data fetching, and API calls are made to the real backend.

## Backend Configuration

### Base URL
The app automatically selects the correct URL based on the platform:

- **Web/Desktop**: `http://localhost:3000`
- **Android Emulator**: `http://10.0.2.2:3000` (special emulator IP to access host)
- **iOS Simulator**: `http://localhost:3000`
- **Real Devices**: `http://192.168.1.2:3000` (your computer's IP)
- **Production**: `https://your-production-api.com`

You can change the IP address in `lib/core/constants/app_constants.dart`:
```dart
static const String _androidEmulatorUrl = 'http://10.0.2.2:3000';
static const String _deviceUrl = 'http://192.168.1.2:3000'; // Change this IP for real devices
static const String _localhostUrl = 'http://localhost:3000';
```

**Important**: 
- For Android emulator: Use `10.0.2.2:3000` (automatically configured)
- For real devices: Replace `192.168.1.2` with your computer's actual IP address

### API Endpoints Used
The app uses the following endpoints from your Swagger documentation:

#### Authentication
- `POST /auth/login` - User login with CIN and password
- `POST /auth/logout` - User logout
- `POST /auth/check-token` - Token validation

#### Users Management (Admin Dashboard)
- `GET /users` - Get all users
- `GET /users/medecins` - Get all doctors
- `GET /users/secretaires` - Get all secretaries
- `POST /users` - Create new user (TODO)
- `PUT /users/{id}` - Update user (TODO)
- `DELETE /users/{id}` - Delete user (TODO)

#### Patients (Future Implementation)
- `GET /patients` - Get all patients
- `POST /patients` - Create patient
- `PUT /patients/{id}` - Update patient
- `DELETE /patients/{id}` - Delete patient

## Authentication Flow

1. **Login**: User enters CIN (8 digits) and password
2. **API Call**: App sends POST request to `/auth/login`
3. **Token Storage**: JWT token is stored securely using FlutterSecureStorage
4. **Auto-Authentication**: Token is automatically added to all subsequent API requests
5. **Role-based Navigation**: User is redirected based on their role (admin/medecin/secretaire)

## Data Flow

### Users Provider (Admin Dashboard)
- Fetches real user data from `/users` endpoint
- Supports filtering by role (Admin, Médecin, Secrétaire)
- Handles loading states and error messages
- Supports pull-to-refresh functionality

### Authentication Provider
- Manages user login/logout state
- Handles token storage and retrieval
- Provides current user information
- Manages authentication errors

## Network Configuration

### Timeouts
- Connection timeout: 30 seconds
- Request timeout: 30 seconds

### Error Handling
The app handles various HTTP status codes:
- 400: Bad request
- 401: Unauthorized (redirects to login)
- 403: Forbidden (access denied)
- 404: Not found
- 409: Conflict
- 500: Server error

### Interceptors
- **Auth Interceptor**: Automatically adds JWT token to requests
- **Error Interceptor**: Handles and formats error messages
- **Logging Interceptor**: Logs requests and responses for debugging

## Testing Backend Connection

Run the API connection test:
```bash
flutter test test/api_test.dart
```

This will verify:
- Backend server is reachable
- API endpoints are correctly configured

## Development Setup

### Backend Configuration

1. **Start your NestJS backend** to accept connections from all interfaces:
   ```bash
   # Instead of just localhost
   npm run start:dev -- --host 0.0.0.0
   
   # Or configure in main.ts to listen on both IPv4 and IPv6
   await app.listen(3000, '0.0.0.0');
   
   # Alternative: Listen on specific IPv4 address
   await app.listen(3000, '127.0.0.1');
   ```
   
   **Note**: Your backend is currently running on IPv6 `[::1]:3000`. For better compatibility with Android emulator, configure it to use IPv4 `0.0.0.0:3000` or `127.0.0.1:3000`.

2. **Enable CORS** for your IP address in your NestJS app:
   ```typescript
   // In main.ts
   app.enableCors({
     origin: [
       'http://localhost:3000',
       'http://192.168.1.2:3000', // Your computer's IP
       'http://localhost:*', // For Flutter web
     ],
     credentials: true,
   });
   ```

3. **Create test users** in your database with the following roles:
   - admin
   - medecin  
   - secretaire

### Flutter App Configuration

1. **Update IP Address**: Change the IP in `AppConstants._deviceUrl` to your computer's IP
2. **Check Network**: Ensure device and computer are on same WiFi
3. **Test Connection**: Run the API test to verify connectivity

### Sample Test User
```json
{
  "cin": 12345678,
  "mdp": "password123",
  "nom": "Admin",
  "prenom": "Test",
  "role": "admin",
  "sexe": "homme"
}
```

## Features Implemented

✅ **Real Authentication**
- Login with CIN and password
- JWT token management
- Secure token storage
- Auto-logout on token expiry

✅ **Real User Data**
- Fetch users from backend
- Role-based filtering
- Real-time data updates
- Error handling and retry

✅ **Network Layer**
- Dio HTTP client
- Retrofit API client
- Request/response interceptors
- Proper error handling

## Next Steps

### TODO: Implement CRUD Operations
1. **Add User Dialog** - Create new users
2. **Edit User Dialog** - Update existing users  
3. **Archive User** - Soft delete users
4. **Patient Management** - Full CRUD for patients
5. **Consultation Management** - Create and manage consultations
6. **Appointment Scheduling** - Book and manage appointments

### TODO: Additional Features
1. **Search Functionality** - Search users by name/CIN
2. **Pagination** - Handle large datasets
3. **Offline Support** - Cache data for offline use
4. **Push Notifications** - Real-time updates
5. **File Upload** - Profile pictures and documents

## Troubleshooting

### Common Issues

1. **Connection Refused / No Internet Connection**
   - **For Mobile Devices**: Make sure you're using your computer's IP address, not `localhost`
   - **Find your IP**: Run `ipconfig` (Windows) or `ifconfig` (Mac/Linux) to get your IP
   - **Update the IP**: Change `_deviceUrl` in `AppConstants` to your actual IP
   - **Same Network**: Ensure your device and computer are on the same WiFi network
   - **Firewall**: Check if Windows Firewall is blocking port 3000

2. **Backend Not Running**
   - Ensure NestJS backend is running on port 3000
   - Check if CORS is properly configured for your IP address
   - Verify backend accepts connections from `0.0.0.0:3000` not just `localhost:3000`

3. **401 Unauthorized**
   - Check if JWT token is valid
   - Verify user credentials in database

4. **Network Timeout**
   - Check internet connection
   - Verify backend server is responsive
   - Try pinging your computer from the device

### Debug Mode
Enable detailed logging by checking the console output when running the app. All HTTP requests and responses are logged for debugging.

## Security Notes

- JWT tokens are stored securely using FlutterSecureStorage
- Passwords are never stored locally
- All API calls use HTTPS in production (update baseUrl for production)
- Sensitive data is encrypted on device storage 