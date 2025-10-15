import 'package:flutter/material.dart';
import '../utils/constants.dart';

class CustomBottomNavigation extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigation({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppConstants.backgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.defaultPadding,
            vertical: AppConstants.smallPadding,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(
                icon: Icons.home,
                label: AppConstants.homeLabel,
                index: 0,
              ),
              _buildNavItem(
                icon: Icons.calendar_today,
                label: AppConstants.bookingsLabel,
                index: 1,
              ),
              _buildNavItem(
                icon: Icons.shopping_bag,
                label: AppConstants.cartLabel,
                index: 2,
              ),
              _buildNavItem(
                icon: Icons.chat_bubble,
                label: AppConstants.chatLabel,
                index: 3,
              ),
              _buildNavItem(
                icon: Icons.person,
                label: AppConstants.profileLabel,
                index: 4,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required int index,
  }) {
    final isSelected = currentIndex == index;
    
    return GestureDetector(
      onTap: () => onTap(index),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppConstants.smallPadding,
          vertical: AppConstants.smallPadding,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected 
                  ? AppConstants.primaryGold 
                  : AppConstants.textSecondary,
              size: 24,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: AppConstants.smallFontSize,
                color: isSelected 
                    ? AppConstants.primaryGold 
                    : AppConstants.textSecondary,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Tab Bar Widget for sections like "My Reservations"
class CustomTabBar extends StatelessWidget {
  final List<String> tabs;
  final int selectedIndex;
  final Function(int) onTap;

  const CustomTabBar({
    Key? key,
    required this.tabs,
    required this.selectedIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(
        horizontal: AppConstants.defaultPadding,
        vertical: AppConstants.smallPadding,
      ),
      decoration: BoxDecoration(
        color: AppConstants.borderColor.withOpacity(0.3),
        borderRadius: BorderRadius.circular(AppConstants.borderRadius),
      ),
      child: Row(
        children: tabs.asMap().entries.map((entry) {
          final index = entry.key;
          final tab = entry.value;
          final isSelected = selectedIndex == index;
          
          return Expanded(
            child: GestureDetector(
              onTap: () => onTap(index),
              child: Container(
                margin: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: isSelected 
                      ? AppConstants.primaryGold 
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(AppConstants.borderRadius - 4),
                ),
                child: Center(
                  child: Text(
                    tab,
                    style: TextStyle(
                      fontSize: AppConstants.captionFontSize,
                      fontWeight: FontWeight.w600,
                      color: isSelected 
                          ? Colors.white 
                          : AppConstants.textSecondary,
                    ),
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
