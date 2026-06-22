import 'package:smart_courier_assistant_app/data/models/firestore/order_model.dart';
import 'package:smart_courier_assistant_app/data/models/firestore/route_model.dart';
import 'package:smart_courier_assistant_app/domain/entity/route_entity.dart';

extension RouteMapper on RouteModel {
  RouteEntity toEntity(List<OrderModel> ordersModel) {
    final delayedOrdersCount = ordersModel
        .where(
          (orderModel) => orderModel.deliveryRisk == 'Delayed',
        )
        .length;
    return RouteEntity(
      routeId: routeId,
      ordersCount: ordersModel.length,
      delayedOrdersCount: delayedOrdersCount,
      createAt: date,
    );
  }
}
