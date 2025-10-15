import 'package:flutter/material.dart';
import '../utils/constants.dart';
import 'custom_card.dart';

/// A collection of reusable hotel-related widgets
class HotelWidgets {
  // Private constructor to prevent instantiation
  HotelWidgets._();

  /// Hotel search card with image, name, location, and price
  static Widget hotelSearchCard({
    required String imageUrl,
    required String name,
    required String location,
    required double price,
    required String currency,
    double? rating,
    VoidCallback? onTap,
  }) {
    return CustomCard(
      onTap: onTap,
      child: Row(
        children: [
          // Hotel Image
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
                      Icons.hotel,
                      size: 30,
                      color: AppConstants.textSecondary,
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(width: AppConstants.defaultPadding),
          
          // Hotel Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: AppConstants.bodyFontSize,
                    fontWeight: FontWeight.w600,
                    color: AppConstants.textPrimary,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
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
                        location,
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
                if (rating != null) ...[
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        size: 16,
                        color: AppConstants.primaryGold,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        rating.toString(),
                        style: const TextStyle(
                          fontSize: AppConstants.captionFontSize,
                          color: AppConstants.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
          
          // Price
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '$price $currency',
                style: const TextStyle(
                  fontSize: AppConstants.subtitleFontSize,
                  fontWeight: FontWeight.bold,
                  color: AppConstants.primaryGold,
                ),
              ),
              const Text(
                'per night',
                style: TextStyle(
                  fontSize: AppConstants.smallFontSize,
                  color: AppConstants.textSecondary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Room selection card with image, type, amenities, and price
  static Widget roomSelectionCard({
    required String imageUrl,
    required String roomType,
    required String roomTypeArabic,
    required double price,
    required String currency,
    required int maxOccupancy,
    required int bedCount,
    required String bedType,
    required double area,
    required String areaUnit,
    required List<String> amenities,
    bool isSelected = false,
    VoidCallback? onTap,
  }) {
    return CustomCard(
      onTap: onTap,
      backgroundColor: isSelected ? AppConstants.primaryGold.withValues(alpha: 0.1) : null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Room Image
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
                      Icons.bed,
                      size: 50,
                      color: AppConstants.textSecondary,
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: AppConstants.smallPadding),
          
          // Room Type
          Text(
            roomTypeArabic,
            style: const TextStyle(
              fontSize: AppConstants.bodyFontSize,
              fontWeight: FontWeight.w600,
              color: AppConstants.textPrimary,
            ),
          ),
          const SizedBox(height: 4),
          
          // Room Details
          Row(
            children: [
              Icon(
                Icons.people,
                size: 16,
                color: AppConstants.textSecondary,
              ),
              const SizedBox(width: 4),
              Text(
                '$maxOccupancy ${AppConstants.guests}',
                style: const TextStyle(
                  fontSize: AppConstants.captionFontSize,
                  color: AppConstants.textSecondary,
                ),
              ),
              const SizedBox(width: AppConstants.defaultPadding),
              Icon(
                Icons.bed,
                size: 16,
                color: AppConstants.textSecondary,
              ),
              const SizedBox(width: 4),
              Text(
                '$bedCount $bedType',
                style: const TextStyle(
                  fontSize: AppConstants.captionFontSize,
                  color: AppConstants.textSecondary,
                ),
              ),
              const SizedBox(width: AppConstants.defaultPadding),
              Icon(
                Icons.square_foot,
                size: 16,
                color: AppConstants.textSecondary,
              ),
              const SizedBox(width: 4),
              Text(
                '$area $areaUnit',
                style: const TextStyle(
                  fontSize: AppConstants.captionFontSize,
                  color: AppConstants.textSecondary,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppConstants.smallPadding),
          
          // Amenities
          Wrap(
            spacing: 8,
            runSpacing: 4,
            children: amenities.take(3).map((amenity) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: AppConstants.primaryGold.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  amenity,
                  style: const TextStyle(
                    fontSize: AppConstants.smallFontSize,
                    color: AppConstants.primaryGold,
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: AppConstants.smallPadding),
          
          // Price and Selection
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$price $currency / ${AppConstants.night}',
                style: const TextStyle(
                  fontSize: AppConstants.subtitleFontSize,
                  fontWeight: FontWeight.bold,
                  color: AppConstants.primaryGold,
                ),
              ),
              if (isSelected)
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: AppConstants.primaryGold,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  /// Date selection widget for booking
  static Widget dateSelectionCard({
    required String label,
    required String date,
    required String dayOfWeek,
    VoidCallback? onTap,
  }) {
    return CustomCard(
      onTap: onTap,
      child: Row(
        children: [
          Icon(
            Icons.calendar_today,
            color: AppConstants.primaryGold,
            size: 24,
          ),
          const SizedBox(width: AppConstants.defaultPadding),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: AppConstants.captionFontSize,
                    color: AppConstants.textSecondary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  date,
                  style: const TextStyle(
                    fontSize: AppConstants.bodyFontSize,
                    fontWeight: FontWeight.w600,
                    color: AppConstants.textPrimary,
                  ),
                ),
                Text(
                  dayOfWeek,
                  style: const TextStyle(
                    fontSize: AppConstants.captionFontSize,
                    color: AppConstants.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: AppConstants.textSecondary,
          ),
        ],
      ),
    );
  }

  /// Guest selection widget
  static Widget guestSelectionCard({
    required int adults,
    required int children,
    required int rooms,
    VoidCallback? onTap,
  }) {
    return CustomCard(
      onTap: onTap,
      child: Row(
        children: [
          Icon(
            Icons.people,
            color: AppConstants.primaryGold,
            size: 24,
          ),
          const SizedBox(width: AppConstants.defaultPadding),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Guests & Rooms',
                  style: TextStyle(
                    fontSize: AppConstants.captionFontSize,
                    color: AppConstants.textSecondary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '$adults ${AppConstants.adults}, $children ${AppConstants.children}',
                  style: const TextStyle(
                    fontSize: AppConstants.bodyFontSize,
                    fontWeight: FontWeight.w600,
                    color: AppConstants.textPrimary,
                  ),
                ),
                Text(
                  '$rooms ${AppConstants.rooms}',
                  style: const TextStyle(
                    fontSize: AppConstants.captionFontSize,
                    color: AppConstants.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: AppConstants.textSecondary,
          ),
        ],
      ),
    );
  }

  /// Booking summary card
  static Widget bookingSummaryCard({
    required String hotelName,
    required String roomType,
    required String checkInDate,
    required String checkOutDate,
    required int numberOfNights,
    required int numberOfGuests,
    required int numberOfRooms,
    required double basePrice,
    required double taxAmount,
    required double totalAmount,
    required String currency,
  }) {
    return CustomCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Hotel Info
          Text(
            hotelName,
            style: const TextStyle(
              fontSize: AppConstants.subtitleFontSize,
              fontWeight: FontWeight.bold,
              color: AppConstants.textPrimary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            roomType,
            style: const TextStyle(
              fontSize: AppConstants.bodyFontSize,
              color: AppConstants.textSecondary,
            ),
          ),
          const SizedBox(height: AppConstants.defaultPadding),
          
          // Dates and Guests
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Check-in',
                      style: TextStyle(
                        fontSize: AppConstants.captionFontSize,
                        color: AppConstants.textSecondary,
                      ),
                    ),
                    Text(
                      checkInDate,
                      style: const TextStyle(
                        fontSize: AppConstants.bodyFontSize,
                        fontWeight: FontWeight.w600,
                        color: AppConstants.textPrimary,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Check-out',
                      style: TextStyle(
                        fontSize: AppConstants.captionFontSize,
                        color: AppConstants.textSecondary,
                      ),
                    ),
                    Text(
                      checkOutDate,
                      style: const TextStyle(
                        fontSize: AppConstants.bodyFontSize,
                        fontWeight: FontWeight.w600,
                        color: AppConstants.textPrimary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: AppConstants.defaultPadding),
          
          // Guest and Room Info
          Row(
            children: [
              Icon(
                Icons.people,
                size: 16,
                color: AppConstants.textSecondary,
              ),
              const SizedBox(width: 4),
              Text(
                '$numberOfGuests ${AppConstants.guests}',
                style: const TextStyle(
                  fontSize: AppConstants.captionFontSize,
                  color: AppConstants.textSecondary,
                ),
              ),
              const SizedBox(width: AppConstants.defaultPadding),
              Icon(
                Icons.bed,
                size: 16,
                color: AppConstants.textSecondary,
              ),
              const SizedBox(width: 4),
              Text(
                '$numberOfRooms ${AppConstants.rooms}',
                style: const TextStyle(
                  fontSize: AppConstants.captionFontSize,
                  color: AppConstants.textSecondary,
                ),
              ),
              const SizedBox(width: AppConstants.defaultPadding),
              Icon(
                Icons.nights_stay,
                size: 16,
                color: AppConstants.textSecondary,
              ),
              const SizedBox(width: 4),
              Text(
                '$numberOfNights ${AppConstants.nights}',
                style: const TextStyle(
                  fontSize: AppConstants.captionFontSize,
                  color: AppConstants.textSecondary,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppConstants.defaultPadding),
          
          // Price Breakdown
          Container(
            padding: const EdgeInsets.all(AppConstants.defaultPadding),
            decoration: BoxDecoration(
              color: AppConstants.primaryGold.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(AppConstants.borderRadius),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${AppConstants.basePrice} ($numberOfNights ${AppConstants.nights})',
                      style: const TextStyle(
                        fontSize: AppConstants.bodyFontSize,
                        color: AppConstants.textSecondary,
                      ),
                    ),
                    Text(
                      '$basePrice $currency',
                      style: const TextStyle(
                        fontSize: AppConstants.bodyFontSize,
                        color: AppConstants.textPrimary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Tax',
                      style: TextStyle(
                        fontSize: AppConstants.bodyFontSize,
                        color: AppConstants.textSecondary,
                      ),
                    ),
                    Text(
                      '$taxAmount $currency',
                      style: const TextStyle(
                        fontSize: AppConstants.bodyFontSize,
                        color: AppConstants.textPrimary,
                      ),
                    ),
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total',
                      style: TextStyle(
                        fontSize: AppConstants.subtitleFontSize,
                        fontWeight: FontWeight.bold,
                        color: AppConstants.textPrimary,
                      ),
                    ),
                    Text(
                      '$totalAmount $currency',
                      style: const TextStyle(
                        fontSize: AppConstants.subtitleFontSize,
                        fontWeight: FontWeight.bold,
                        color: AppConstants.primaryGold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
