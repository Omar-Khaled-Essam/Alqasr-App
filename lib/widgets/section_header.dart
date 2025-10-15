import 'package:flutter/material.dart';
import '../utils/constants.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget? action;
  final VoidCallback? onSeeAll;

  const SectionHeader({
    Key? key,
    required this.title,
    this.subtitle,
    this.action,
    this.onSeeAll,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstants.defaultPadding,
        vertical: AppConstants.smallPadding,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: AppConstants.subtitleFontSize,
                    fontWeight: FontWeight.w600,
                    color: AppConstants.textPrimary,
                  ),
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    subtitle!,
                    style: const TextStyle(
                      fontSize: AppConstants.captionFontSize,
                      color: AppConstants.textSecondary,
                    ),
                  ),
                ],
              ],
            ),
          ),
          if (action != null)
            action!
          else if (onSeeAll != null)
            TextButton(
              onPressed: onSeeAll,
              child: const Text(
                'عرض الكل',
                style: TextStyle(
                  fontSize: AppConstants.captionFontSize,
                  color: AppConstants.primaryGold,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

// Empty State Widget
class EmptyState extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String? buttonText;
  final VoidCallback? onButtonPressed;

  const EmptyState({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.buttonText,
    this.onButtonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.largePadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 80,
              color: AppConstants.textSecondary,
            ),
            const SizedBox(height: AppConstants.defaultPadding),
            Text(
              title,
              style: const TextStyle(
                fontSize: AppConstants.subtitleFontSize,
                fontWeight: FontWeight.w600,
                color: AppConstants.textPrimary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppConstants.smallPadding),
            Text(
              subtitle,
              style: const TextStyle(
                fontSize: AppConstants.bodyFontSize,
                color: AppConstants.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
            if (buttonText != null && onButtonPressed != null) ...[
              const SizedBox(height: AppConstants.largePadding),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onButtonPressed,
                  child: Text(buttonText!),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
