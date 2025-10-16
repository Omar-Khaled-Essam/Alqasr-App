import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_card.dart';
import '../widgets/section_header.dart';
import '../widgets/bottom_navigation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 2; // Home button is at index 2

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const StatusAppBar(
        title: AppConstants.appNameArabic,
        showBackButton: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero Section
            _buildHeroSection(),

            // Explore Brands Section
            _buildBrandsSection(),

            // Most Popular Hotels Section
            _buildPopularHotelsSection(),

            // Promotional Banner
            _buildPromotionalBanner(),

            // Latest News Section
            _buildNewsSection(),

            const SizedBox(height: 100), // Space for bottom navigation
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigation(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          _handleNavigation(index);
        },
      ),
    );
  }

  Widget _buildHeroSection() {
    return Container(
      height: 200,
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
            // Placeholder for hotel image
            Container(
              width: double.infinity,
              height: double.infinity,
              color: AppConstants.primaryGold.withOpacity(0.3),
              child: const Icon(
                Icons.hotel,
                size: 80,
                color: AppConstants.primaryGold,
              ),
            ),
            // Gradient overlay
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
                ),
              ),
            ),
            // Content
            Positioned(
              bottom: AppConstants.defaultPadding,
              left: AppConstants.defaultPadding,
              right: AppConstants.defaultPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'استكشف أفضل الفنادق',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: AppConstants.subtitleFontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'اكتشف تجربة إقامة لا تُنسى',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: AppConstants.bodyFontSize,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBrandsSection() {
    return Column(
      children: [
        SectionHeader(
          title: AppConstants.exploreBrands,
          onSeeAll: () {
            // Navigate to brands screen
          },
        ),
        SizedBox(
          height: 170,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.defaultPadding,
            ),
            itemCount: 3,
            itemBuilder: (context, index) {
              return BrandCard(
                imageUrl: 'https://via.placeholder.com/120x120',
                title: index == 0
                    ? 'القصر'
                    : index == 1
                    ? 'جاردن ملينيوم'
                    : 'فندق آخر',
                onTap: () {
                  // Navigate to brand details
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildPopularHotelsSection() {
    return Column(
      children: [
        SectionHeader(
          title: AppConstants.mostPopularHotels,
          onSeeAll: () {
            // Navigate to all hotels
          },
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 2,
          itemBuilder: (context, index) {
            return HotelCard(
              imageUrl: 'https://via.placeholder.com/400x200',
              title: index == 0 ? 'جاردن آنها' : 'جاردن أحد رفيده',
              location: index == 0 ? 'الرياض' : 'أحد رفيده',
              price:
                  '${293 + (index * 100)} ${AppConstants.sar} / ${AppConstants.night}',
              rating: '8.${index + 2}',
              onTap: () {
                // Navigate to hotel details
              },
            );
          },
        ),
      ],
    );
  }

  Widget _buildPromotionalBanner() {
    return const PromotionalBanner(
      title: 'الحق ولا ملحق',
      subtitle: 'خصم خاص لفترة محدودة',
      discount: '20%',
      onTap: null,
    );
  }

  Widget _buildNewsSection() {
    return Column(
      children: [
        SectionHeader(
          title: AppConstants.latestNews,
          onSeeAll: () {
            // Navigate to news/blog
          },
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 3,
          itemBuilder: (context, index) {
            return NewsCard(
              imageUrl: 'https://via.placeholder.com/80x80',
              title: index == 0
                  ? 'افتتاح فرع جديد الفنادق القصر بالرياض المجموعة ملينيوم السعودية'
                  : index == 1
                  ? 'أحدث التحديثات في خدمات الفنادق'
                  : 'عروض خاصة لفصل الصيف',
              date: '2023-07-17',
              onTap: () {
                // Navigate to article
              },
            );
          },
        ),
      ],
    );
  }

  void _handleNavigation(int index) {
    switch (index) {
      case 0:
        // Cities - Navigate to cities screen
        Navigator.pushNamed(context, '/cities');
        break;
      case 1:
        // News Blog - Navigate to news/blog screen
        Navigator.pushNamed(context, '/blog');
        break;
      case 2:
        // Home - Already on home
        break;
      case 3:
        // My Reservations
        Navigator.pushNamed(context, '/reservations');
        break;
      case 4:
        // My Profile
        Navigator.pushNamed(context, '/profile');
        break;
    }
  }
}
