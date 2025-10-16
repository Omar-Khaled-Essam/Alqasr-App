import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/bottom_navigation.dart';
import '../widgets/custom_card.dart';
import '../widgets/hotel_widgets.dart';

class CityRoomsScreen extends StatefulWidget {
  const CityRoomsScreen({Key? key}) : super(key: key);

  @override
  State<CityRoomsScreen> createState() => _CityRoomsScreenState();
}

class _CityRoomsScreenState extends State<CityRoomsScreen> {
  int _currentIndex = 2; // Home-centered until coming from tabs

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final String cityName = args != null && args['cityName'] != null ? args['cityName'] as String : 'أحد رفيده';
    final String? heroImage = args != null ? args['imageUrl'] as String? : null;

    return Scaffold(
      appBar: StatusAppBar(
        title: cityName,
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero banner like the provided design
            _buildHero(heroImage),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppConstants.defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: AppConstants.defaultPadding),
                  const Text(
                    'إستكشف الفنادق',
                    style: TextStyle(
                      fontSize: AppConstants.subtitleFontSize,
                      fontWeight: FontWeight.w600,
                      color: AppConstants.primaryGold,
                    ),
                  ),
                  const SizedBox(height: AppConstants.smallPadding),
                  _buildBrandsChips(),

                  const SizedBox(height: AppConstants.defaultPadding),
                  const Text(
                    'إستكشف الغرف',
                    style: TextStyle(
                      fontSize: AppConstants.subtitleFontSize,
                      fontWeight: FontWeight.w600,
                      color: AppConstants.primaryGold,
                    ),
                  ),
                  const SizedBox(height: AppConstants.smallPadding),

                  // Sample rooms cards
                  HotelWidgets.roomSelectionCard(
                    imageUrl: 'https://images.unsplash.com/photo-1505691723518-36a5ac3b2a59?q=80&w=1200&auto=format&fit=crop',
                    roomType: 'Standard',
                    roomTypeArabic: 'غرفة قياسية - القصر المِسْك',
                    price: 293,
                    currency: AppConstants.sar,
                    maxOccupancy: 2,
                    bedCount: 1,
                    bedType: 'سرير',
                    area: 24,
                    areaUnit: 'م²',
                    amenities: const ['واي فاي', 'تلفاز', 'مكيف'],
                  ),
                  HotelWidgets.roomSelectionCard(
                    imageUrl: 'https://images.unsplash.com/photo-1496417263034-38ec4f0b665a?q=80&w=1200&auto=format&fit=crop',
                    roomType: 'Deluxe',
                    roomTypeArabic: 'غرفة ديلوكس - القصر المِسْك',
                    price: 420,
                    currency: AppConstants.sar,
                    maxOccupancy: 3,
                    bedCount: 2,
                    bedType: 'أسِرّة',
                    area: 32,
                    areaUnit: 'م²',
                    amenities: const ['إفطار', 'خدمة الغرف', 'موقف'],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigation(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() => _currentIndex = index);
          _handleNavigation(index);
        },
      ),
    );
  }

  Widget _buildHero(String? imageUrl) {
    return Container(
      height: 180,
      margin: const EdgeInsets.all(AppConstants.defaultPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppConstants.borderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppConstants.borderRadius),
        child: Stack(
          children: [
            Positioned.fill(
              child: imageUrl != null
                  ? Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                    )
                  : Container(color: AppConstants.primaryGold.withOpacity(0.3)),
            ),
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
                  ),
                ),
              ),
            ),
            const Positioned(
              left: AppConstants.defaultPadding,
              right: AppConstants.defaultPadding,
              bottom: AppConstants.defaultPadding,
              child: Text(
                'خطط لرحلتك المثالية، ابحث واختر أفضل الغرف في فنادق القصر بمدينة الرياض والدمام، جدة وأبها',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: AppConstants.smallFontSize,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildBrandsChips() {
    final brands = ['القصر', 'القصر للمِسْك', 'جاردن أحد'];

    return SizedBox(
      height: 80,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: AppConstants.defaultPadding),
        itemBuilder: (context, index) {
          return Column(
            children: [
              CircleAvatar(
                radius: 28,
                backgroundColor: AppConstants.primaryGold.withOpacity(0.15),
                child: const Icon(Icons.castle, color: AppConstants.primaryGold),
              ),
              const SizedBox(height: 8),
              Text(
                brands[index],
                style: const TextStyle(fontSize: AppConstants.smallFontSize),
              )
            ],
          );
        },
        separatorBuilder: (_, __) => const SizedBox(width: 16),
        itemCount: brands.length,
      ),
    );
  }

  void _handleNavigation(int index) {
    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/cities');
        break;
      case 1:
        Navigator.pushNamed(context, '/blog');
        break;
      case 2:
        Navigator.pushNamed(context, '/home');
        break;
      case 3:
        Navigator.pushNamed(context, '/reservations');
        break;
      case 4:
        Navigator.pushNamed(context, '/profile');
        break;
    }
  }
}
