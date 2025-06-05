# 🔧 Complete Backend Connection Fix Guide

## 🚨 Current Problem
Your Android emulator is trying to connect to `http://10.0.2.2:3000` but getting connection timeouts because:

1. **Backend IPv6 Issue**: Your NestJS backend is running on IPv6 `[::1]:3000` instead of IPv4
2. **Network Interface**: Backend is not listening on all network interfaces
3. **CORS Configuration**: May not be properly configured for emulator access

## ✅ Step-by-Step Solution

### Step 1: Stop Your Current Backend
First, stop your current NestJS backend server (press `Ctrl+C` in the terminal where it's running).

### Step 2: Configure Backend for IPv4 (Choose ONE method)

#### Method A: Command Line (Quick Fix)
```bash
# Navigate to your backend directory
cd path/to/your/nestjs-backend

# Start with IPv4 host binding
npm run start:dev -- --host 0.0.0.0

# OR if using yarn
yarn start:dev -- --host 0.0.0.0
```

#### Method B: Modify main.ts (Recommended)
In your NestJS backend's `src/main.ts` file, update the bootstrap function:

```typescript
import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  
  // Enable CORS for Flutter app
  app.enableCors({
    origin: [
      'http://localhost:3000',
      'http://127.0.0.1:3000',
      'http://10.0.2.2:3000',        // Android emulator
      'http://192.168.1.2:3000',     // Real devices
      'http://localhost:*',          // Flutter web
    ],
    credentials: true,
    methods: ['GET', 'POST', 'PUT', 'DELETE', 'PATCH', 'OPTIONS'],
    allowedHeaders: ['Content-Type', 'Authorization', 'Accept'],
  });

  // IMPORTANT: Listen on IPv4, not IPv6
  await app.listen(3000, '0.0.0.0');
  
  console.log('🚀 Application is running on: http://0.0.0.0:3000');
  console.log('📱 Android emulator can access via: http://10.0.2.2:3000');
  console.log('🌐 Network accessible at: http://192.168.1.2:3000');
}
bootstrap();
```

#### Method C: Environment Variables
Create or update your `.env` file in the backend:
```env
HOST=0.0.0.0
PORT=3000
```

### Step 3: Test Backend Connectivity

After restarting your backend, test if it's accessible:

```bash
# Test from your computer (should work)
curl http://localhost:3000
curl http://127.0.0.1:3000

# Test from network interface (should also work now)
curl http://192.168.1.2:3000

# All should return: {"message":"Cannot GET /","error":"Not Found","statusCode":404}
# This 404 is NORMAL - it means the server is reachable!
```

### Step 4: Verify Network Configuration

Check if your backend is listening on the correct interface:

```bash
# Windows
netstat -an | findstr :3000

# Should show something like:
# TCP    0.0.0.0:3000           0.0.0.0:0              LISTENING
```

### Step 5: Test Flutter Connection

Run the network test to verify connectivity:
```bash
flutter test test/network_test.dart
```

Expected output for Android:
```
🌐 Network Configuration:
Platform: android
Base URL: http://10.0.2.2:3000
✅ Backend is reachable - Status: 404
✅ Auth endpoint is working - Status: 400
```

## 🔍 Alternative Solutions (If Above Doesn't Work)

### Option 1: Use Different Android Emulator Network
If `10.0.2.2` doesn't work, try updating the Flutter app to use your actual IP:

```dart
// In lib/core/constants/app_constants.dart
static const String _androidEmulatorUrl = 'http://192.168.1.2:3000'; // Use your actual IP
```

### Option 2: Check Windows Firewall
1. Open Windows Defender Firewall
2. Click "Allow an app or feature through Windows Defender Firewall"
3. Find Node.js and ensure it's allowed for both Private and Public networks
4. If not listed, click "Allow another app..." and add Node.js

### Option 3: Temporarily Disable Firewall (Testing Only)
```bash
# Disable Windows Firewall temporarily (TESTING ONLY)
netsh advfirewall set allprofiles state off

# Test your app, then re-enable:
netsh advfirewall set allprofiles state on
```

## 🧪 Testing & Verification

### Test 1: Backend Accessibility
```bash
# From your computer
curl -X POST http://localhost:3000/auth/login \
  -H "Content-Type: application/json" \
  -d '{"cin": "test", "mdp": "test"}'

# Should return 400 Bad Request (this is good!)
```

### Test 2: Flutter Network Test
```bash
flutter test test/network_test.dart
```

### Test 3: Full App Test
1. Start your Flutter app on Android emulator
2. Try to login with any credentials
3. Check the logs - you should see connection attempts in backend logs
4. No more "connection timeout" errors

## 🎯 Success Indicators

✅ **Backend logs show**: `Application is running on: http://0.0.0.0:3000`
✅ **curl test returns**: 404 error (means server is reachable)
✅ **Flutter logs show**: Successful connection to `http://10.0.2.2:3000`
✅ **No more**: "Connection timeout" errors
✅ **Backend receives**: Login requests from Flutter app

## 🚨 Troubleshooting

### If Still Getting Timeouts:

1. **Check Backend Logs**: Ensure it shows `http://0.0.0.0:3000` not `http://[::1]:3000`

2. **Try Different Port**: 
   ```bash
   # Backend
   npm run start:dev -- --host 0.0.0.0 --port 3001
   
   # Update Flutter
   static const String _androidEmulatorUrl = 'http://10.0.2.2:3001';
   ```

3. **Use Real Device Instead**: 
   - Connect your phone via USB
   - Enable USB debugging
   - Use your computer's IP: `http://192.168.1.2:3000`

4. **Check Emulator Network**: 
   ```bash
   # In Android emulator terminal
   ping 10.0.2.2
   telnet 10.0.2.2 3000
   ```

## 📋 Quick Checklist

- [ ] Backend stopped and restarted with `--host 0.0.0.0`
- [ ] Backend logs show `http://0.0.0.0:3000` not `http://[::1]:3000`
- [ ] `curl http://localhost:3000` returns 404 (good)
- [ ] `curl http://192.168.1.2:3000` returns 404 (good)
- [ ] Windows Firewall allows Node.js
- [ ] Flutter network test passes
- [ ] Android emulator can connect to `http://10.0.2.2:3000`

## 🎉 Next Steps After Fix

Once connected successfully:
1. Test login with valid credentials
2. Verify admin dashboard loads
3. Check all API endpoints work
4. Test on real device with your IP address

---

**Need Help?** If you're still having issues after following this guide, please share:
1. Your backend startup logs
2. Output of `netstat -an | findstr :3000`
3. Flutter network test results
4. Any error messages from the app 