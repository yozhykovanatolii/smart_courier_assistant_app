import 'package:smart_courier_assistant_app/data/datasource/remote/firebase/firebase_auth/user_auth.dart';
import 'package:smart_courier_assistant_app/data/datasource/remote/firebase/firestore/order_firestore.dart';
import 'package:smart_courier_assistant_app/data/datasource/remote/firebase/firestore/route_firestore.dart';
import 'package:smart_courier_assistant_app/data/models/order_model.dart';
import 'package:smart_courier_assistant_app/data/service/geolocation_service.dart';

class OrderRepository {
  final OrderFirestore _orderFirestore;
  final UserAuth _userAuth;
  final RouteFirestore _routeFirestore;
  String _routeId = '';

  OrderRepository(
    this._orderFirestore,
    this._userAuth,
    this._routeFirestore,
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
    print('Success route: ${routeModel.routeId}');
    return await _orderFirestore.getAllUserOrders(
      routeModel.routeId,
    );
  }
}
