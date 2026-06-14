import 'package:smart_courier_assistant_app/data/datasource/remote/api/route_optimize_client.dart';
import 'package:smart_courier_assistant_app/data/datasource/remote/firebase/firebase_auth/user_auth.dart';
import 'package:smart_courier_assistant_app/data/datasource/remote/firebase/firestore/order_firestore.dart';
import 'package:smart_courier_assistant_app/data/datasource/remote/firebase/firestore/route_firestore.dart';
import 'package:smart_courier_assistant_app/data/models/order_model.dart';
import 'package:smart_courier_assistant_app/data/service/geolocation_service.dart';
import 'package:smart_courier_assistant_app/util/calculation_eta_util.dart';

class OrderRepository {
  final OrderFirestore _orderFirestore;
  final UserAuth _userAuth;
  final RouteFirestore _routeFirestore;
  final RouteOptimizeClient _optimizeClient;
  String _routeId = '';

  OrderRepository(
    this._orderFirestore,
    this._userAuth,
    this._routeFirestore,
    this._optimizeClient,
  );

  Future<void> saveOrder(
    String routeId,
    String clientFullName,
    String clientPhoneNumber,
    String address,
    DateTime deliveryBy,
  ) async {
    final location = await GeolocationService.getLocationByAddress(address);
    await _orderFirestore.saveOrder(
      routeId,
      clientFullName: clientFullName,
      clientPhoneNumber: clientPhoneNumber,
      address: address,
      deliveryBy: deliveryBy,
      latitude: location.latitude,
      longitude: location.longitude,
    );
  }

  Future<List<OrderModel>> getAllCourierActiveOrders() async {
    final courierId = _userAuth.userId;
    final routeModel = await _routeFirestore.getTodayRoute(courierId);
    _routeId = routeModel.routeId;
    return await _orderFirestore.getAllUserOrders(
      routeModel.routeId,
    );
  }

  Future<void> deleteOrder(String orderId) async {
    final courierId = _userAuth.userId;
    final route = await _routeFirestore.getTodayRoute(courierId);
    await _orderFirestore.deleteOrder(orderId, route.routeId);
  }

  Future<List<OrderModel>> optimizeOrdersRoute(
    List<OrderModel> orders,
    double latitude,
    double longitude,
  ) async {
    final steps = await _optimizeClient.optimizeRoute(
      orders,
      latitude,
      longitude,
    );
    final updatedOrders = CalculationEtaUtil.calculateEtaForOrders(
      steps,
      orders,
    );
    await _orderFirestore.saveOrders(updatedOrders, _routeId);
    return updatedOrders;
  }
}
