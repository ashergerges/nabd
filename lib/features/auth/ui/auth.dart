class AppUser {
  final String username;
  final String password;
  final String role;
  final String name;
  final List<String> permissions;

  const AppUser({
    required this.username,
    required this.password,
    required this.role,
    required this.name,
    required this.permissions,
  });

  bool get canEdit => permissions.contains('edit');
  bool get canDelete => permissions.contains('delete');
  bool get canExport => permissions.contains('export');

  String get roleLabel {
    switch (role) {
      case 'admin':
        return 'مدير النظام';
      case 'user':
        return 'مستخدم عادي';
      case 'viewer':
        return 'مشاهد فقط';
      case 'investor':
        return 'المستثمر';
      default:
        return role;
    }
  }

  String get roleIcon {
    switch (role) {
      case 'admin':
        return '👑';
      case 'user':
        return '👤';
      case 'viewer':
        return '👁️';
      case 'investor':
        return '💼';
      default:
        return '👤';
    }
  }
}

// Auth service — simple in-memory session
class AuthService {
  static AppUser? _currentUser;

  static AppUser? get currentUser => _currentUser;
  static bool get isLoggedIn => _currentUser != null;

  static final List<AppUser> _users = const [
    AppUser(
      username: 'admin',
      password: 'admin123',
      role: 'admin',
      name: 'مدير النظام',
      permissions: ['view', 'edit', 'delete', 'export'],
    ),
    AppUser(
      username: 'user',
      password: 'user123',
      role: 'user',
      name: 'مستخدم عادي',
      permissions: ['view', 'edit'],
    ),
    AppUser(
      username: 'viewer',
      password: 'view123',
      role: 'viewer',
      name: 'مشاهد',
      permissions: ['view'],
    ),
    AppUser(
      username: 'investor',
      password: 'invest123',
      role: 'investor',
      name: 'المستثمر',
      permissions: ['view', 'export'],
    ),
  ];

  /// Returns the user on success, null on failure
  static AppUser? login(String username, String password) {
    try {
      final user = _users.firstWhere(
        (u) => u.username == username && u.password == password,
      );
      _currentUser = user;
      return user;
    } catch (_) {
      return null;
    }
  }

  static void logout() {
    _currentUser = null;
  }

  static List<AppUser> get demoUsers => _users.take(3).toList();
}
