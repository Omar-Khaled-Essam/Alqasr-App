import 'package:flutter/material.dart';
import '../utils/constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;
  final List<Widget>? actions;
  final Widget? leading;
  final Color? backgroundColor;
  final Color? foregroundColor;

  const CustomAppBar({
    Key? key,
    required this.title,
    this.showBackButton = true,
    this.actions,
    this.leading,
    this.backgroundColor,
    this.foregroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(
          color: foregroundColor ?? AppConstants.textPrimary,
          fontSize: AppConstants.subtitleFontSize,
          fontWeight: FontWeight.w600,
        ),
      ),
      backgroundColor: backgroundColor ?? AppConstants.backgroundColor,
      elevation: 0,
      centerTitle: true,
      leading: showBackButton
          ? (leading ??
              IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: foregroundColor ?? AppConstants.textPrimary,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ))
          : null,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

// Special AppBar for screens with status bar info (like the design shows "9:41")
class StatusAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;
  final List<Widget>? actions;
  final Widget? leading;

  const StatusAppBar({
    Key? key,
    required this.title,
    this.showBackButton = true,
    this.actions,
    this.leading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          // Status bar simulation
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '9:41',
                style: TextStyle(
                  color: AppConstants.textPrimary,
                  fontSize: AppConstants.captionFontSize,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  Icon(
                    Icons.signal_cellular_4_bar,
                    size: 16,
                    color: AppConstants.textPrimary,
                  ),
                  const SizedBox(width: 4),
                  Icon(
                    Icons.wifi,
                    size: 16,
                    color: AppConstants.textPrimary,
                  ),
                  const SizedBox(width: 4),
                  Icon(
                    Icons.battery_full,
                    size: 16,
                    color: AppConstants.textPrimary,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          // Main title
          Text(
            title,
            style: TextStyle(
              color: AppConstants.textPrimary,
              fontSize: AppConstants.subtitleFontSize,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
      backgroundColor: AppConstants.backgroundColor,
      elevation: 0,
      centerTitle: true,
      leading: showBackButton
          ? (leading ??
              IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: AppConstants.textPrimary,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ))
          : null,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 30);
}
