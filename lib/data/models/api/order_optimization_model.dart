class OrderOptimizationModel {
  final int id;
  final double latitude;
  final double longitude;
  final DateTime deliveryBy;
  final String deliveryRisk;
  final DateTime plannedEta;
  final int bottleQuantity;
  final int orderIndex;
  OrderOptimizationModel({
    required this.id,
    required this.latitude,
    required this.longitude,
    required this.deliveryBy,
    required this.deliveryRisk,
    required this.plannedEta,
    required this.bottleQuantity,
    required this.orderIndex,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'latitude': latitude,
      'longitude': longitude,
      'delivery_by': deliveryBy.millisecondsSinceEpoch,
      'bottle_quantity': bottleQuantity,
      'delivery_risk': deliveryRisk,
      'planned_eta': plannedEta.millisecondsSinceEpoch,
      'order_index': orderIndex,
    };
  }
}
