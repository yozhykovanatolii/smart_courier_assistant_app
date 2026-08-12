import 'dart:async';
import 'package:smart_courier_assistant_app/data/datasource/remote/order_client.dart';
import 'package:smart_courier_assistant_app/data/datasource/remote/route_client.dart';
import 'package:smart_courier_assistant_app/data/datasource/remote/storage_client.dart';
import 'package:smart_courier_assistant_app/data/mapper/order_info_mapper.dart';
import 'package:smart_courier_assistant_app/data/mapper/order_optimization_mapper.dart';
import 'package:smart_courier_assistant_app/data/models/api/order_info_model.dart';
import 'package:smart_courier_assistant_app/data/service/camera_picker_service.dart';
import 'package:smart_courier_assistant_app/data/service/geolocation_service.dart';
import 'package:smart_courier_assistant_app/domain/entity/order_entity.dart';
import 'package:smart_courier_assistant_app/domain/repository/order_repository.dart';

class OrderRepositoryImpl implements OrderRepository {
  final OrderClient _orderClient;
  final RouteClient _routeClient;
  final StorageClient _storageClient;

  final _ordersController = StreamController<List<OrderInfoModel>>();

  OrderRepositoryImpl(
    this._orderClient,
    this._routeClient,
    this._storageClient,
  );

  @override
  Future<void> loadTodayOrders() async {
    try {
      final todayOrders = await _orderClient.getTodayOrders();
      _ordersController.sink.add(todayOrders);
    } catch (exception) {
      _ordersController.addError(exception);
    }
  }

  @override
  Future<void> deleteOrder(String orderId) async {
    await _orderClient.deleteOrder(int.parse(orderId));
    await loadTodayOrders();
  }

  @override
  Stream<List<OrderEntity>> getAllCourierActiveOrders() {
    return _ordersController.stream.map((todayOrders) {
      return todayOrders
          .map((todayOrder) => OrderInfoMapper.toEntity(todayOrder))
          .toList();
    });
  }

  @override
  Future<List<OrderEntity>> getAllRouteOrders(String routeId) async {
    final orders = await _orderClient.getRouteOrders(int.parse(routeId));
    return orders.map((order) => OrderInfoMapper.toEntity(order)).toList();
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
  ) async {
    final ordersOptimization = orders
        .map(
          (order) => OrderOptimizationMapper.fromEntity(order),
        )
        .toList();
    final updatedOrders = await _routeClient.optimizeRoute(
      latitude,
      longitude,
      ordersOptimization,
    );
    _ordersController.sink.add(updatedOrders);
    return updatedOrders
        .map((updatedOrder) => OrderInfoMapper.toEntity(updatedOrder))
        .toList();
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
    final orderId = currentOrder?.id;
    if (orderId == null) {
      await _orderClient.createOrder(
        clientFullName,
        clientPhoneNumber,
        address,
        deliveryBy,
        location.latitude,
        location.longitude,
      );
    } else {
      await _orderClient.updateOrder(
        int.parse(orderId),
        clientFullName,
        clientPhoneNumber,
        address,
        deliveryBy,
        location.latitude,
        location.longitude,
      );
    }
    await loadTodayOrders();
  }

  @override
  Future<void> createOrderProofOfDelivery(
    String orderId,
    String courierComment,
    List<String> orderPhotos,
  ) async {
    await _orderClient.proofDeliveryOfOrder(
      orderId,
      courierComment,
      orderPhotos,
    );
    await loadTodayOrders();
  }
}
