class OrderSaveRequest {
  final String clientFullName;
  final String clientPhoneNumber;
  final DateTime deliveryBy;
  final String address;
  final double latitude;
  final double longitude;
  final int bottleQuantity;

  OrderSaveRequest({
    required this.clientFullName,
    required this.clientPhoneNumber,
    required this.deliveryBy,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.bottleQuantity,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'client_full_name': clientFullName,
      'client_phone_number': clientPhoneNumber,
      'delivery_by': deliveryBy.toIso8601String(),
      'bottle_quantity': bottleQuantity,
      'address': address,
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}
