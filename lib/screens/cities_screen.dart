import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/bottom_navigation.dart';
import '../widgets/custom_card.dart';

class CitiesScreen extends StatefulWidget {
  const CitiesScreen({Key? key}) : super(key: key);

  @override
  State<CitiesScreen> createState() => _CitiesScreenState();
}

class _CitiesScreenState extends State<CitiesScreen> {
  int _currentIndex = 0; // Cities tab

  final List<Map<String, String>> _cities = const [
    {
      'name': 'مدينة الرياض',
      'image': 'https://images.unsplash.com/photo-1509610696553-9243b4e6d2ef?q=80&w=800&auto=format&fit=crop',
    },
    {
      'name': 'مدينة الطائف',
      'image': 'https://images.unsplash.com/photo-1565877615554-b2699f09434e?q=80&w=800&auto=format&fit=crop',
    },
    {
      'name': 'مدينة الخبر',
      'image': 'https://images.unsplash.com/photo-1544551763-7ef0463fa217?q=80&w=800&auto=format&fit=crop',
    },
    {
      'name': 'مدينة دبي',
      'image': 'https://images.unsplash.com/photo-1498496294664-89c02f1d7b5c?q=80&w=800&auto=format&fit=crop',
    },
    {
      'name': 'مدينة الساحل',
      'image': 'https://images.unsplash.com/photo-1526481280698-8fcc13fd3459?q=80&w=800&auto=format&fit=crop',
    },
    {
      'name': 'مدينة البندر',
      'image': 'https://images.unsplash.com/photo-1537996194471-e657df975ab4?q=80&w=800&auto=format&fit=crop',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const StatusAppBar(
        title: 'المدن',
        showBackButton: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: AppConstants.smallPadding,
          mainAxisSpacing: AppConstants.smallPadding,
          // Make tiles a bit taller to accommodate label below image
          childAspectRatio: 0.85,
        ),
        itemCount: _cities.length,
        itemBuilder: (context, index) {
          final city = _cities[index];
          return CustomCard(
            padding: EdgeInsets.zero,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(AppConstants.borderRadius),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Image.network(
                      city['image']!,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: AppConstants.borderColor,
                          child: const Icon(
                            Icons.location_city,
                            color: AppConstants.textSecondary,
                            size: 40,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: AppConstants.smallPadding),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppConstants.smallPadding),
                  child: Text(
                    city['name']!,
                    style: const TextStyle(
                      fontSize: AppConstants.smallFontSize,
                      color: AppConstants.textSecondary,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/city-rooms',
                arguments: {
                  'cityName': city['name'],
                  'imageUrl': city['image'],
                },
              );
            },
          );
        },
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
        // Already on Cities
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
