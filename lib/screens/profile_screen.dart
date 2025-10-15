import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../widgets/custom_app_bar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isLoggedIn = false; // This should come from your auth state management

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const StatusAppBar(
        title: AppConstants.profileLabel,
        showBackButton: true,
      ),
      body: _isLoggedIn ? _buildLoggedInProfile() : _buildGuestProfile(),
    );
  }

  Widget _buildGuestProfile() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppConstants.defaultPadding),
      child: Column(
        children: [
          const SizedBox(height: AppConstants.largePadding * 2),
          
          // Guest Icon
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: AppConstants.primaryGold.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.person_outline,
              size: 60,
              color: AppConstants.primaryGold,
            ),
          ),
          
          const SizedBox(height: AppConstants.largePadding),
          
          const Text(
            'مرحباً بك',
            style: TextStyle(
              fontSize: AppConstants.titleFontSize,
              fontWeight: FontWeight.bold,
              color: AppConstants.textPrimary,
            ),
          ),
          
          const SizedBox(height: AppConstants.smallPadding),
          
          const Text(
            'سجل دخولك للاستمتاع بخدماتنا المميزة',
            style: TextStyle(
              fontSize: AppConstants.bodyFontSize,
              color: AppConstants.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
          
          const SizedBox(height: AppConstants.largePadding * 2),
          
          // Login Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppConstants.primaryGold,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppConstants.borderRadius),
                ),
              ),
              child: const Text(
                AppConstants.login,
                style: TextStyle(
                  fontSize: AppConstants.bodyFontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          
          const SizedBox(height: AppConstants.defaultPadding),
          
          // Register Button
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: AppConstants.primaryGold),
                foregroundColor: AppConstants.primaryGold,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppConstants.borderRadius),
                ),
              ),
              child: const Text(
                AppConstants.register,
                style: TextStyle(
                  fontSize: AppConstants.bodyFontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          
          const SizedBox(height: AppConstants.largePadding * 2),
          
          // Guest Menu Items
          _buildMenuSection([
            _buildMenuItem(
              icon: Icons.hotel,
              title: 'استكشف الفنادق',
              onTap: () => Navigator.pushNamed(context, '/home'),
            ),
            _buildMenuItem(
              icon: Icons.info_outline,
              title: 'عن التطبيق',
              onTap: () => _showAboutDialog(),
            ),
            _buildMenuItem(
              icon: Icons.phone,
              title: 'تواصل معنا',
              onTap: () => _showContactDialog(),
            ),
            _buildMenuItem(
              icon: Icons.help_outline,
              title: 'المساعدة',
              onTap: () => _showHelpDialog(),
            ),
          ]),
        ],
      ),
    );
  }

  Widget _buildLoggedInProfile() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppConstants.defaultPadding),
      child: Column(
        children: [
          const SizedBox(height: AppConstants.largePadding),
          
          // Profile Header
          Container(
            padding: const EdgeInsets.all(AppConstants.largePadding),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppConstants.primaryGold,
                  AppConstants.primaryGoldDark,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(AppConstants.borderRadius),
            ),
            child: Column(
              children: [
                // Profile Picture
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.person,
                    size: 50,
                    color: AppConstants.primaryGold,
                  ),
                ),
                
                const SizedBox(height: AppConstants.defaultPadding),
                
                // User Name
                const Text(
                  'أحمد محمد',
                  style: TextStyle(
                    fontSize: AppConstants.titleFontSize,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                
                const SizedBox(height: AppConstants.smallPadding),
                
                // User Email
                const Text(
                  'ahmed@example.com',
                  style: TextStyle(
                    fontSize: AppConstants.bodyFontSize,
                    color: Colors.white70,
                  ),
                ),
                
                const SizedBox(height: AppConstants.defaultPadding),
                
                // Edit Profile Button
                OutlinedButton(
                  onPressed: () => _editProfile(),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.white),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppConstants.borderRadius),
                    ),
                  ),
                  child: const Text('تعديل الملف الشخصي'),
                ),
              ],
            ),
          ),
          
          const SizedBox(height: AppConstants.largePadding),
          
          // Quick Stats
          Row(
            children: [
              Expanded(
                child: _buildStatCard('الحجوزات', '12', Icons.hotel),
              ),
              const SizedBox(width: AppConstants.defaultPadding),
              Expanded(
                child: _buildStatCard('النقاط', '1,250', Icons.stars),
              ),
              const SizedBox(width: AppConstants.defaultPadding),
              Expanded(
                child: _buildStatCard('المكافآت', '5', Icons.card_giftcard),
              ),
            ],
          ),
          
          const SizedBox(height: AppConstants.largePadding),
          
          // Menu Sections
          _buildMenuSection([
            _buildMenuItem(
              icon: Icons.hotel,
              title: AppConstants.myReservations,
              onTap: () => Navigator.pushNamed(context, '/reservations'),
            ),
            _buildMenuItem(
              icon: Icons.favorite_outline,
              title: 'المفضلة',
              onTap: () => _showFavorites(),
            ),
            _buildMenuItem(
              icon: Icons.notifications_outlined,
              title: 'الإشعارات',
              onTap: () => _showNotifications(),
            ),
            _buildMenuItem(
              icon: Icons.payment,
              title: 'طرق الدفع',
              onTap: () => _showPaymentMethods(),
            ),
          ]),
          
          const SizedBox(height: AppConstants.defaultPadding),
          
          _buildMenuSection([
            _buildMenuItem(
              icon: Icons.help_outline,
              title: 'المساعدة والدعم',
              onTap: () => _showHelpDialog(),
            ),
            _buildMenuItem(
              icon: Icons.info_outline,
              title: 'عن التطبيق',
              onTap: () => _showAboutDialog(),
            ),
            _buildMenuItem(
              icon: Icons.phone,
              title: 'تواصل معنا',
              onTap: () => _showContactDialog(),
            ),
            _buildMenuItem(
              icon: Icons.settings,
              title: 'الإعدادات',
              onTap: () => _showSettings(),
            ),
          ]),
          
          const SizedBox(height: AppConstants.largePadding),
          
          // Logout Button
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () => _logout(),
              icon: const Icon(Icons.logout, color: AppConstants.errorColor),
              label: const Text(
                'تسجيل الخروج',
                style: TextStyle(color: AppConstants.errorColor),
              ),
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: AppConstants.errorColor),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppConstants.borderRadius),
                ),
              ),
            ),
          ),
          
          const SizedBox(height: AppConstants.largePadding),
        ],
      ),
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(AppConstants.defaultPadding),
      decoration: BoxDecoration(
        color: AppConstants.cardBackground,
        borderRadius: BorderRadius.circular(AppConstants.borderRadius),
        border: Border.all(color: AppConstants.borderColor),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: AppConstants.primaryGold,
            size: 30,
          ),
          const SizedBox(height: AppConstants.smallPadding),
          Text(
            value,
            style: const TextStyle(
              fontSize: AppConstants.subtitleFontSize,
              fontWeight: FontWeight.bold,
              color: AppConstants.textPrimary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: const TextStyle(
              fontSize: AppConstants.captionFontSize,
              color: AppConstants.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildMenuSection(List<Widget> items) {
    return Container(
      decoration: BoxDecoration(
        color: AppConstants.cardBackground,
        borderRadius: BorderRadius.circular(AppConstants.borderRadius),
        border: Border.all(color: AppConstants.borderColor),
      ),
      child: Column(
        children: items,
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: AppConstants.primaryGold,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: AppConstants.bodyFontSize,
          color: AppConstants.textPrimary,
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: AppConstants.textSecondary,
      ),
      onTap: onTap,
    );
  }

  void _editProfile() {
    // TODO: Navigate to edit profile screen
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('سيتم توجيهك إلى صفحة تعديل الملف الشخصي'),
        backgroundColor: AppConstants.primaryGold,
      ),
    );
  }

  void _showFavorites() {
    // TODO: Navigate to favorites screen
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('سيتم توجيهك إلى صفحة المفضلة'),
        backgroundColor: AppConstants.primaryGold,
      ),
    );
  }

  void _showNotifications() {
    // TODO: Navigate to notifications screen
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('سيتم توجيهك إلى صفحة الإشعارات'),
        backgroundColor: AppConstants.primaryGold,
      ),
    );
  }

  void _showPaymentMethods() {
    // TODO: Navigate to payment methods screen
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('سيتم توجيهك إلى صفحة طرق الدفع'),
        backgroundColor: AppConstants.primaryGold,
      ),
    );
  }

  void _showSettings() {
    // TODO: Navigate to settings screen
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('سيتم توجيهك إلى صفحة الإعدادات'),
        backgroundColor: AppConstants.primaryGold,
      ),
    );
  }

  void _logout() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('تسجيل الخروج'),
        content: const Text('هل أنت متأكد من تسجيل الخروج؟'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('إلغاء'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                _isLoggedIn = false;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('تم تسجيل الخروج بنجاح'),
                  backgroundColor: AppConstants.successColor,
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppConstants.errorColor,
              foregroundColor: Colors.white,
            ),
            child: const Text('تسجيل الخروج'),
          ),
        ],
      ),
    );
  }

  void _showAboutDialog() {
    showAboutDialog(
      context: context,
      applicationName: AppConstants.appName,
      applicationVersion: '1.0.0',
      applicationIcon: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppConstants.primaryGold,
              AppConstants.primaryGoldDark,
            ],
          ),
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.star,
          color: Colors.white,
          size: 30,
        ),
      ),
      children: [
        const Text(
          'تطبيق القصر للفنادق - منصة حجز الفنادق الرائدة في المملكة العربية السعودية',
        ),
      ],
    );
  }

  void _showContactDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('تواصل معنا'),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('📞 الهاتف: +966 11 123 4567'),
            SizedBox(height: 8),
            Text('📧 البريد الإلكتروني: info@alqasr.com'),
            SizedBox(height: 8),
            Text('🌐 الموقع: www.alqasr.com'),
            SizedBox(height: 8),
            Text('📍 العنوان: الرياض، المملكة العربية السعودية'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('إغلاق'),
          ),
        ],
      ),
    );
  }

  void _showHelpDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('المساعدة'),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('❓ كيفية حجز فندق؟'),
            SizedBox(height: 8),
            Text('❓ كيفية إلغاء الحجز؟'),
            SizedBox(height: 8),
            Text('❓ كيفية تعديل الحجز؟'),
            SizedBox(height: 8),
            Text('❓ مشاكل في الدفع؟'),
            SizedBox(height: 8),
            Text('❓ أسئلة أخرى؟'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('إغلاق'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              _showContactDialog();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppConstants.primaryGold,
              foregroundColor: Colors.white,
            ),
            child: const Text('تواصل معنا'),
          ),
        ],
      ),
    );
  }
}
