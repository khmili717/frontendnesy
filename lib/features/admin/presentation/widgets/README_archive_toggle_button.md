# ArchiveToggleButton Widget

## Overview
The `ArchiveToggleButton` is a sophisticated Flutter widget designed to handle user archive/unarchive operations through API calls. It provides a seamless toggle functionality with visual feedback, error handling, and state management.

## Features

### 🎨 Visual Design
- **Dynamic Appearance**: Button text, icon, and colors change based on user's archived status
- **Material Design**: Consistent with app's design system using League Spartan font and established color palette
- **Responsive**: Customizable dimensions with sensible defaults
- **Loading States**: Shows spinner during API operations
- **Visual Feedback**: Color-coded actions (red for archive, green for unarchive)

### 🔄 State Management
- **Local State**: Immediate UI updates for responsive user experience
- **Provider Integration**: Uses Riverpod for global state management
- **Change Detection**: Automatically syncs with parent widget state changes
- **Callback Support**: Optional parent notification via `onStatusChanged`

### 🌐 API Integration
- **RESTful Endpoints**: Integrates with `/users/{id}/archive` and `/users/{id}/unarchive`
- **Bearer Authentication**: Automatic token handling via existing API client
- **Error Handling**: Comprehensive error messages for 403, 404, and network errors
- **Success Feedback**: User-friendly success notifications

### 🛡️ Error Handling
- **HTTP Status Codes**: Specific messages for 403 (Forbidden), 404 (Not Found)
- **Network Errors**: Handles connection and timeout issues
- **User Feedback**: SnackBar notifications with appropriate styling
- **Graceful Degradation**: Button remains functional even if API fails

## Usage

### Basic Implementation
```dart
ArchiveToggleButton(
  userId: 'user-123',
  isArchived: user.archived,
  onStatusChanged: (newStatus) {
    // Handle status change in parent widget
    setState(() {
      user.archived = newStatus;
    });
  },
)
```

### With Custom Dimensions
```dart
ArchiveToggleButton(
  userId: 'user-123',
  isArchived: false,
  width: 120,
  height: 40,
  onStatusChanged: (newStatus) {
    print('User status changed to: ${newStatus ? "archived" : "active"}');
  },
)
```

### In User List/Card Context
```dart
// Inside UserCard widget
Widget _buildActionButtons(BuildContext context) {
  return Row(
    children: [
      // Edit button
      ElevatedButton(...),
      
      // Archive toggle button
      ArchiveToggleButton(
        userId: user.id!,
        isArchived: user.archived,
        onStatusChanged: (newStatus) {
          // Refresh user list or update cache
          ref.read(usersProvider.notifier).refreshUsers();
        },
      ),
    ],
  );
}
```

## Parameters

| Parameter | Type | Required | Default | Description |
|-----------|------|----------|---------|-------------|
| `userId` | `String` | ✅ | - | Unique identifier for the user |
| `isArchived` | `bool` | ✅ | - | Current archived status of the user |
| `onStatusChanged` | `Function(bool)?` | ❌ | `null` | Callback triggered on successful status change |
| `width` | `double?` | ❌ | `80` | Custom button width |
| `height` | `double?` | ❌ | `25` | Custom button height |

## Visual States

### Archive Action (User is Active)
- **Text**: "Archiver"
- **Icon**: `Icons.archive`
- **Background**: Light red (`AppConstants.errorRedLight`)
- **Text Color**: Dark red (`AppConstants.errorRedDark`)

### Unarchive Action (User is Archived)
- **Text**: "Réactiver"
- **Icon**: `Icons.unarchive`
- **Background**: Light green (`AppConstants.successGreenLight`)
- **Text Color**: Dark green (`AppConstants.successGreen`)

### Loading State
- **Content**: Small `CircularProgressIndicator`
- **Behavior**: Button disabled during operation
- **Color**: Matches text color for consistency

## API Endpoints

### Archive User
```
PUT /users/{id}/archive
Authorization: Bearer {token}
```
**Response Codes:**
- `200`: User successfully archived
- `403`: Forbidden (requires admin role)
- `404`: User not found

