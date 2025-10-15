class User {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String? phoneNumber;
  final String? profileImageUrl;
  final DateTime? dateOfBirth;
  final String? gender;
  final String? nationality;
  final String? preferredLanguage;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final bool isEmailVerified;
  final bool isPhoneVerified;
  final Map<String, dynamic>? preferences;
  final List<String>? favoriteHotels;
  final int loyaltyPoints;
  final String? loyaltyTier;

  const User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    this.phoneNumber,
    this.profileImageUrl,
    this.dateOfBirth,
    this.gender,
    this.nationality,
    this.preferredLanguage,
    required this.createdAt,
    this.updatedAt,
    this.isEmailVerified = false,
    this.isPhoneVerified = false,
    this.preferences,
    this.favoriteHotels,
    this.loyaltyPoints = 0,
    this.loyaltyTier,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? '',
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      email: json['email'] ?? '',
      phoneNumber: json['phoneNumber'],
      profileImageUrl: json['profileImageUrl'],
      dateOfBirth: json['dateOfBirth'] != null ? DateTime.parse(json['dateOfBirth']) : null,
      gender: json['gender'],
      nationality: json['nationality'],
      preferredLanguage: json['preferredLanguage'],
      createdAt: DateTime.parse(json['createdAt'] ?? DateTime.now().toIso8601String()),
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      isEmailVerified: json['isEmailVerified'] ?? false,
      isPhoneVerified: json['isPhoneVerified'] ?? false,
      preferences: json['preferences'] != null ? Map<String, dynamic>.from(json['preferences']) : null,
      favoriteHotels: json['favoriteHotels'] != null ? List<String>.from(json['favoriteHotels']) : null,
      loyaltyPoints: json['loyaltyPoints'] ?? 0,
      loyaltyTier: json['loyaltyTier'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phoneNumber': phoneNumber,
      'profileImageUrl': profileImageUrl,
      'dateOfBirth': dateOfBirth?.toIso8601String(),
      'gender': gender,
      'nationality': nationality,
      'preferredLanguage': preferredLanguage,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'isEmailVerified': isEmailVerified,
      'isPhoneVerified': isPhoneVerified,
      'preferences': preferences,
      'favoriteHotels': favoriteHotels,
      'loyaltyPoints': loyaltyPoints,
      'loyaltyTier': loyaltyTier,
    };
  }

  User copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    String? phoneNumber,
    String? profileImageUrl,
    DateTime? dateOfBirth,
    String? gender,
    String? nationality,
    String? preferredLanguage,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isEmailVerified,
    bool? isPhoneVerified,
    Map<String, dynamic>? preferences,
    List<String>? favoriteHotels,
    int? loyaltyPoints,
    String? loyaltyTier,
  }) {
    return User(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      gender: gender ?? this.gender,
      nationality: nationality ?? this.nationality,
      preferredLanguage: preferredLanguage ?? this.preferredLanguage,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isEmailVerified: isEmailVerified ?? this.isEmailVerified,
      isPhoneVerified: isPhoneVerified ?? this.isPhoneVerified,
      preferences: preferences ?? this.preferences,
      favoriteHotels: favoriteHotels ?? this.favoriteHotels,
      loyaltyPoints: loyaltyPoints ?? this.loyaltyPoints,
      loyaltyTier: loyaltyTier ?? this.loyaltyTier,
    );
  }

  String get fullName => '$firstName $lastName';
  String get displayName => fullName.isNotEmpty ? fullName : email;

  @override
  String toString() {
    return 'User(id: $id, fullName: $fullName, email: $email, loyaltyPoints: $loyaltyPoints)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is User && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}

class UserPreferences {
  final String language;
  final String currency;
  final bool notificationsEnabled;
  final bool emailNotifications;
  final bool smsNotifications;
  final bool pushNotifications;
  final String? preferredCheckInTime;
  final String? preferredCheckOutTime;
  final List<String>? preferredAmenities;
  final String? dietaryRestrictions;
  final bool accessibilityNeeds;

  const UserPreferences({
    this.language = 'ar',
    this.currency = 'SAR',
    this.notificationsEnabled = true,
    this.emailNotifications = true,
    this.smsNotifications = false,
    this.pushNotifications = true,
    this.preferredCheckInTime,
    this.preferredCheckOutTime,
    this.preferredAmenities,
    this.dietaryRestrictions,
    this.accessibilityNeeds = false,
  });

  factory UserPreferences.fromJson(Map<String, dynamic> json) {
    return UserPreferences(
      language: json['language'] ?? 'ar',
      currency: json['currency'] ?? 'SAR',
      notificationsEnabled: json['notificationsEnabled'] ?? true,
      emailNotifications: json['emailNotifications'] ?? true,
      smsNotifications: json['smsNotifications'] ?? false,
      pushNotifications: json['pushNotifications'] ?? true,
      preferredCheckInTime: json['preferredCheckInTime'],
      preferredCheckOutTime: json['preferredCheckOutTime'],
      preferredAmenities: json['preferredAmenities'] != null ? List<String>.from(json['preferredAmenities']) : null,
      dietaryRestrictions: json['dietaryRestrictions'],
      accessibilityNeeds: json['accessibilityNeeds'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'language': language,
      'currency': currency,
      'notificationsEnabled': notificationsEnabled,
      'emailNotifications': emailNotifications,
      'smsNotifications': smsNotifications,
      'pushNotifications': pushNotifications,
      'preferredCheckInTime': preferredCheckInTime,
      'preferredCheckOutTime': preferredCheckOutTime,
      'preferredAmenities': preferredAmenities,
      'dietaryRestrictions': dietaryRestrictions,
      'accessibilityNeeds': accessibilityNeeds,
    };
  }

  UserPreferences copyWith({
    String? language,
    String? currency,
    bool? notificationsEnabled,
    bool? emailNotifications,
    bool? smsNotifications,
    bool? pushNotifications,
    String? preferredCheckInTime,
    String? preferredCheckOutTime,
    List<String>? preferredAmenities,
    String? dietaryRestrictions,
    bool? accessibilityNeeds,
  }) {
    return UserPreferences(
      language: language ?? this.language,
      currency: currency ?? this.currency,
      notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
      emailNotifications: emailNotifications ?? this.emailNotifications,
      smsNotifications: smsNotifications ?? this.smsNotifications,
      pushNotifications: pushNotifications ?? this.pushNotifications,
      preferredCheckInTime: preferredCheckInTime ?? this.preferredCheckInTime,
      preferredCheckOutTime: preferredCheckOutTime ?? this.preferredCheckOutTime,
      preferredAmenities: preferredAmenities ?? this.preferredAmenities,
      dietaryRestrictions: dietaryRestrictions ?? this.dietaryRestrictions,
      accessibilityNeeds: accessibilityNeeds ?? this.accessibilityNeeds,
    );
  }
}
