class Hotel {
  final String id;
  final String name;
  final String nameArabic;
  final String location;
  final String locationArabic;
  final String description;
  final String descriptionArabic;
  final List<String> images;
  final double rating;
  final int reviewCount;
  final double pricePerNight;
  final String currency;
  final List<String> amenities;
  final String brand;
  final bool isPopular;
  final bool isFeatured;
  final Map<String, dynamic> coordinates;

  const Hotel({
    required this.id,
    required this.name,
    required this.nameArabic,
    required this.location,
    required this.locationArabic,
    required this.description,
    required this.descriptionArabic,
    required this.images,
    required this.rating,
    required this.reviewCount,
    required this.pricePerNight,
    required this.currency,
    required this.amenities,
    required this.brand,
    this.isPopular = false,
    this.isFeatured = false,
    required this.coordinates,
  });

  factory Hotel.fromJson(Map<String, dynamic> json) {
    return Hotel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      nameArabic: json['nameArabic'] ?? '',
      location: json['location'] ?? '',
      locationArabic: json['locationArabic'] ?? '',
      description: json['description'] ?? '',
      descriptionArabic: json['descriptionArabic'] ?? '',
      images: List<String>.from(json['images'] ?? []),
      rating: (json['rating'] ?? 0.0).toDouble(),
      reviewCount: json['reviewCount'] ?? 0,
      pricePerNight: (json['pricePerNight'] ?? 0.0).toDouble(),
      currency: json['currency'] ?? 'SAR',
      amenities: List<String>.from(json['amenities'] ?? []),
      brand: json['brand'] ?? '',
      isPopular: json['isPopular'] ?? false,
      isFeatured: json['isFeatured'] ?? false,
      coordinates: Map<String, dynamic>.from(json['coordinates'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'nameArabic': nameArabic,
      'location': location,
      'locationArabic': locationArabic,
      'description': description,
      'descriptionArabic': descriptionArabic,
      'images': images,
      'rating': rating,
      'reviewCount': reviewCount,
      'pricePerNight': pricePerNight,
      'currency': currency,
      'amenities': amenities,
      'brand': brand,
      'isPopular': isPopular,
      'isFeatured': isFeatured,
      'coordinates': coordinates,
    };
  }

  Hotel copyWith({
    String? id,
    String? name,
    String? nameArabic,
    String? location,
    String? locationArabic,
    String? description,
    String? descriptionArabic,
    List<String>? images,
    double? rating,
    int? reviewCount,
    double? pricePerNight,
    String? currency,
    List<String>? amenities,
    String? brand,
    bool? isPopular,
    bool? isFeatured,
    Map<String, dynamic>? coordinates,
  }) {
    return Hotel(
      id: id ?? this.id,
      name: name ?? this.name,
      nameArabic: nameArabic ?? this.nameArabic,
      location: location ?? this.location,
      locationArabic: locationArabic ?? this.locationArabic,
      description: description ?? this.description,
      descriptionArabic: descriptionArabic ?? this.descriptionArabic,
      images: images ?? this.images,
      rating: rating ?? this.rating,
      reviewCount: reviewCount ?? this.reviewCount,
      pricePerNight: pricePerNight ?? this.pricePerNight,
      currency: currency ?? this.currency,
      amenities: amenities ?? this.amenities,
      brand: brand ?? this.brand,
      isPopular: isPopular ?? this.isPopular,
      isFeatured: isFeatured ?? this.isFeatured,
      coordinates: coordinates ?? this.coordinates,
    );
  }

  @override
  String toString() {
    return 'Hotel(id: $id, name: $name, nameArabic: $nameArabic, location: $location, rating: $rating, pricePerNight: $pricePerNight)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Hotel && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}

class Room {
  final String id;
  final String hotelId;
  final String name;
  final String nameArabic;
  final String description;
  final String descriptionArabic;
  final List<String> images;
  final double pricePerNight;
  final String currency;
  final int maxOccupancy;
  final int bedCount;
  final String bedType;
  final double area;
  final String areaUnit;
  final List<String> amenities;
  final bool isAvailable;
  final int roomCount;

  const Room({
    required this.id,
    required this.hotelId,
    required this.name,
    required this.nameArabic,
    required this.description,
    required this.descriptionArabic,
    required this.images,
    required this.pricePerNight,
    required this.currency,
    required this.maxOccupancy,
    required this.bedCount,
    required this.bedType,
    required this.area,
    required this.areaUnit,
    required this.amenities,
    this.isAvailable = true,
    required this.roomCount,
  });

  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(
      id: json['id'] ?? '',
      hotelId: json['hotelId'] ?? '',
      name: json['name'] ?? '',
      nameArabic: json['nameArabic'] ?? '',
      description: json['description'] ?? '',
      descriptionArabic: json['descriptionArabic'] ?? '',
      images: List<String>.from(json['images'] ?? []),
      pricePerNight: (json['pricePerNight'] ?? 0.0).toDouble(),
      currency: json['currency'] ?? 'SAR',
      maxOccupancy: json['maxOccupancy'] ?? 1,
      bedCount: json['bedCount'] ?? 1,
      bedType: json['bedType'] ?? '',
      area: (json['area'] ?? 0.0).toDouble(),
      areaUnit: json['areaUnit'] ?? 'm²',
      amenities: List<String>.from(json['amenities'] ?? []),
      isAvailable: json['isAvailable'] ?? true,
      roomCount: json['roomCount'] ?? 1,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'hotelId': hotelId,
      'name': name,
      'nameArabic': nameArabic,
      'description': description,
      'descriptionArabic': descriptionArabic,
      'images': images,
      'pricePerNight': pricePerNight,
      'currency': currency,
      'maxOccupancy': maxOccupancy,
      'bedCount': bedCount,
      'bedType': bedType,
      'area': area,
      'areaUnit': areaUnit,
      'amenities': amenities,
      'isAvailable': isAvailable,
      'roomCount': roomCount,
    };
  }

  @override
  String toString() {
    return 'Room(id: $id, name: $name, nameArabic: $nameArabic, pricePerNight: $pricePerNight, maxOccupancy: $maxOccupancy)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Room && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