### Unarchive User
```
PUT /users/{id}/unarchive
Authorization: Bearer {token}
```
**Response Codes:**
- `200`: User successfully unarchived
- `403`: Forbidden (requires admin role)
- `404`: User not found

## Error Messages

| Scenario | French Message | English Translation |
|----------|----------------|-------------------|
| Success Archive | "Utilisateur archivé avec succès" | "User archived successfully" |
| Success Unarchive | "Utilisateur restauré avec succès" | "User unarchived successfully" |
| Forbidden (403) | "Accès refusé. Vous n'avez pas les permissions nécessaires." | "Access denied. You don't have the necessary permissions." |
| Not Found (404) | "Utilisateur non trouvé." | "User not found." |
| Network Error | "Erreur de connexion réseau. Veuillez vérifier votre connexion internet." | "Network connection error. Please check your internet connection." |
| Timeout | "Délai d'attente dépassé. Veuillez réessayer." | "Timeout exceeded. Please try again." |
| Generic Error | "Erreur lors de l'archivage/restauration de l'utilisateur" | "Error archiving/unarchiving user" |

## Dependencies

### Required Packages
```yaml
dependencies:
  flutter_riverpod: ^2.4.9
  retrofit: ^4.0.3
  dio: ^5.3.2
```

### Internal Dependencies
- `foresight_care/core/constants/app_constants.dart` - Color and styling constants
- `foresight_care/core/di/injection.dart` - Dependency injection setup
- `foresight_care/core/network/api_client.dart` - API client with archive/unarchive methods
- `foresight_care/features/admin/presentation/providers/archive_user_provider.dart` - State management

## Testing

### Unit Tests
```dart
// Test state changes
testWidgets('should show archive button for active user', (tester) async {
  await tester.pumpWidget(
    ProviderScope(
      child: MaterialApp(
        home: Scaffold(
          body: ArchiveToggleButton(
            userId: 'test-user',
            isArchived: false,
          ),
        ),
      ),
    ),
  );
  
  expect(find.text('Archiver'), findsOneWidget);
  expect(find.byIcon(Icons.archive), findsOneWidget);
});
```

### Integration Tests
```dart
// Test API integration
testWidgets('should call archive API on button press', (tester) async {
  // Setup mock API client
  // Pump widget
  // Tap button
  // Verify API call
});
```

## Best Practices

### Performance
- Use `const` constructors where possible
- Avoid unnecessary rebuilds by proper state management
- Minimize API calls through debouncing if needed

### Accessibility
- Sufficient color contrast for visibility
- Semantic labels for screen readers
- Proper button sizing for touch targets

### Error Handling
- Always handle network failures gracefully
- Provide clear, actionable error messages
- Don't expose technical details to end users

### State Synchronization
- Keep local state in sync with server state
- Use callbacks to notify parent widgets
- Consider implementing optimistic updates for better UX

## Troubleshooting

### Common Issues

1. **Button doesn't respond**: Check if `userId` is valid and API client is properly configured
2. **Wrong colors/styling**: Verify `AppConstants` values and theme consistency
3. **API errors**: Check authentication token and user permissions
4. **State not updating**: Ensure parent widget properly handles `onStatusChanged` callback

### Debug Tips
- Enable debug prints in provider for API call tracing
- Use Flutter Inspector to verify widget state
- Check network logs for API request/response details
- Verify Riverpod provider state in debug mode

## Migration Guide

### From Custom Archive Button
```dart
// Old implementation
ElevatedButton(
  onPressed: () => archiveUser(),
  child: Text('Archive'),
)

// New implementation
ArchiveToggleButton(
  userId: user.id,
  isArchived: user.archived,
  onStatusChanged: (newStatus) {
    // Update local state
  },
)
```

## Changelog

### Version 1.0.0
- Initial implementation with archive/unarchive toggle
- Riverpod state management integration
- Comprehensive error handling
- Material Design styling
- Customizable dimensions
- Parent widget callbacks 