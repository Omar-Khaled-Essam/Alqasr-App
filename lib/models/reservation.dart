import 'hotel.dart';

enum ReservationStatus {
  pending,
  confirmed,
  checkedIn,
  checkedOut,
  cancelled,
  completed,
}

enum PaymentStatus {
  pending,
  paid,
  failed,
  refunded,
}

class Reservation {
  final String id;
  final String userId;
  final String hotelId;
  final String roomId;
  final Hotel? hotel;
  final Room? room;
  final DateTime checkInDate;
  final DateTime checkOutDate;
  final int numberOfNights;
  final int numberOfGuests;
  final int numberOfRooms;
  final double basePrice;
  final double taxAmount;
  final double totalAmount;
  final String currency;
  final ReservationStatus status;
  final PaymentStatus paymentStatus;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final String? specialRequests;
  final String? notes;
  final Map<String, dynamic>? guestDetails;
  final String? confirmationNumber;

  const Reservation({
    required this.id,
    required this.userId,
    required this.hotelId,
    required this.roomId,
    this.hotel,
    this.room,
    required this.checkInDate,
    required this.checkOutDate,
    required this.numberOfNights,
    required this.numberOfGuests,
    required this.numberOfRooms,
    required this.basePrice,
    required this.taxAmount,
    required this.totalAmount,
    required this.currency,
    required this.status,
    required this.paymentStatus,
    required this.createdAt,
    this.updatedAt,
    this.specialRequests,
    this.notes,
    this.guestDetails,
    this.confirmationNumber,
  });

  factory Reservation.fromJson(Map<String, dynamic> json) {
    return Reservation(
      id: json['id'] ?? '',
      userId: json['userId'] ?? '',
      hotelId: json['hotelId'] ?? '',
      roomId: json['roomId'] ?? '',
      hotel: json['hotel'] != null ? Hotel.fromJson(json['hotel']) : null,
      room: json['room'] != null ? Room.fromJson(json['room']) : null,
      checkInDate: DateTime.parse(json['checkInDate'] ?? DateTime.now().toIso8601String()),
      checkOutDate: DateTime.parse(json['checkOutDate'] ?? DateTime.now().toIso8601String()),
      numberOfNights: json['numberOfNights'] ?? 1,
      numberOfGuests: json['numberOfGuests'] ?? 1,
      numberOfRooms: json['numberOfRooms'] ?? 1,
      basePrice: (json['basePrice'] ?? 0.0).toDouble(),
      taxAmount: (json['taxAmount'] ?? 0.0).toDouble(),
      totalAmount: (json['totalAmount'] ?? 0.0).toDouble(),
      currency: json['currency'] ?? 'SAR',
      status: ReservationStatus.values.firstWhere(
        (e) => e.name == json['status'],
        orElse: () => ReservationStatus.pending,
      ),
      paymentStatus: PaymentStatus.values.firstWhere(
        (e) => e.name == json['paymentStatus'],
        orElse: () => PaymentStatus.pending,
      ),
      createdAt: DateTime.parse(json['createdAt'] ?? DateTime.now().toIso8601String()),
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      specialRequests: json['specialRequests'],
      notes: json['notes'],
      guestDetails: json['guestDetails'] != null ? Map<String, dynamic>.from(json['guestDetails']) : null,
      confirmationNumber: json['confirmationNumber'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'hotelId': hotelId,
      'roomId': roomId,
      'hotel': hotel?.toJson(),
      'room': room?.toJson(),
      'checkInDate': checkInDate.toIso8601String(),
      'checkOutDate': checkOutDate.toIso8601String(),
      'numberOfNights': numberOfNights,
      'numberOfGuests': numberOfGuests,
      'numberOfRooms': numberOfRooms,
      'basePrice': basePrice,
      'taxAmount': taxAmount,
      'totalAmount': totalAmount,
      'currency': currency,
      'status': status.name,
      'paymentStatus': paymentStatus.name,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'specialRequests': specialRequests,
      'notes': notes,
      'guestDetails': guestDetails,
      'confirmationNumber': confirmationNumber,
    };
  }

  Reservation copyWith({
    String? id,
    String? userId,
    String? hotelId,
    String? roomId,
    Hotel? hotel,
    Room? room,
    DateTime? checkInDate,
    DateTime? checkOutDate,
    int? numberOfNights,
    int? numberOfGuests,
    int? numberOfRooms,
    double? basePrice,
    double? taxAmount,
    double? totalAmount,
    String? currency,
    ReservationStatus? status,
    PaymentStatus? paymentStatus,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? specialRequests,
    String? notes,
    Map<String, dynamic>? guestDetails,
    String? confirmationNumber,
  }) {
    return Reservation(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      hotelId: hotelId ?? this.hotelId,
      roomId: roomId ?? this.roomId,
      hotel: hotel ?? this.hotel,
      room: room ?? this.room,
      checkInDate: checkInDate ?? this.checkInDate,
      checkOutDate: checkOutDate ?? this.checkOutDate,
      numberOfNights: numberOfNights ?? this.numberOfNights,
      numberOfGuests: numberOfGuests ?? this.numberOfGuests,
      numberOfRooms: numberOfRooms ?? this.numberOfRooms,
      basePrice: basePrice ?? this.basePrice,
      taxAmount: taxAmount ?? this.taxAmount,
      totalAmount: totalAmount ?? this.totalAmount,
      currency: currency ?? this.currency,
      status: status ?? this.status,
      paymentStatus: paymentStatus ?? this.paymentStatus,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      specialRequests: specialRequests ?? this.specialRequests,
      notes: notes ?? this.notes,
      guestDetails: guestDetails ?? this.guestDetails,
      confirmationNumber: confirmationNumber ?? this.confirmationNumber,
    );
  }

  bool get isUpcoming => status == ReservationStatus.confirmed && checkInDate.isAfter(DateTime.now());
  bool get isCurrent => status == ReservationStatus.checkedIn;
  bool get isCompleted => status == ReservationStatus.completed || status == ReservationStatus.checkedOut;
  bool get isCancelled => status == ReservationStatus.cancelled;
  bool get canBeCancelled => status == ReservationStatus.confirmed && checkInDate.isAfter(DateTime.now());
  bool get canBeModified => status == ReservationStatus.confirmed && checkInDate.isAfter(DateTime.now());

  String get statusText {
    switch (status) {
      case ReservationStatus.pending:
        return 'في الانتظار';
      case ReservationStatus.confirmed:
        return 'مؤكد';
      case ReservationStatus.checkedIn:
        return 'تم تسجيل الوصول';
      case ReservationStatus.checkedOut:
        return 'تم تسجيل المغادرة';
      case ReservationStatus.cancelled:
        return 'ملغي';
      case ReservationStatus.completed:
        return 'مكتمل';
    }
  }

  String get paymentStatusText {
    switch (paymentStatus) {
      case PaymentStatus.pending:
        return 'في الانتظار';
      case PaymentStatus.paid:
        return 'مدفوع';
      case PaymentStatus.failed:
        return 'فشل الدفع';
      case PaymentStatus.refunded:
        return 'مسترد';
    }
  }

  @override
  String toString() {
    return 'Reservation(id: $id, hotelId: $hotelId, checkInDate: $checkInDate, checkOutDate: $checkOutDate, status: $status, totalAmount: $totalAmount)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Reservation && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
