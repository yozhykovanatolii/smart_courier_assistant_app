import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smart_courier_assistant_app/exceptions/orders_not_found_exception.dart';
import 'package:smart_courier_assistant_app/data/models/order_model.dart';
import 'package:smart_courier_assistant_app/data/models/proof_delivery_model.dart';

class OrderFirestore {
  final _firestore = FirebaseFirestore.instance;

  Future<void> saveOrder(OrderModel orderModel, String routeId) async {
    final docReference = _getOrderDocumentReference(orderModel.id, routeId);
    await docReference.set(orderModel);
  }

  Future<List<OrderModel>> getAllRouteOrders(String routeId) async {
    final collectionReference = _getOrderCollectionReference(routeId);
    final querySnapshot = await collectionReference.get();
    if (querySnapshot.docs.isEmpty) throw OrdersNotFoundException();
    return querySnapshot.docs.map((document) => document.data()).toList();
  }

  Stream<List<OrderModel>> getActiveUserOrders(String routeId) {
    final collectionReference = _getOrderCollectionReference(routeId);
    return collectionReference
        .where('status', isNotEqualTo: 'Delivered')
        .orderBy('orderIndex')
        .snapshots()
        .map(
          (snapshot) {
            if (snapshot.docs.isEmpty) throw OrdersNotFoundException();
            return snapshot.docs.map((document) => document.data()).toList();
          },
        );
  }

  Future<void> saveOrders(List<OrderModel> orders, String routeId) async {
    final collectionReference = _getOrderCollectionReference(routeId);
    final batch = _firestore.batch();
    for (final order in orders) {
      batch.set(collectionReference.doc(order.id), order);
    }
    await batch.commit();
  }

  Future<void> deleteOrder(String orderId, String routeId) async {
    final collectionReference = _getOrderCollectionReference(routeId);
    await collectionReference.doc(orderId).delete();
  }

  Future<void> updateOrderProofDelivery(
    ProofDeliveryModel proofDelivery,
    String routeId,
    String orderId,
  ) async {
    final docReference = _getOrderDocumentReference(orderId, routeId);
    await docReference.update({
      'status': 'Delivered',
      'proofDelivery': proofDelivery.toFirestore(),
    });
  }

  CollectionReference<OrderModel> _getOrderCollectionReference(String routeId) {
    return _firestore
        .collection('routes')
        .doc(routeId)
        .collection('orders')
        .withConverter(
          fromFirestore: OrderModel.fromFirestore,
          toFirestore: (OrderModel orderModel, options) =>
              orderModel.toFirestore(),
        );
  }

  DocumentReference<OrderModel> _getOrderDocumentReference(
    String id,
    String routeId,
  ) {
    return _firestore
        .collection('routes')
        .doc(routeId)
        .collection('orders')
        .doc(id)
        .withConverter(
          fromFirestore: OrderModel.fromFirestore,
          toFirestore: (OrderModel orderModel, options) =>
              orderModel.toFirestore(),
        );
  }
}
