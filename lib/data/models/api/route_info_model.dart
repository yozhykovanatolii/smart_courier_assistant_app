class RouteInfoModel {
  final int routeId;
  final int courierId;
  final DateTime createdAt;
  final String recommendation;

  RouteInfoModel({
    required this.routeId,
    required this.courierId,
    required this.createdAt,
    required this.recommendation,
  });

  factory RouteInfoModel.fromJson(Map<String, dynamic> json) {
    return RouteInfoModel(
      routeId: json['id'] as int,
      courierId: json['courier_id'] as int,
      createdAt: DateTime.parse(json['created_at'] as String),
      recommendation: json['recommendation'] as String,
    );
  }
}
