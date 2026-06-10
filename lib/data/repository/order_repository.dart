import 'package:smart_courier_assistant_app/data/datasource/remote/firebase/firestore/order_firestore.dart';
import 'package:smart_courier_assistant_app/data/service/geolocation_service.dart';

class OrderRepository {
  final OrderFirestore _orderFirestore;

  OrderRepository(this._orderFirestore);

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
}
