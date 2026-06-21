import 'package:smart_courier_assistant_app/data/datasource/remote/firebase/firebase_auth/user_auth.dart';
import 'package:smart_courier_assistant_app/data/datasource/remote/firebase/firestore/order_firestore.dart';
import 'package:smart_courier_assistant_app/data/datasource/remote/firebase/firestore/route_firestore.dart';
import 'package:smart_courier_assistant_app/data/models/proof_delivery_model.dart';
import 'package:smart_courier_assistant_app/domain/repository/delivery_repository.dart';

class DeliveryRepositoryImpl implements DeliveryRepository {
  final UserAuth _userAuth;
  final RouteFirestore _routeFirestore;
  final OrderFirestore _orderFirestore;

  DeliveryRepositoryImpl(
    this._userAuth,
    this._routeFirestore,
    this._orderFirestore,
  );

  @override
  Future<void> createProofOfDelivery(
    String orderId,
    String courierComment,
    List<String> orderPhotos,
  ) async {
    final courierId = _userAuth.userId;
    final route = await _routeFirestore.getTodayRoute(courierId);
    final proofDelivery = ProofDeliveryModel(
      courierComment: courierComment,
      orderPhotos: orderPhotos,
      confirmedAt: DateTime.now(),
    );
    await _orderFirestore.updateOrderProofDelivery(
      proofDelivery,
      route.routeId,
      orderId,
    );
  }
}
