import 'package:smart_courier_assistant_app/data/datasource/remote/api/route_optimize_client.dart';
import 'package:smart_courier_assistant_app/data/datasource/remote/firebase/firebase_auth/user_auth.dart';
import 'package:smart_courier_assistant_app/data/datasource/remote/firebase/firestore/order_firestore.dart';
import 'package:smart_courier_assistant_app/data/datasource/remote/firebase/firestore/route_firestore.dart';
import 'package:smart_courier_assistant_app/data/datasource/remote/supabase/supabase_storage.dart';
import 'package:smart_courier_assistant_app/data/mapper/order_mapper.dart';
import 'package:smart_courier_assistant_app/data/mapper/proof_delivery_mapper.dart';
import 'package:smart_courier_assistant_app/data/models/order_model.dart';
import 'package:smart_courier_assistant_app/data/service/camera_picker_service.dart';
import 'package:smart_courier_assistant_app/data/service/geolocation_service.dart';
import 'package:smart_courier_assistant_app/domain/entity/order_entity.dart';
import 'package:smart_courier_assistant_app/domain/repository/order_repository.dart';
import 'package:smart_courier_assistant_app/util/calculation_eta_util.dart';

class OrderRepositoryImpl implements OrderRepository {
  final OrderFirestore _orderFirestore;
  final UserAuth _userAuth;
  final RouteFirestore _routeFirestore;
  final RouteOptimizeClient _optimizeClient;
  final SupabaseStorage _supabaseStorage;
  String _routeId = '';

  OrderRepositoryImpl(
    this._orderFirestore,
    this._userAuth,
    this._routeFirestore,
    this._optimizeClient,
    this._supabaseStorage,
  );

  @override
  Future<void> saveOrder(
    String routeId,
    String clientFullName,
    String clientPhoneNumber,
    String address,
    DateTime deliveryBy, {
    OrderEntity? currentOrder,
  }) async {
    final location = await GeolocationService.getLocationByAddress(address);
    OrderModel orderModel = OrderModel.initial();
    orderModel = orderModel.copyWith(
      id: currentOrder?.id,
      clientFullName: clientFullName,
      clientPhoneNumber: clientPhoneNumber,
      address: address,
      latitude: location.latitude,
      longitude: location.longitude,
      deliveryBy: deliveryBy,
      plannedEta: currentOrder?.plannedEta,
      recommendation: currentOrder?.recommendation ?? orderModel.recommendation,
      proofDelivery: ProofDeliveryMapper.fromEntity(
        currentOrder?.proofDeliveryEntity,
      ),
    );
    await _orderFirestore.saveOrder(orderModel, routeId);
  }

  @override
  Stream<List<OrderEntity>> getAllCourierActiveOrders() {
    final courierId = _userAuth.userId;
    return _routeFirestore.watchTodayRoute(courierId).asyncExpand((routeModel) {
      _routeId = routeModel.routeId;
      return _orderFirestore
          .getActiveUserOrders(routeModel.routeId)
          .map((orders) => orders.map(OrderMapper.toEntity).toList());
    });
  }

  @override
  Future<List<OrderEntity>> getAllRouteOrders(String routeId) async {
    final ordersModel = await _orderFirestore.getAllRouteOrders(routeId);
    return ordersModel
        .map((orderModel) => OrderMapper.toEntity(orderModel))
        .toList();
  }

  @override
  Future<void> deleteOrder(String orderId) async {
    final courierId = _userAuth.userId;
    final route = await _routeFirestore.getTodayRoute(courierId);
    await _orderFirestore.deleteOrder(orderId, route.routeId);
  }

  @override
  Future<List<OrderEntity>> optimizeOrdersRoute(
    List<OrderEntity> orders,
    double latitude,
    double longitude,
  ) async {
    final ordersModel = orders
        .map((order) => OrderMapper.fromEntity(order))
        .toList();
    final steps = await _optimizeClient.optimizeRoute(
      ordersModel,
      latitude,
      longitude,
    );
    final updatedOrders = CalculationEtaUtil.calculateEtaForOrders(
      steps,
      ordersModel,
    );
    await _orderFirestore.saveOrders(updatedOrders, _routeId);
    return updatedOrders
        .map((updatedOrder) => OrderMapper.toEntity(updatedOrder))
        .toList();
  }

  @override
  Future<String> getOrderPhoto() async {
    final orderImageFile = await CameraPickerService.pickImageFileFromGallery();
    final orderImageUrl = await _supabaseStorage.saveImage(
      orderImageFile,
      'orders',
    );
    return orderImageUrl;
  }
}
