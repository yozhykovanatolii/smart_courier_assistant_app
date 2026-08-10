import 'package:smart_courier_assistant_app/data/models/api/order_info_model.dart';
import 'package:smart_courier_assistant_app/data/models/api/route_info_model.dart';
import 'package:smart_courier_assistant_app/domain/entity/route_entity.dart';

extension RouteInfoMapper on RouteInfoModel {
  RouteEntity toEntity(List<OrderInfoModel> orders) {
    final delayedOrdersCount = orders
        .where(
          (order) => order.deliveryRisk == 'Delayed',
        )
        .length;
    return RouteEntity(
      routeId: routeId.toString(),
      ordersCount: orders.length,
      delayedOrdersCount: delayedOrdersCount,
      createAt: createdAt,
    );
  }
}
