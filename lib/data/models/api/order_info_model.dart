class OrderInfoModel {
  final int id;
  final int routeId;
  final String clientFullName;
  final String clientPhoneNumber;
  final String address;
  final double latitude;
  final double longitude;
  final DateTime plannedEta;
  final DateTime deliveryBy;
  final String deliveryRisk;
  final String status;

  OrderInfoModel({
    required this.id,
    required this.routeId,
    required this.clientFullName,
    required this.clientPhoneNumber,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.plannedEta,
    required this.deliveryBy,
    required this.deliveryRisk,
    required this.status,
  });

  factory OrderInfoModel.fromJson(Map<String, dynamic> json) {
    return OrderInfoModel(
      id: json['id'] as int,
      routeId: json['route_id'] as int,
      clientFullName: json['client_full_name'] as String,
      clientPhoneNumber: json['client_phone_number'] as String,
      address: json['address'] as String,
      latitude: json['latitude'] as double,
      longitude: json['longitude'] as double,
      plannedEta: DateTime.parse(json['planned_eta'] as String),
      deliveryBy: DateTime.parse(json['delivery_by'] as String),
      deliveryRisk: json['delivery_risk'] as String,
      status: json['status'] as String,
    );
  }
}
