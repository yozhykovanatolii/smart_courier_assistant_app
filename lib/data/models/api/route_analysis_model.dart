import 'package:smart_courier_assistant_app/data/models/api/risky_order_model.dart';

class RouteAnalysisModel {
  final String languageCode;
  final int totalOrders;
  final List<RiskyOrderModel> riskyOrders;

  RouteAnalysisModel({
    required this.languageCode,
    required this.totalOrders,
    required this.riskyOrders,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'language_code': languageCode,
      'total_orders': totalOrders,
      'risky_orders': riskyOrders.map((o) => o.toJson()).toList(),
    };
  }

  String generateUserPrompt() {
    final buffer = StringBuffer();
    buffer.writeln('Route analysis:');
    buffer.writeln('Total orders: $totalOrders');
    buffer.writeln('Orders at risk or delayed: ${riskyOrders.length}\n');
    for (var o in riskyOrders) {
      buffer.writeln(
        'Order #${o.id} at "${o.address}", delay about ${o.delayMinutes} min, position ${o.positionInRoute} in route',
      );
    }
    return buffer.toString();
  }
}
