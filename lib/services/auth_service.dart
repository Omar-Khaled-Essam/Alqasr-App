import 'package:shared_preferences/shared_preferences.dart';
import '../models/user.dart';

class AuthService {
  static final AuthService _instance = AuthService._internal();
  factory AuthService() => _instance;
  AuthService._internal();

  User? _currentUser;
  bool _isLoggedIn = false;

  User? get currentUser => _currentUser;
  bool get isLoggedIn => _isLoggedIn;

  // Initialize auth service
  Future<void> initialize() async {
    await _loadUserFromStorage();
  }

  // Login with email and password
  Future<AuthResult> login(String email, String password) async {
    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));
      
      // Mock validation - replace with actual API call
      if (email.isNotEmpty && password.length >= 6) {
        // Mock user data
        _currentUser = User(
          id: '1',
          firstName: 'أحمد',
          lastName: 'محمد',
          email: email,
          phoneNumber: '+966501234567',
          createdAt: DateTime.now(),
          isEmailVerified: true,
          isPhoneVerified: true,
          loyaltyPoints: 1250,
          loyaltyTier: 'Gold',
        );
        
        _isLoggedIn = true;
        await _saveUserToStorage();
        
        return AuthResult.success(_currentUser!);
      } else {
        return AuthResult.failure('البريد الإلكتروني أو كلمة المرور غير صحيحة');
      }
    } catch (e) {
      return AuthResult.failure('حدث خطأ أثناء تسجيل الدخول');
    }
  }

  // Register new user
  Future<AuthResult> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    String? phoneNumber,
  }) async {
    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));
      
      // Mock validation - replace with actual API call
      if (email.isNotEmpty && password.length >= 6 && firstName.isNotEmpty && lastName.isNotEmpty) {
        // Mock user data
        _currentUser = User(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          firstName: firstName,
          lastName: lastName,
          email: email,
          phoneNumber: phoneNumber,
          createdAt: DateTime.now(),
          isEmailVerified: false,
          isPhoneVerified: false,
          loyaltyPoints: 0,
        );
        
        _isLoggedIn = true;
        await _saveUserToStorage();
        
        return AuthResult.success(_currentUser!);
      } else {
        return AuthResult.failure('يرجى ملء جميع الحقول المطلوبة');
      }
    } catch (e) {
      return AuthResult.failure('حدث خطأ أثناء إنشاء الحساب');
    }
  }

  // Logout
  Future<void> logout() async {
    _currentUser = null;
    _isLoggedIn = false;
    await _clearUserFromStorage();
  }

  // Forgot password
  Future<AuthResult> forgotPassword(String email) async {
    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));
      
      if (email.isNotEmpty && email.contains('@')) {
        return AuthResult.success(null, message: 'تم إرسال رابط إعادة تعيين كلمة المرور إلى بريدك الإلكتروني');
      } else {
        return AuthResult.failure('يرجى إدخال بريد إلكتروني صحيح');
      }
    } catch (e) {
      return AuthResult.failure('حدث خطأ أثناء إرسال رابط إعادة التعيين');
    }
  }

  // Update user profile
  Future<AuthResult> updateProfile({
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? profileImageUrl,
  }) async {
    try {
      if (_currentUser == null) {
        return AuthResult.failure('المستخدم غير مسجل الدخول');
      }

      // Simulate API call
      await Future.delayed(const Duration(seconds: 1));
      
      _currentUser = _currentUser!.copyWith(
        firstName: firstName ?? _currentUser!.firstName,
        lastName: lastName ?? _currentUser!.lastName,
        phoneNumber: phoneNumber ?? _currentUser!.phoneNumber,
        profileImageUrl: profileImageUrl ?? _currentUser!.profileImageUrl,
        updatedAt: DateTime.now(),
      );
      
      await _saveUserToStorage();
      
      return AuthResult.success(_currentUser!);
    } catch (e) {
      return AuthResult.failure('حدث خطأ أثناء تحديث الملف الشخصي');
    }
  }

  // Change password
  Future<AuthResult> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    try {
      if (_currentUser == null) {
        return AuthResult.failure('المستخدم غير مسجل الدخول');
      }

      // Simulate API call
      await Future.delayed(const Duration(seconds: 1));
      
      // Mock validation
      if (currentPassword.length >= 6 && newPassword.length >= 6) {
        return AuthResult.success(_currentUser!, message: 'تم تغيير كلمة المرور بنجاح');
      } else {
        return AuthResult.failure('كلمة المرور الجديدة يجب أن تكون 6 أحرف على الأقل');
      }
    } catch (e) {
      return AuthResult.failure('حدث خطأ أثناء تغيير كلمة المرور');
    }
  }

  // Social login (Google, Apple)
  Future<AuthResult> socialLogin(String provider, Map<String, dynamic> userData) async {
    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));
      
      _currentUser = User(
        id: userData['id'] ?? DateTime.now().millisecondsSinceEpoch.toString(),
        firstName: userData['firstName'] ?? '',
        lastName: userData['lastName'] ?? '',
        email: userData['email'] ?? '',
        phoneNumber: userData['phoneNumber'],
        profileImageUrl: userData['profileImageUrl'],
        createdAt: DateTime.now(),
        isEmailVerified: true,
        isPhoneVerified: false,
        loyaltyPoints: 0,
      );
      
      _isLoggedIn = true;
      await _saveUserToStorage();
      
      return AuthResult.success(_currentUser!);
    } catch (e) {
      return AuthResult.failure('حدث خطأ أثناء تسجيل الدخول عبر $provider');
    }
  }

  // Save user to local storage
  Future<void> _saveUserToStorage() async {
    if (_currentUser != null) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('user_data', _currentUser!.toJson().toString());
      await prefs.setBool('is_logged_in', _isLoggedIn);
    }
  }

  // Load user from local storage
  Future<void> _loadUserFromStorage() async {
    final prefs = await SharedPreferences.getInstance();
    _isLoggedIn = prefs.getBool('is_logged_in') ?? false;
    
    if (_isLoggedIn) {
      final userDataString = prefs.getString('user_data');
      if (userDataString != null) {
        // In a real app, you would parse the JSON properly
        // For now, we'll just set a basic user
        _currentUser = User(
          id: '1',
          firstName: 'أحمد',
          lastName: 'محمد',
          email: 'ahmed@example.com',
          phoneNumber: '+966501234567',
          createdAt: DateTime.now(),
          isEmailVerified: true,
          isPhoneVerified: true,
          loyaltyPoints: 1250,
          loyaltyTier: 'Gold',
        );
      }
    }
  }

  // Clear user from local storage
  Future<void> _clearUserFromStorage() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('user_data');
    await prefs.setBool('is_logged_in', false);
  }
}

class AuthResult {
  final bool isSuccess;
  final User? user;
  final String? error;
  final String? message;

  AuthResult._({
    required this.isSuccess,
    this.user,
    this.error,
    this.message,
  });

  factory AuthResult.success(User? user, {String? message}) {
    return AuthResult._(
      isSuccess: true,
      user: user,
      message: message,
    );
  }

  factory AuthResult.failure(String error) {
    return AuthResult._(
      isSuccess: false,
      error: error,
    );
  }
}
