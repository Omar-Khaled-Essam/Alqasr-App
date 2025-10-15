import '../models/hotel.dart';

class HotelService {
  static final HotelService _instance = HotelService._internal();
  factory HotelService() => _instance;
  HotelService._internal();

  // Mock data - replace with actual API calls
  final List<Hotel> _mockHotels = [
    Hotel(
      id: '1',
      name: 'Garden Aya',
      nameArabic: 'جاردن آيا',
      location: 'Riyadh',
      locationArabic: 'الرياض',
      description: 'Luxury hotel in the heart of Riyadh',
      descriptionArabic: 'فندق فاخر في قلب الرياض',
      images: ['https://via.placeholder.com/400x200'],
      rating: 8.5,
      reviewCount: 150,
      pricePerNight: 293.0,
      currency: 'SAR',
      amenities: ['WiFi', 'Pool', 'Gym', 'Restaurant'],
      brand: 'Garden Millennium',
      isPopular: true,
      coordinates: {'lat': 24.7136, 'lng': 46.6753},
    ),
    Hotel(
      id: '2',
      name: 'Garden Ahad Rafidah',
      nameArabic: 'جاردن أحد رفيده',
      location: 'Ahad Rafidah',
      locationArabic: 'أحد رفيده',
      description: 'Beautiful hotel in Ahad Rafidah',
      descriptionArabic: 'فندق جميل في أحد رفيده',
      images: ['https://via.placeholder.com/400x200'],
      rating: 8.2,
      reviewCount: 89,
      pricePerNight: 393.0,
      currency: 'SAR',
      amenities: ['WiFi', 'Pool', 'Spa', 'Restaurant'],
      brand: 'Garden Millennium',
      isPopular: true,
      coordinates: {'lat': 18.2465, 'lng': 42.5056},
    ),
    Hotel(
      id: '3',
      name: 'AlQasr AlMansak',
      nameArabic: 'القصر المنسك',
      location: 'Riyadh',
      locationArabic: 'الرياض',
      description: 'Premium hotel with royal service',
      descriptionArabic: 'فندق متميز بخدمة ملكية',
      images: ['https://via.placeholder.com/400x200'],
      rating: 9.1,
      reviewCount: 234,
      pricePerNight: 500.0,
      currency: 'SAR',
      amenities: ['WiFi', 'Pool', 'Gym', 'Spa', 'Restaurant', 'Concierge'],
      brand: 'AlQasr',
      isFeatured: true,
      coordinates: {'lat': 24.7136, 'lng': 46.6753},
    ),
  ];

  // Get all hotels
  Future<List<Hotel>> getAllHotels() async {
    // Simulate API delay
    await Future.delayed(const Duration(milliseconds: 500));
    return List.from(_mockHotels);
  }

  // Get popular hotels
  Future<List<Hotel>> getPopularHotels() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return _mockHotels.where((hotel) => hotel.isPopular).toList();
  }

  // Get featured hotels
  Future<List<Hotel>> getFeaturedHotels() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return _mockHotels.where((hotel) => hotel.isFeatured).toList();
  }

  // Get hotels by brand
  Future<List<Hotel>> getHotelsByBrand(String brand) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return _mockHotels.where((hotel) => hotel.brand == brand).toList();
  }

  // Get hotels by location
  Future<List<Hotel>> getHotelsByLocation(String location) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return _mockHotels.where((hotel) => 
      hotel.location.toLowerCase().contains(location.toLowerCase()) ||
      hotel.locationArabic.contains(location)
    ).toList();
  }

  // Get hotel by ID
  Future<Hotel?> getHotelById(String id) async {
    await Future.delayed(const Duration(milliseconds: 200));
    try {
      return _mockHotels.firstWhere((hotel) => hotel.id == id);
    } catch (e) {
      return null;
    }
  }

  // Search hotels
  Future<List<Hotel>> searchHotels(String query) async {
    await Future.delayed(const Duration(milliseconds: 400));
    if (query.isEmpty) return _mockHotels;
    
    return _mockHotels.where((hotel) =>
      hotel.name.toLowerCase().contains(query.toLowerCase()) ||
      hotel.nameArabic.contains(query) ||
      hotel.location.toLowerCase().contains(query.toLowerCase()) ||
      hotel.locationArabic.contains(query) ||
      hotel.brand.toLowerCase().contains(query.toLowerCase())
    ).toList();
  }

  // Get available brands
  Future<List<String>> getBrands() async {
    await Future.delayed(const Duration(milliseconds: 200));
    return _mockHotels.map((hotel) => hotel.brand).toSet().toList();
  }

  // Get available locations
  Future<List<String>> getLocations() async {
    await Future.delayed(const Duration(milliseconds: 200));
    return _mockHotels.map((hotel) => hotel.location).toSet().toList();
  }

  // Filter hotels by criteria
  Future<List<Hotel>> filterHotels({
    String? location,
    String? brand,
    double? minPrice,
    double? maxPrice,
    double? minRating,
    List<String>? amenities,
  }) async {
    await Future.delayed(const Duration(milliseconds: 400));
    
    var filteredHotels = _mockHotels.where((hotel) {
      if (location != null && 
          !hotel.location.toLowerCase().contains(location.toLowerCase()) &&
          !hotel.locationArabic.contains(location)) {
        return false;
      }
      
      if (brand != null && hotel.brand != brand) {
        return false;
      }
      
      if (minPrice != null && hotel.pricePerNight < minPrice) {
        return false;
      }
      
      if (maxPrice != null && hotel.pricePerNight > maxPrice) {
        return false;
      }
      
      if (minRating != null && hotel.rating < minRating) {
        return false;
      }
      
      if (amenities != null && amenities.isNotEmpty) {
        bool hasAllAmenities = amenities.every((amenity) => 
          hotel.amenities.any((hotelAmenity) => 
            hotelAmenity.toLowerCase().contains(amenity.toLowerCase())
          )
        );
        if (!hasAllAmenities) return false;
      }
      
      return true;
    }).toList();
    
    return filteredHotels;
  }
}
