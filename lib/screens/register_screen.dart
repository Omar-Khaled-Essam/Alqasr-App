import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  bool _agreeToTerms = false;

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const StatusAppBar(
        title: AppConstants.register,
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: AppConstants.largePadding),
              
              // Welcome Text
              const Text(
                'أنشئ حسابك الجديد',
                style: TextStyle(
                  fontSize: AppConstants.titleFontSize,
                  fontWeight: FontWeight.bold,
                  color: AppConstants.textPrimary,
                ),
                textAlign: TextAlign.center,
              ),
              
              const SizedBox(height: AppConstants.smallPadding),
              
              const Text(
                'انضم إلينا واستمتع بخدمات الفنادق المميزة',
                style: TextStyle(
                  fontSize: AppConstants.bodyFontSize,
                  color: AppConstants.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
              
              const SizedBox(height: AppConstants.largePadding * 2),
              
              // Name Fields
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _firstNameController,
                      textDirection: TextDirection.rtl,
                      decoration: InputDecoration(
                        labelText: 'الاسم الأول',
                        prefixIcon: const Icon(Icons.person_outline),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(AppConstants.borderRadius),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(AppConstants.borderRadius),
                          borderSide: const BorderSide(color: AppConstants.primaryGold),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'مطلوب';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: AppConstants.defaultPadding),
                  Expanded(
                    child: TextFormField(
                      controller: _lastNameController,
                      textDirection: TextDirection.rtl,
                      decoration: InputDecoration(
                        labelText: 'اسم العائلة',
                        prefixIcon: const Icon(Icons.person_outline),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(AppConstants.borderRadius),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(AppConstants.borderRadius),
                          borderSide: const BorderSide(color: AppConstants.primaryGold),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'مطلوب';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: AppConstants.defaultPadding),
              
              // Email Field
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                textDirection: TextDirection.ltr,
                decoration: InputDecoration(
                  labelText: 'البريد الإلكتروني',
                  hintText: 'example@email.com',
                  prefixIcon: const Icon(Icons.email_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppConstants.borderRadius),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppConstants.borderRadius),
                    borderSide: const BorderSide(color: AppConstants.primaryGold),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'يرجى إدخال البريد الإلكتروني';
                  }
                  if (!value.contains('@')) {
                    return 'يرجى إدخال بريد إلكتروني صحيح';
                  }
                  return null;
                },
              ),
              
              const SizedBox(height: AppConstants.defaultPadding),
              
              // Phone Field
              TextFormField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                textDirection: TextDirection.ltr,
                decoration: InputDecoration(
                  labelText: 'رقم الهاتف',
                  hintText: '+966 50 123 4567',
                  prefixIcon: const Icon(Icons.phone_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppConstants.borderRadius),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppConstants.borderRadius),
                    borderSide: const BorderSide(color: AppConstants.primaryGold),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'يرجى إدخال رقم الهاتف';
                  }
                  if (value.length < 10) {
                    return 'رقم الهاتف يجب أن يكون 10 أرقام على الأقل';
                  }
                  return null;
                },
              ),
              
              const SizedBox(height: AppConstants.defaultPadding),
              
              // Password Field
              TextFormField(
                controller: _passwordController,
                obscureText: !_isPasswordVisible,
                textDirection: TextDirection.ltr,
                decoration: InputDecoration(
                  labelText: 'كلمة المرور',
                  hintText: 'أدخل كلمة المرور',
                  prefixIcon: const Icon(Icons.lock_outlined),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppConstants.borderRadius),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppConstants.borderRadius),
                    borderSide: const BorderSide(color: AppConstants.primaryGold),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'يرجى إدخال كلمة المرور';
                  }
                  if (value.length < 6) {
                    return 'كلمة المرور يجب أن تكون 6 أحرف على الأقل';
                  }
                  return null;
                },
              ),
              
              const SizedBox(height: AppConstants.defaultPadding),
              
              // Confirm Password Field
              TextFormField(
                controller: _confirmPasswordController,
                obscureText: !_isConfirmPasswordVisible,
                textDirection: TextDirection.ltr,
                decoration: InputDecoration(
                  labelText: 'تأكيد كلمة المرور',
                  hintText: 'أعد إدخال كلمة المرور',
                  prefixIcon: const Icon(Icons.lock_outlined),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                      });
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppConstants.borderRadius),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppConstants.borderRadius),
                    borderSide: const BorderSide(color: AppConstants.primaryGold),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'يرجى تأكيد كلمة المرور';
                  }
                  if (value != _passwordController.text) {
                    return 'كلمة المرور غير متطابقة';
                  }
                  return null;
                },
              ),
              
              const SizedBox(height: AppConstants.defaultPadding),
              
              // Terms and Conditions
              Row(
                children: [
                  Checkbox(
                    value: _agreeToTerms,
                    onChanged: (value) {
                      setState(() {
                        _agreeToTerms = value ?? false;
                      });
                    },
                    activeColor: AppConstants.primaryGold,
                  ),
                  Expanded(
                    child: RichText(
                      text: const TextSpan(
                        style: TextStyle(
                          fontSize: AppConstants.captionFontSize,
                          color: AppConstants.textSecondary,
                        ),
                        children: [
                          TextSpan(text: 'أوافق على '),
                          TextSpan(
                            text: 'الشروط والأحكام',
                            style: TextStyle(
                              color: AppConstants.primaryGold,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(text: ' و '),
                          TextSpan(
                            text: 'سياسة الخصوصية',
                            style: TextStyle(
                              color: AppConstants.primaryGold,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: AppConstants.largePadding),
              
              // Register Button
              CustomButton(
                text: AppConstants.register,
                onPressed: _agreeToTerms ? _handleRegister : null,
                isLoading: false,
              ),
              
              const SizedBox(height: AppConstants.defaultPadding),
              
              // Divider
              Row(
                children: [
                  const Expanded(child: Divider()),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: AppConstants.defaultPadding),
                    child: Text(
                      'أو',
                      style: TextStyle(
                        color: AppConstants.textSecondary,
                        fontSize: AppConstants.captionFontSize,
                      ),
                    ),
                  ),
                  const Expanded(child: Divider()),
                ],
              ),
              
              const SizedBox(height: AppConstants.defaultPadding),
              
              // Social Register Buttons
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {
                        // Google register
                      },
                      icon: const Icon(Icons.g_mobiledata, color: Colors.red),
                      label: const Text('Google'),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        side: const BorderSide(color: AppConstants.borderColor),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppConstants.borderRadius),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: AppConstants.defaultPadding),
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {
                        // Apple register
                      },
                      icon: const Icon(Icons.apple, color: Colors.black),
                      label: const Text('Apple'),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        side: const BorderSide(color: AppConstants.borderColor),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppConstants.borderRadius),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: AppConstants.largePadding),
              
              // Login Link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'لديك حساب بالفعل؟ ',
                    style: TextStyle(
                      fontSize: AppConstants.captionFontSize,
                      color: AppConstants.textSecondary,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: const Text(
                      AppConstants.login,
                      style: TextStyle(
                        color: AppConstants.primaryGold,
                        fontSize: AppConstants.captionFontSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleRegister() {
    if (_formKey.currentState!.validate()) {
      // TODO: Implement register logic
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('تم إنشاء الحساب بنجاح'),
          backgroundColor: AppConstants.successColor,
        ),
      );
      
      // Navigate to home screen
      Navigator.pushReplacementNamed(context, '/home');
    }
  }
}
