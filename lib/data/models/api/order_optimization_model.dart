class OrderOptimizationModel {
  final int id;
  final double latitude;
  final double longitude;
  final DateTime deliveryBy;
  final String deliveryRisk;
  final DateTime plannedEta;
  final int orderIndex;
  OrderOptimizationModel({
    required this.id,
    required this.latitude,
    required this.longitude,
    required this.deliveryBy,
    required this.deliveryRisk,
    required this.plannedEta,
    required this.orderIndex,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'latitude': latitude,
      'longitude': longitude,
      'delivery_by': deliveryBy.millisecondsSinceEpoch,
      'delivery_risk': deliveryRisk,
      'planned_eta': plannedEta.millisecondsSinceEpoch,
      'order_index': orderIndex,
    };
  }
}
