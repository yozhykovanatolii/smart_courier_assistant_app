import 'package:smart_courier_assistant_app/domain/entity/order_entity.dart';

abstract interface class OrderRepository {
  Future<void> saveOrder(
    String routeId,
    String clientFullName,
    String clientPhoneNumber,
    String address,
    DateTime deliveryBy, {
    OrderEntity? currentOrder,
  });
  Future<List<OrderEntity>> getAllRouteOrders(String routeId);
  Stream<List<OrderEntity>> getAllCourierActiveOrders();
  Future<List<OrderEntity>> optimizeOrdersRoute(
    List<OrderEntity> orders,
    double latitude,
    double longitude,
  );
  Future<void> deleteOrder(String orderId);
  Future<String> getOrderPhoto();
}
