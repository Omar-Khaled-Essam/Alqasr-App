import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../widgets/custom_app_bar.dart';

class ReservationsScreen extends StatefulWidget {
  const ReservationsScreen({Key? key}) : super(key: key);

  @override
  State<ReservationsScreen> createState() => _ReservationsScreenState();
}

class _ReservationsScreenState extends State<ReservationsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const StatusAppBar(
        title: AppConstants.myReservations,
        showBackButton: true,
      ),
      body: Column(
        children: [
          TabBar(
            controller: _tabController,
            isScrollable: true,
            labelColor: AppConstants.primaryGold,
            unselectedLabelColor: AppConstants.textSecondary,
            indicatorColor: AppConstants.primaryGold,
            tabs: const [
              Tab(text: AppConstants.upcoming),
              Tab(text: AppConstants.current),
              Tab(text: AppConstants.completed),
              Tab(text: AppConstants.cancelled),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildReservationsList('upcoming'),
                _buildReservationsList('current'),
                _buildReservationsList('completed'),
                _buildReservationsList('cancelled'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReservationsList(String type) {
    // Mock data - replace with actual data from your backend
    List<Map<String, dynamic>> reservations = _getMockReservations(type);

    if (reservations.isEmpty) {
      return _buildEmptyState(type);
    }

    return ListView.builder(
      padding: const EdgeInsets.all(AppConstants.defaultPadding),
      itemCount: reservations.length,
      itemBuilder: (context, index) {
        final reservation = reservations[index];
        return ReservationCard(
          reservation: reservation,
          onTap: () => _showReservationDetails(reservation),
          onCancel: type == 'upcoming' ? () => _cancelReservation(reservation) : null,
          onModify: type == 'upcoming' ? () => _modifyReservation(reservation) : null,
        );
      },
    );
  }

  Widget _buildEmptyState(String type) {
    String message;
    IconData icon;
    
    switch (type) {
      case 'upcoming':
        message = 'لا توجد حجوزات قادمة';
        icon = Icons.schedule;
        break;
      case 'current':
        message = 'لا توجد حجوزات حالية';
        icon = Icons.hotel;
        break;
      case 'completed':
        message = 'لا توجد حجوزات مكتملة';
        icon = Icons.check_circle;
        break;
      case 'cancelled':
        message = 'لا توجد حجوزات ملغاة';
        icon = Icons.cancel;
        break;
      default:
        message = 'لا توجد حجوزات';
        icon = Icons.hotel;
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 80,
            color: AppConstants.textSecondary.withOpacity(0.5),
          ),
          const SizedBox(height: AppConstants.defaultPadding),
          Text(
            message,
            style: const TextStyle(
              fontSize: AppConstants.subtitleFontSize,
              color: AppConstants.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppConstants.defaultPadding),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, '/home');
            },
            icon: const Icon(Icons.search),
            label: const Text('استكشف الفنادق'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppConstants.primaryGold,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.largePadding,
                vertical: AppConstants.defaultPadding,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppConstants.borderRadius),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Map<String, dynamic>> _getMockReservations(String type) {
    // Mock data - replace with actual API calls
    switch (type) {
      case 'upcoming':
        return [
          {
            'id': '1',
            'hotelName': 'جاردن آنها',
            'location': 'الرياض',
            'checkIn': '2024-01-15',
            'checkOut': '2024-01-18',
            'guests': 2,
            'rooms': 1,
            'totalPrice': 879,
            'status': 'confirmed',
            'imageUrl': 'https://via.placeholder.com/300x200',
          },
          {
            'id': '2',
            'hotelName': 'جاردن أحد رفيده',
            'location': 'أحد رفيده',
            'checkIn': '2024-02-10',
            'checkOut': '2024-02-12',
            'guests': 4,
            'rooms': 2,
            'totalPrice': 586,
            'status': 'confirmed',
            'imageUrl': 'https://via.placeholder.com/300x200',
          },
        ];
      case 'current':
        return [
          {
            'id': '3',
            'hotelName': 'فندق القصر الرياض',
            'location': 'الرياض',
            'checkIn': '2024-01-10',
            'checkOut': '2024-01-12',
            'guests': 2,
            'rooms': 1,
            'totalPrice': 600,
            'status': 'checked_in',
            'imageUrl': 'https://via.placeholder.com/300x200',
          },
        ];
      case 'completed':
        return [
          {
            'id': '4',
            'hotelName': 'جاردن جدة',
            'location': 'جدة',
            'checkIn': '2023-12-20',
            'checkOut': '2023-12-23',
            'guests': 2,
            'rooms': 1,
            'totalPrice': 900,
            'status': 'completed',
            'imageUrl': 'https://via.placeholder.com/300x200',
          },
        ];
      case 'cancelled':
        return [];
      default:
        return [];
    }
  }

  void _showReservationDetails(Map<String, dynamic> reservation) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => ReservationDetailsModal(reservation: reservation),
    );
  }

  void _cancelReservation(Map<String, dynamic> reservation) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('إلغاء الحجز'),
        content: const Text('هل أنت متأكد من إلغاء هذا الحجز؟'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('إلغاء'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              // TODO: Implement cancel reservation logic
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('تم إلغاء الحجز بنجاح'),
                  backgroundColor: AppConstants.successColor,
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppConstants.errorColor,
              foregroundColor: Colors.white,
            ),
            child: const Text('تأكيد الإلغاء'),
          ),
        ],
      ),
    );
  }

  void _modifyReservation(Map<String, dynamic> reservation) {
    // TODO: Navigate to modify reservation screen
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('سيتم توجيهك إلى صفحة تعديل الحجز'),
        backgroundColor: AppConstants.primaryGold,
      ),
    );
  }
}

