import 'package:smart_courier_assistant_app/data/datasource/remote/api/order_client.dart';
import 'package:smart_courier_assistant_app/data/datasource/remote/api/storage_client.dart';
import 'package:smart_courier_assistant_app/data/service/camera_picker_service.dart';
import 'package:smart_courier_assistant_app/data/service/geolocation_service.dart';
import 'package:smart_courier_assistant_app/domain/entity/order_entity.dart';
import 'package:smart_courier_assistant_app/domain/repository/order_repository.dart';

class OrderRepositoryApiImpl implements OrderRepository {
  final OrderClient _orderClient;
  final StorageClient _storageClient;

  OrderRepositoryApiImpl(this._orderClient, this._storageClient);

  @override
  Future<void> deleteOrder(String orderId) async {
    await _orderClient.deleteOrder(int.parse(orderId));
  }

  @override
  Stream<List<OrderEntity>> getAllCourierActiveOrders() {
    // TODO: implement getAllCourierActiveOrders
    throw UnimplementedError();
  }

  @override
  Future<List<OrderEntity>> getAllRouteOrders(String routeId) {
    // TODO: implement getAllRouteOrders
    throw UnimplementedError();
  }

  @override
  Future<String> getOrderPhoto() async {
    final orderImageFile = await CameraPickerService.pickImageFileFromGallery();
    final orderImageUrl = await _storageClient.uploadPhoto(
      orderImageFile,
      'orders',
    );
    return orderImageUrl;
  }

  @override
  Future<List<OrderEntity>> optimizeOrdersRoute(
    List<OrderEntity> orders,
    double latitude,
    double longitude,
  ) {
    // TODO: implement optimizeOrdersRoute
    throw UnimplementedError();
  }

  @override
  Future<void> saveOrder(
    String clientFullName,
    String clientPhoneNumber,
    String address,
    DateTime deliveryBy, {
    String? routeId,
    OrderEntity? currentOrder,
  }) async {
    final location = await GeolocationService.getLocationByAddress(address);
    await _orderClient.createOrder(
      clientFullName,
      clientPhoneNumber,
      address,
      deliveryBy,
      location.latitude,
      location.longitude,
    );
  }
}
