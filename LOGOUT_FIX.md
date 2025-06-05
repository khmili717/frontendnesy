# Logout Context Issue Fix

## Problem Identified

The secretary logout functionality was causing a Flutter error:

```
Looking up a deactivated widget's ancestor is unsafe.
At this point the state of the widget's element tree is no longer stable.
To safely refer to a widget's ancestor in its dispose() method, save a reference to the ancestor by calling dependOnInheritedWidgetOfExactType() in the widget's didChangeDependencies() method.
```

Additionally, after fixing the context issue, **logout was successful but navigation to login page was not happening**.

## Root Cause

### 1. Context Safety Issue
The issue occurred in the `_performLogout` method in `lib/features/secretary/presentation/pages/secretary_landing_page.dart`. The sequence of events was:

1. User clicks logout button
2. `ref.read(authProvider.notifier).logout()` is called
3. This changes the auth state and potentially triggers widget tree rebuilds
4. The code then attempts to use `ScaffoldMessenger.of(context)` and `context.go()` 
5. However, the BuildContext has become deactivated due to the state changes

### 2. Missing Global Navigation Logic
The app had role-based navigation logic in `LoginPage` for handling successful logins, but **no corresponding global listener to handle logout navigation**. Each page was manually handling logout navigation, which was inconsistent and error-prone.

## Solution Applied

### 1. Store Context References Early
```dart
// Store the scaffold messenger reference before logout to avoid context issues
final scaffoldMessenger = ScaffoldMessenger.of(context);
```

### 2. Check Context Mount Status
```dart
// Check if context is still mounted before using it
if (context.mounted) {
  // Use context for showing snackbars
}
```

### 3. Global Auth State Listener (NEW)
Added a global auth state listener in `main.dart` to handle automatic logout navigation:

```dart
class _ForesightCareAppState extends ConsumerState<ForesightCareApp> {
  @override
  Widget build(BuildContext context) {
    final router = ref.watch(appRouterProvider);
    
    // Listen for auth state changes to handle automatic logout navigation
    ref.listen<AuthState>(authProvider, (previous, next) {
      // If user was authenticated but now is not (logout scenario)
      if (previous?.isAuthenticated == true && !next.isAuthenticated) {
        debugPrint('[MAIN_APP] User logged out, navigating to login');
        // Use router to navigate to login
        router.go('/login');
      }
    });
    
    return MaterialApp.router(
      title: 'Foresight Care',
      theme: AppTheme.lightTheme,
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
```

### 4. Simplified Logout Methods
Removed manual navigation from individual logout methods since the global listener handles it:

```dart
// Secretary logout (simplified)
void _performLogout(BuildContext context) async {
  try {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    
    await ref.read(authProvider.notifier).logout();
    debugPrint('[SECRETARY_PAGE] User logged out');

    if (context.mounted) {
      scaffoldMessenger.showSnackBar(/* success message */);
      // Navigation is now handled by the global auth listener in main.dart
    }
  } catch (e) {
    // Error handling...
  }
}

// Admin logout (simplified)
IconButton(
  onPressed: () async {
    await ref.read(authProvider.notifier).logout();
    // Navigation is now handled by the global auth listener in main.dart
  },
  icon: const Icon(Icons.logout),
)
```

## Key Improvements

1. **Context Safety**: Store references before state changes and check `context.mounted`
2. **Global Navigation**: Centralized logout navigation logic in main app
3. **Consistency**: All logout methods now follow the same pattern
4. **Maintainability**: Single source of truth for auth-based navigation
5. **Error Prevention**: No more context-related crashes

## Architecture Benefits

### Before (Problems)
- ❌ Manual navigation in each logout method
- ❌ Context safety issues
- ❌ Inconsistent logout behavior
- ❌ Duplicated navigation logic

### After (Solutions)
- ✅ **Centralized Navigation**: Global auth listener handles all logout navigation
- ✅ **Context Safety**: Proper context checks and reference storage
- ✅ **Consistency**: All logout methods work the same way
- ✅ **Maintainability**: Single place to modify logout navigation logic

## Verification

✅ **No more context errors**: The "deactivated widget's ancestor" error is resolved  
✅ **Logout functionality**: Users can log out successfully  
✅ **Automatic Navigation**: Users are automatically redirected to login page after logout  
✅ **User feedback**: SnackBar messages still display correctly  
✅ **Error handling**: Graceful error handling maintained  
✅ **Consistency**: Both admin and secretary logout work the same way

## Files Modified

1. **lib/main.dart**: Added global auth state listener for logout navigation
2. **lib/features/secretary/presentation/pages/secretary_landing_page.dart**: Fixed context safety and removed manual navigation
3. **lib/features/admin/presentation/pages/admin_dashboard_page.dart**: Removed manual navigation for consistency

## Best Practices Applied

1. **Global State Management**: Use global listeners for app-wide navigation logic
2. **Context Safety**: Always check `context.mounted` after async operations
3. **Early Reference Storage**: Store context-dependent references before state changes
4. **Single Responsibility**: Separate logout logic from navigation logic
5. **Centralized Control**: One place to manage auth-based navigation 