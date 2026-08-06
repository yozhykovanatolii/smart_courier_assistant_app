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
  final int orderIndex;

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
    required this.orderIndex,
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
      'order_index': orderIndex,
    };
  }

  factory OrderInfoModel.fromJson(Map<String, dynamic> json) {
    return OrderInfoModel(
      id: json['id'] as int,
      clientFullName: json['client_full_name'] as String,
      clientPhoneNumber: json['client_phone_number'] as String,
      address: json['address'] as String,
      latitude: json['latitude'] as double,
      longitude: json['longitude'] as double,
      plannedEta: DateTime.parse(json['planned_eta'] as String),
      deliveryBy: DateTime.parse(json['delivery_by'] as String),
      deliveryRisk: json['delivery_risk'] as String,
      status: json['status'] as String,
      orderIndex: json['order_index'] as int,
      courierComment: json['courier_comment'] != null
          ? json['courier_comment'] as String
          : null,
      confirmedAt: json['confirmed_at'] != null
          ? DateTime.parse(json['confirmed_at'] as String)
          : null,
      orderPhotosUrl: json['order_photos_url'] != null
          ? List<String>.from((json['order_photos_url'] as List<String>))
          : null,
    );
  }
}
