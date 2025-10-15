import 'package:flutter/material.dart';
import '../utils/constants.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? elevation;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;
  final VoidCallback? onTap;
  final bool showShadow;

  const CustomCard({
    Key? key,
    required this.child,
    this.padding,
    this.margin,
    this.elevation,
    this.backgroundColor,
    this.borderRadius,
    this.onTap,
    this.showShadow = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget card = Container(
      margin: margin ?? const EdgeInsets.all(AppConstants.smallPadding),
      decoration: BoxDecoration(
        color: backgroundColor ?? AppConstants.cardBackground,
        borderRadius: borderRadius ?? BorderRadius.circular(AppConstants.borderRadius),
        boxShadow: showShadow
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: elevation ?? AppConstants.cardElevation * 2,
                  offset: const Offset(0, 2),
                ),
              ]
            : null,
      ),
      child: Padding(
        padding: padding ?? const EdgeInsets.all(AppConstants.defaultPadding),
        child: child,
      ),
    );

    if (onTap != null) {
      return InkWell(
        onTap: onTap,
        borderRadius: borderRadius ?? BorderRadius.circular(AppConstants.borderRadius),
        child: card,
      );
    }

    return card;
  }
}

// Hotel Card Widget - Reusable for displaying hotel information
class HotelCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String? location;
  final String? price;
  final String? rating;
  final VoidCallback? onTap;
  final List<Widget>? actions;

  const HotelCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    this.location,
    this.price,
    this.rating,
    this.onTap,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Hotel Image
          ClipRRect(
            borderRadius: BorderRadius.circular(AppConstants.borderRadius),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: AppConstants.borderColor,
                    child: const Icon(
                      Icons.hotel,
                      size: 50,
                      color: AppConstants.textSecondary,
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: AppConstants.smallPadding),
          
          // Hotel Title
          Text(
            title,
            style: const TextStyle(
              fontSize: AppConstants.bodyFontSize,
              fontWeight: FontWeight.w600,
              color: AppConstants.textPrimary,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          
          if (location != null) ...[
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(
                  Icons.location_on,
                  size: 16,
                  color: AppConstants.textSecondary,
                ),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    location!,
                    style: const TextStyle(
                      fontSize: AppConstants.captionFontSize,
                      color: AppConstants.textSecondary,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],
          
          const SizedBox(height: AppConstants.smallPadding),
          
          // Price and Rating Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (price != null)
                Text(
                  price!,
                  style: const TextStyle(
                    fontSize: AppConstants.bodyFontSize,
                    fontWeight: FontWeight.w600,
                    color: AppConstants.primaryGold,
                  ),
                ),
              if (rating != null)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppConstants.primaryGold.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    rating!,
                    style: const TextStyle(
                      fontSize: AppConstants.smallFontSize,
                      fontWeight: FontWeight.w600,
                      color: AppConstants.primaryGold,
                    ),
                  ),
                ),
            ],
          ),
          
          if (actions != null) ...[
            const SizedBox(height: AppConstants.smallPadding),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: actions!,
            ),
          ],
        ],
      ),
    );
  }
}

// Brand Card Widget - For horizontal scrolling brand cards
class BrandCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final VoidCallback? onTap;

  const BrandCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      margin: const EdgeInsets.only(right: AppConstants.smallPadding),
      child: CustomCard(
        onTap: onTap,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(AppConstants.borderRadius),
              child: AspectRatio(
                aspectRatio: 1,
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: AppConstants.borderColor,
                      child: const Icon(
                        Icons.business,
                        size: 30,
                        color: AppConstants.textSecondary,
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: AppConstants.smallPadding),
            Text(
              title,
              style: const TextStyle(
                fontSize: AppConstants.captionFontSize,
                fontWeight: FontWeight.w500,
                color: AppConstants.textPrimary,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

// News Card Widget - For blog/news articles
class NewsCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String date;
  final VoidCallback? onTap;

  const NewsCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.date,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      onTap: onTap,
      child: Row(
        children: [
          // News Image
          ClipRRect(
            borderRadius: BorderRadius.circular(AppConstants.borderRadius),
            child: SizedBox(
              width: 80,
              height: 80,
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: AppConstants.borderColor,
                    child: const Icon(
                      Icons.article,
                      size: 30,
                      color: AppConstants.textSecondary,
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(width: AppConstants.smallPadding),
          
          // News Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: AppConstants.bodyFontSize,
                    fontWeight: FontWeight.w500,
                    color: AppConstants.textPrimary,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  date,
                  style: const TextStyle(
                    fontSize: AppConstants.smallFontSize,
                    color: AppConstants.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Promotional Banner Widget - For special offers and promotions
class PromotionalBanner extends StatelessWidget {
  final String title;
  final String subtitle;
  final String discount;
  final VoidCallback? onTap;
  final String? imageUrl;

  const PromotionalBanner({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.discount,
    this.onTap,
    this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: AppConstants.defaultPadding,
        vertical: AppConstants.smallPadding,
      ),
      child: CustomCard(
        onTap: onTap,
        backgroundColor: AppConstants.primaryGold,
        child: Container(
          height: 120,
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
          child: Stack(
            children: [
              // Background Pattern (optional)
              if (imageUrl != null)
                Positioned.fill(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(AppConstants.borderRadius),
                    child: Image.network(
                      imageUrl!,
                      fit: BoxFit.cover,
                      opacity: const AlwaysStoppedAnimation(0.1),
                    ),
                  ),
                ),
              
              // Content
              Padding(
                padding: const EdgeInsets.all(AppConstants.defaultPadding),
                child: Row(
                  children: [
                    // Text Content
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            title,
                            style: const TextStyle(
                              fontSize: AppConstants.subtitleFontSize,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            subtitle,
                            style: const TextStyle(
                              fontSize: AppConstants.bodyFontSize,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    // Discount Badge
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppConstants.defaultPadding,
                        vertical: AppConstants.smallPadding,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(AppConstants.borderRadius),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            discount,
                            style: const TextStyle(
                              fontSize: AppConstants.titleFontSize,
                              fontWeight: FontWeight.bold,
                              color: AppConstants.primaryGold,
                            ),
                          ),
                          const Text(
                            'خصم',
                            style: TextStyle(
                              fontSize: AppConstants.smallFontSize,
                              color: AppConstants.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}