class ReservationCard extends StatelessWidget {
  final Map<String, dynamic> reservation;
  final VoidCallback? onTap;
  final VoidCallback? onCancel;
  final VoidCallback? onModify;

  const ReservationCard({
    Key? key,
    required this.reservation,
    this.onTap,
    this.onCancel,
    this.onModify,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: AppConstants.defaultPadding),
      elevation: AppConstants.cardElevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConstants.borderRadius),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppConstants.borderRadius),
        child: Padding(
          padding: const EdgeInsets.all(AppConstants.defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  // Hotel Image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(AppConstants.borderRadius),
                    child: Image.network(
                      reservation['imageUrl'],
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: 80,
                          height: 80,
                          color: AppConstants.primaryGold.withOpacity(0.1),
                          child: const Icon(
                            Icons.hotel,
                            color: AppConstants.primaryGold,
                            size: 40,
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: AppConstants.defaultPadding),
                  // Hotel Info
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          reservation['hotelName'],
                          style: const TextStyle(
                            fontSize: AppConstants.subtitleFontSize,
                            fontWeight: FontWeight.bold,
                            color: AppConstants.textPrimary,
                          ),
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
                            Text(
                              reservation['location'],
                              style: const TextStyle(
                                fontSize: AppConstants.captionFontSize,
                                color: AppConstants.textSecondary,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '${reservation['checkIn']} - ${reservation['checkOut']}',
                          style: const TextStyle(
                            fontSize: AppConstants.captionFontSize,
                            color: AppConstants.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Price
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '${reservation['totalPrice']} ${AppConstants.sar}',
                        style: const TextStyle(
                          fontSize: AppConstants.subtitleFontSize,
                          fontWeight: FontWeight.bold,
                          color: AppConstants.primaryGold,
                        ),
                      ),
                      Text(
                        '${reservation['guests']} ضيوف • ${reservation['rooms']} غرف',
                        style: const TextStyle(
                          fontSize: AppConstants.smallFontSize,
                          color: AppConstants.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: AppConstants.defaultPadding),
              // Action Buttons
              if (onCancel != null || onModify != null)
                Row(
                  children: [
                    if (onModify != null)
                      Expanded(
                        child: OutlinedButton(
                          onPressed: onModify,
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: AppConstants.primaryGold),
                            foregroundColor: AppConstants.primaryGold,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(AppConstants.borderRadius),
                            ),
                          ),
                          child: const Text('تعديل'),
                        ),
                      ),
                    if (onCancel != null && onModify != null)
                      const SizedBox(width: AppConstants.defaultPadding),
                    if (onCancel != null)
                      Expanded(
                        child: ElevatedButton(
                          onPressed: onCancel,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppConstants.errorColor,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(AppConstants.borderRadius),
                            ),
                          ),
                          child: const Text('إلغاء'),
                        ),
                      ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class ReservationDetailsModal extends StatelessWidget {
  final Map<String, dynamic> reservation;

  const ReservationDetailsModal({
    Key? key,
    required this.reservation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          // Handle bar
          Container(
            width: 40,
            height: 4,
            margin: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: AppConstants.borderColor,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          // Content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(AppConstants.defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Hotel Image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(AppConstants.borderRadius),
                    child: Image.network(
                      reservation['imageUrl'],
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: double.infinity,
                          height: 200,
                          color: AppConstants.primaryGold.withOpacity(0.1),
                          child: const Icon(
                            Icons.hotel,
                            color: AppConstants.primaryGold,
                            size: 80,
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: AppConstants.defaultPadding),
                  // Hotel Name
                  Text(
                    reservation['hotelName'],
                    style: const TextStyle(
                      fontSize: AppConstants.titleFontSize,
                      fontWeight: FontWeight.bold,
                      color: AppConstants.textPrimary,
                    ),
                  ),
                  const SizedBox(height: AppConstants.smallPadding),
                  // Location
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: AppConstants.textSecondary,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        reservation['location'],
                        style: const TextStyle(
                          fontSize: AppConstants.bodyFontSize,
                          color: AppConstants.textSecondary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppConstants.largePadding),
                  // Reservation Details
                  _buildDetailRow('تاريخ الوصول', reservation['checkIn']),
                  _buildDetailRow('تاريخ المغادرة', reservation['checkOut']),
                  _buildDetailRow('عدد الضيوف', '${reservation['guests']} ضيوف'),
                  _buildDetailRow('عدد الغرف', '${reservation['rooms']} غرف'),
                  _buildDetailRow('الحالة', _getStatusText(reservation['status'])),
                  const SizedBox(height: AppConstants.largePadding),
                  // Total Price
                  Container(
                    padding: const EdgeInsets.all(AppConstants.defaultPadding),
                    decoration: BoxDecoration(
                      color: AppConstants.primaryGold.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(AppConstants.borderRadius),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'المبلغ الإجمالي',
                          style: TextStyle(
                            fontSize: AppConstants.subtitleFontSize,
                            fontWeight: FontWeight.bold,
                            color: AppConstants.textPrimary,
                          ),
                        ),
                        Text(
                          '${reservation['totalPrice']} ${AppConstants.sar}',
                          style: const TextStyle(
                            fontSize: AppConstants.titleFontSize,
                            fontWeight: FontWeight.bold,
                            color: AppConstants.primaryGold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppConstants.defaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: AppConstants.bodyFontSize,
              color: AppConstants.textSecondary,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: AppConstants.bodyFontSize,
              fontWeight: FontWeight.w500,
              color: AppConstants.textPrimary,
            ),
          ),
        ],
      ),
    );
  }

  String _getStatusText(String status) {
    switch (status) {
      case 'confirmed':
        return 'مؤكد';
      case 'checked_in':
        return 'تم تسجيل الوصول';
      case 'completed':
        return 'مكتمل';
      case 'cancelled':
        return 'ملغي';
      default:
        return status;
    }
  }
}
