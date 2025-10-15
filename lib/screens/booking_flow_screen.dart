import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_button.dart';
import '../widgets/hotel_widgets.dart';
import '../models/hotel.dart';
import '../models/reservation.dart';

class BookingFlowScreen extends StatefulWidget {
  final Hotel hotel;
  final Room room;

  const BookingFlowScreen({
    Key? key,
    required this.hotel,
    required this.room,
  }) : super(key: key);

  @override
  State<BookingFlowScreen> createState() => _BookingFlowScreenState();
}

class _BookingFlowScreenState extends State<BookingFlowScreen> {
  int _currentStep = 0;
  
  // Booking details
  DateTime? _checkInDate;
  DateTime? _checkOutDate;
  int _numberOfNights = 1;
  int _numberOfAdults = 2;
  int _numberOfChildren = 0;
  int _numberOfRooms = 1;
  
  // User details
  String _firstName = '';
  String _lastName = '';
  String _email = '';
  String _phoneNumber = '';
  
  // Payment details
  String _cardNumber = '';
  String _expiryDate = '';
  String _cvv = '';
  String _cardHolderName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const StatusAppBar(
        title: 'حجز الغرفة',
        showBackButton: true,
      ),
      body: Column(
        children: [
          // Progress indicator
          _buildProgressIndicator(),
          
          // Content
          Expanded(
            child: _buildCurrentStep(),
          ),
          
          // Bottom action button
          _buildBottomAction(),
        ],
      ),
    );
  }

  Widget _buildProgressIndicator() {
    return Container(
      padding: const EdgeInsets.all(AppConstants.defaultPadding),
      child: Row(
        children: [
          _buildProgressStep(0, 'التواريخ', _currentStep >= 0),
          _buildProgressLine(_currentStep > 0),
          _buildProgressStep(1, 'المعلومات', _currentStep >= 1),
          _buildProgressLine(_currentStep > 1),
          _buildProgressStep(2, 'الدفع', _currentStep >= 2),
          _buildProgressLine(_currentStep > 2),
          _buildProgressStep(3, 'التأكيد', _currentStep >= 3),
        ],
      ),
    );
  }

  Widget _buildProgressStep(int step, String title, bool isCompleted) {
    return Column(
      children: [
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: isCompleted ? AppConstants.primaryGold : AppConstants.borderColor,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: isCompleted
                ? const Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 16,
                  )
                : Text(
                    '${step + 1}',
                    style: TextStyle(
                      color: isCompleted ? Colors.white : AppConstants.textSecondary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          title,
          style: TextStyle(
            fontSize: AppConstants.smallFontSize,
            color: isCompleted ? AppConstants.primaryGold : AppConstants.textSecondary,
            fontWeight: isCompleted ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }

  Widget _buildProgressLine(bool isCompleted) {
    return Expanded(
      child: Container(
        height: 2,
        color: isCompleted ? AppConstants.primaryGold : AppConstants.borderColor,
        margin: const EdgeInsets.symmetric(horizontal: 8),
      ),
    );
  }

  Widget _buildCurrentStep() {
    switch (_currentStep) {
      case 0:
        return _buildDateSelectionStep();
      case 1:
        return _buildUserInfoStep();
      case 2:
        return _buildPaymentStep();
      case 3:
        return _buildConfirmationStep();
      default:
        return _buildDateSelectionStep();
    }
  }

  Widget _buildDateSelectionStep() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppConstants.defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Hotel and Room Info
          HotelWidgets.bookingSummaryCard(
            hotelName: widget.hotel.nameArabic,
            roomType: widget.room.nameArabic,
            checkInDate: _checkInDate?.toString().split(' ')[0] ?? 'اختر التاريخ',
            checkOutDate: _checkOutDate?.toString().split(' ')[0] ?? 'اختر التاريخ',
            numberOfNights: _numberOfNights,
            numberOfGuests: _numberOfAdults + _numberOfChildren,
            numberOfRooms: _numberOfRooms,
            basePrice: widget.room.pricePerNight * _numberOfNights,
            taxAmount: (widget.room.pricePerNight * _numberOfNights) * 0.15,
            totalAmount: (widget.room.pricePerNight * _numberOfNights) * 1.15,
            currency: widget.room.currency,
          ),
          
          const SizedBox(height: AppConstants.largePadding),
          
          // Date Selection
          HotelWidgets.dateSelectionCard(
            label: 'تاريخ الوصول',
            date: _checkInDate?.toString().split(' ')[0] ?? 'اختر التاريخ',
            dayOfWeek: _checkInDate?.weekday.toString() ?? '',
            onTap: () => _selectCheckInDate(),
          ),
          
          const SizedBox(height: AppConstants.defaultPadding),
          
          HotelWidgets.dateSelectionCard(
            label: 'تاريخ المغادرة',
            date: _checkOutDate?.toString().split(' ')[0] ?? 'اختر التاريخ',
            dayOfWeek: _checkOutDate?.weekday.toString() ?? '',
            onTap: () => _selectCheckOutDate(),
          ),
          
          const SizedBox(height: AppConstants.defaultPadding),
          
          // Guest Selection
          HotelWidgets.guestSelectionCard(
            adults: _numberOfAdults,
            children: _numberOfChildren,
            rooms: _numberOfRooms,
            onTap: () => _selectGuests(),
          ),
        ],
      ),
    );
  }

  Widget _buildUserInfoStep() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppConstants.defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'معلومات الضيوف',
            style: TextStyle(
              fontSize: AppConstants.subtitleFontSize,
              fontWeight: FontWeight.bold,
              color: AppConstants.textPrimary,
            ),
          ),
          const SizedBox(height: AppConstants.defaultPadding),
          
          // First Name
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'الاسم الأول',
              prefixIcon: Icon(Icons.person_outline),
            ),
            onChanged: (value) => _firstName = value,
          ),
          
          const SizedBox(height: AppConstants.defaultPadding),
          
          // Last Name
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'اسم العائلة',
              prefixIcon: Icon(Icons.person_outline),
            ),
            onChanged: (value) => _lastName = value,
          ),
          
          const SizedBox(height: AppConstants.defaultPadding),
          
          // Email
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'البريد الإلكتروني',
              prefixIcon: Icon(Icons.email_outlined),
            ),
            onChanged: (value) => _email = value,
          ),
          
          const SizedBox(height: AppConstants.defaultPadding),
          
          // Phone Number
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'رقم الهاتف',
              prefixIcon: Icon(Icons.phone_outlined),
            ),
            onChanged: (value) => _phoneNumber = value,
          ),
          
          const SizedBox(height: AppConstants.largePadding),
          
          // Login/Register Option
          Container(
            padding: const EdgeInsets.all(AppConstants.defaultPadding),
            decoration: BoxDecoration(
              color: AppConstants.primaryGold.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(AppConstants.borderRadius),
            ),
            child: Column(
              children: [
                const Text(
                  'هل لديك حساب؟',
                  style: TextStyle(
                    fontSize: AppConstants.bodyFontSize,
                    fontWeight: FontWeight.w600,
                    color: AppConstants.textPrimary,
                  ),
                ),
                const SizedBox(height: AppConstants.defaultPadding),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => Navigator.pushNamed(context, '/login'),
                        child: const Text('تسجيل الدخول'),
                      ),
                    ),
                    const SizedBox(width: AppConstants.defaultPadding),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => Navigator.pushNamed(context, '/register'),
                        child: const Text('إنشاء حساب'),
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

  Widget _buildPaymentStep() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppConstants.defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'معلومات الدفع',
            style: TextStyle(
              fontSize: AppConstants.subtitleFontSize,
              fontWeight: FontWeight.bold,
              color: AppConstants.textPrimary,
            ),
          ),
          const SizedBox(height: AppConstants.defaultPadding),
          
          // Card Number
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'رقم البطاقة',
              prefixIcon: Icon(Icons.credit_card),
            ),
            onChanged: (value) => _cardNumber = value,
          ),
          
          const SizedBox(height: AppConstants.defaultPadding),
          
          // Expiry Date and CVV
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'تاريخ الانتهاء',
                    prefixIcon: Icon(Icons.calendar_today),
                  ),
                  onChanged: (value) => _expiryDate = value,
                ),
              ),
              const SizedBox(width: AppConstants.defaultPadding),
              Expanded(
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'CVV',
                    prefixIcon: Icon(Icons.lock),
                  ),
                  onChanged: (value) => _cvv = value,
                ),
              ),
            ],
          ),
          
          const SizedBox(height: AppConstants.defaultPadding),
          
          // Card Holder Name
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'اسم حامل البطاقة',
              prefixIcon: Icon(Icons.person),
            ),
            onChanged: (value) => _cardHolderName = value,
          ),
          
          const SizedBox(height: AppConstants.largePadding),
          
          // Booking Summary
          HotelWidgets.bookingSummaryCard(
            hotelName: widget.hotel.nameArabic,
            roomType: widget.room.nameArabic,
            checkInDate: _checkInDate?.toString().split(' ')[0] ?? '',
            checkOutDate: _checkOutDate?.toString().split(' ')[0] ?? '',
            numberOfNights: _numberOfNights,
            numberOfGuests: _numberOfAdults + _numberOfChildren,
            numberOfRooms: _numberOfRooms,
            basePrice: widget.room.pricePerNight * _numberOfNights,
            taxAmount: (widget.room.pricePerNight * _numberOfNights) * 0.15,
            totalAmount: (widget.room.pricePerNight * _numberOfNights) * 1.15,
            currency: widget.room.currency,
          ),
        ],
      ),
    );
  }

  Widget _buildConfirmationStep() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                color: AppConstants.successColor,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.check,
                color: Colors.white,
                size: 50,
              ),
            ),
            const SizedBox(height: AppConstants.largePadding),
            const Text(
              'تم تأكيد الحجز بنجاح!',
              style: TextStyle(
                fontSize: AppConstants.titleFontSize,
                fontWeight: FontWeight.bold,
                color: AppConstants.textPrimary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppConstants.defaultPadding),
            const Text(
              'تم إرسال تفاصيل الحجز إلى بريدك الإلكتروني',
              style: TextStyle(
                fontSize: AppConstants.bodyFontSize,
                color: AppConstants.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppConstants.largePadding),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
                },
                child: const Text('العودة للرئيسية'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomAction() {
    if (_currentStep == 3) return const SizedBox.shrink();
    
    return Container(
      padding: const EdgeInsets.all(AppConstants.defaultPadding),
      child: SizedBox(
        width: double.infinity,
        child: CustomButton(
          text: _currentStep == 2 ? 'تأكيد الحجز' : 'التالي',
          onPressed: _canProceed() ? _nextStep : null,
        ),
      ),
    );
  }

  bool _canProceed() {
    switch (_currentStep) {
      case 0:
        return _checkInDate != null && _checkOutDate != null;
      case 1:
        return _firstName.isNotEmpty && _lastName.isNotEmpty && _email.isNotEmpty;
      case 2:
        return _cardNumber.isNotEmpty && _expiryDate.isNotEmpty && _cvv.isNotEmpty;
      default:
        return false;
    }
  }

  void _nextStep() {
    if (_currentStep < 3) {
      setState(() {
        _currentStep++;
      });
    }
  }

  void _selectCheckInDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (date != null) {
      setState(() {
        _checkInDate = date;
        if (_checkOutDate != null && _checkOutDate!.isBefore(_checkInDate!.add(const Duration(days: 1)))) {
          _checkOutDate = _checkInDate!.add(const Duration(days: 1));
        }
        _calculateNights();
      });
    }
  }

  void _selectCheckOutDate() async {
    if (_checkInDate == null) return;
    
    final date = await showDatePicker(
      context: context,
      initialDate: _checkOutDate ?? _checkInDate!.add(const Duration(days: 1)),
      firstDate: _checkInDate!.add(const Duration(days: 1)),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (date != null) {
      setState(() {
        _checkOutDate = date;
        _calculateNights();
      });
    }
  }

  void _calculateNights() {
    if (_checkInDate != null && _checkOutDate != null) {
      _numberOfNights = _checkOutDate!.difference(_checkInDate!).inDays;
    }
  }

  void _selectGuests() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('اختر عدد الضيوف والغرف'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('البالغين'),
                Row(
                  children: [
                    IconButton(
                      onPressed: _numberOfAdults > 1 ? () => setState(() => _numberOfAdults--) : null,
                      icon: const Icon(Icons.remove),
                    ),
                    Text('$_numberOfAdults'),
                    IconButton(
                      onPressed: () => setState(() => _numberOfAdults++),
                      icon: const Icon(Icons.add),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('الأطفال'),
                Row(
                  children: [
                    IconButton(
                      onPressed: _numberOfChildren > 0 ? () => setState(() => _numberOfChildren--) : null,
                      icon: const Icon(Icons.remove),
                    ),
                    Text('$_numberOfChildren'),
                    IconButton(
                      onPressed: () => setState(() => _numberOfChildren++),
                      icon: const Icon(Icons.add),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('الغرف'),
                Row(
                  children: [
                    IconButton(
                      onPressed: _numberOfRooms > 1 ? () => setState(() => _numberOfRooms--) : null,
                      icon: const Icon(Icons.remove),
                    ),
                    Text('$_numberOfRooms'),
                    IconButton(
                      onPressed: () => setState(() => _numberOfRooms++),
                      icon: const Icon(Icons.add),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('تأكيد'),
          ),
        ],
      ),
    );
  }
}
