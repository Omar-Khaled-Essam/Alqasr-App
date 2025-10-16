import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/bottom_navigation.dart';
import '../widgets/custom_card.dart';

class BlogScreen extends StatefulWidget {
  const BlogScreen({Key? key}) : super(key: key);

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  int _currentIndex = 1; // Blog tab

  final List<Map<String, String>> _featured = const [
    {
      'title': 'افتتاح فرع جديد لفنادق القصر بالرياض',
      'date': 'يونيو 6, 2023',
      'image': 'https://images.unsplash.com/photo-1512453979798-5ea266f8880c?q=80&w=1200&auto=format&fit=crop',
    },
    {
      'title': 'افتتاح فرع جديد لفنادق...',
      'date': 'يونيو 6, 2023',
      'image': 'https://images.unsplash.com/photo-1508612761958-e931d843bddc?q=80&w=1200&auto=format&fit=crop',
    },
  ];

  final List<Map<String, String>> _articles = const [
    {
      'title': 'افتتاح فرع جديد لفنادق القصر بالرياض',
      'date': 'يونيو 6, 2023',
      'image': 'https://images.unsplash.com/photo-1520972106213-8e2d6fd6d2da?q=80&w=400&auto=format&fit=crop',
    },
    {
      'title': 'قائمة بأهم وأشهر الفنادق للسفر والإقامة بها حول العالم',
      'date': 'يونيو 6, 2023',
      'image': 'https://images.unsplash.com/photo-1499951360447-b19be8fe80f5?q=80&w=400&auto=format&fit=crop',
    },
    {
      'title': 'تقييم حالات الإعلانات عن طريق مواقع التواصل الاجتماعي في العام 2022',
      'date': 'يونيو 6, 2023',
      'image': 'https://images.unsplash.com/photo-1510557880182-3d4d3cba35fc?q=80&w=400&auto=format&fit=crop',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const StatusAppBar(
        title: 'المدونة',
        showBackButton: true,
      ),
      body: ListView(
        padding: const EdgeInsets.only(bottom: 120),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.defaultPadding,
              vertical: AppConstants.smallPadding,
            ),
            child: const Text(
              'تعرّف على أخبارنا',
              style: TextStyle(
                fontSize: AppConstants.bodyFontSize,
                color: AppConstants.textSecondary,
              ),
            ),
          ),

          // Featured row
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppConstants.defaultPadding),
            child: const Text(
              'المقالات الأكثر قراءة',
              style: TextStyle(
                fontSize: AppConstants.subtitleFontSize,
                fontWeight: FontWeight.w600,
                color: AppConstants.textPrimary,
              ),
            ),
          ),
          const SizedBox(height: AppConstants.smallPadding),
          SizedBox(
            height: 140,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: AppConstants.defaultPadding),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final item = _featured[index];
                return SizedBox(
                  width: 220,
                  child: CustomCard(
                    padding: EdgeInsets.zero,
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(AppConstants.borderRadius),
                            child: Image.network(
                              item['image']!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          left: AppConstants.smallPadding,
                          right: AppConstants.smallPadding,
                          bottom: AppConstants.smallPadding,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['title']!,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                item['date']!,
                                style: const TextStyle(color: Colors.white70, fontSize: AppConstants.smallFontSize),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    onTap: () {},
                  ),
                );
              },
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemCount: _featured.length,
            ),
          ),
          const SizedBox(height: AppConstants.defaultPadding),

          // Articles list
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final article = _articles[index];
              return CustomCard(
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(AppConstants.borderRadius),
                      child: Image.network(
                        article['image']!,
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: AppConstants.defaultPadding),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            article['date']!,
                            style: const TextStyle(
                              fontSize: AppConstants.smallFontSize,
                              color: AppConstants.textSecondary,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            article['title']!,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: AppConstants.bodyFontSize,
                              color: AppConstants.textPrimary,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                onTap: () {},
              );
            },
            separatorBuilder: (_, __) => const SizedBox(height: 8),
            itemCount: _articles.length,
          ),
        ],
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

  void _handleNavigation(int index) {
    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/cities');
        break;
      case 1:
        // Already on blog
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
