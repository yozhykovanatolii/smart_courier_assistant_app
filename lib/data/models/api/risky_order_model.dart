import 'package:smart_courier_assistant_app/data/models/api/order_info_model.dart';

class RiskyOrderModel {
  final String id;
  final String address;
  final String deliveryRisk;
  final int delayMinutes;
  final int positionInRoute;

  RiskyOrderModel({
    required this.id,
    required this.address,
    required this.deliveryRisk,
    required this.delayMinutes,
    required this.positionInRoute,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'address': address,
      'delivery_risk': deliveryRisk,
      'delay_minutes': delayMinutes,
      'position_in_route': positionInRoute,
    };
  }

  @override
  String toString() {
    return 'Order #$id at "$address" is delivery risk $deliveryRisk, delay about $delayMinutes min, position $positionInRoute in route';
  }

  factory RiskyOrderModel.fromOrderInfo(OrderInfoModel orderInfo) {
    return RiskyOrderModel(
      id: orderInfo.id.toString(),
      address: orderInfo.address,
      deliveryRisk: orderInfo.deliveryRisk,
      delayMinutes: orderInfo.deliveryBy
          .difference(orderInfo.plannedEta)
          .inMinutes,
      positionInRoute: orderInfo.orderIndex,
    );
  }
}
