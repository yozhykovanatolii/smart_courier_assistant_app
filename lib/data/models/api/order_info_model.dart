class OrderInfoModel {
  final int id;
  final String clientFullName;
  final String clientPhoneNumber;
  final String address;
  final double latitude;
  final double longitude;
  final DateTime plannedEta;
  final DateTime deliveryBy;
  final String deliveryRisk;
  final String status;
  final String? courierComment;
  final DateTime? confirmedAt;
  final List<String>? orderPhotosUrl;

  OrderInfoModel({
    required this.id,
    required this.clientFullName,
    required this.clientPhoneNumber,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.plannedEta,
    required this.deliveryBy,
    required this.deliveryRisk,
    required this.status,
    this.courierComment,
    this.confirmedAt,
    this.orderPhotosUrl,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'client_full_name': clientFullName,
      'client_phone_number': clientPhoneNumber,
      'address': address,
      'latitude': latitude,
      'longitude': longitude,
      'planned_eta': plannedEta.millisecondsSinceEpoch,
      'delivery_by': deliveryBy.millisecondsSinceEpoch,
      'delivery_risk': deliveryRisk,
      'status': status,
      'courier_comment': courierComment,
      'confirmed_at': confirmedAt?.millisecondsSinceEpoch,
      'order_photos_url': orderPhotosUrl,
    };
  }

  factory OrderInfoModel.fromJson(Map<String, dynamic> map) {
    return OrderInfoModel(
      id: map['id'] as int,
      clientFullName: map['client_full_name'] as String,
      clientPhoneNumber: map['client_phone_number'] as String,
      address: map['address'] as String,
      latitude: map['latitude'] as double,
      longitude: map['longitude'] as double,
      plannedEta: DateTime.parse(map['planned_eta'] as String),
      deliveryBy: DateTime.parse(map['delivery_by'] as String),
      deliveryRisk: map['delivery_risk'] as String,
      status: map['status'] as String,
      courierComment: map['courier_comment'] != null
          ? map['courier_comment'] as String
          : null,
      confirmedAt: map['confirmed_at'] != null
          ? DateTime.parse(map['confirmed_at'] as String)
          : null,
      orderPhotosUrl: map['order_photos_url'] != null
          ? List<String>.from((map['order_photos_url'] as List<String>))
          : null,
    );
  }
}
