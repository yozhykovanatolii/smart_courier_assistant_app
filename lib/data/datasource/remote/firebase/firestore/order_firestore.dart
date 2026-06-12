import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smart_courier_assistant_app/core/exceptions/orders_not_found_exception.dart';
import 'package:smart_courier_assistant_app/data/models/order_model.dart';

class OrderFirestore {
  final _firestore = FirebaseFirestore.instance;

  Future<void> saveOrder(
    String routeId, {
    String? clientFullName,
    String? clientPhoneNumber,
    String? address,
    double? latitude,
    double? longitude,
    String? recommendation,
    String? deliveryRisk,
    DateTime? plannedEta,
    DateTime? deliveryBy,
    String? status,
    int? orderIndex,
  }) async {
    OrderModel orderModel = OrderModel.initial();
    orderModel = orderModel.copyWith(
      clientFullName: clientFullName,
      clientPhoneNumber: clientPhoneNumber,
      address: address,
      latitude: latitude,
      longitude: longitude,
      plannedEta: plannedEta,
      deliveryBy: deliveryBy,
      deliveryRisk: deliveryRisk,
      recommendation: recommendation,
      status: status,
      orderIndex: orderIndex,
    );
    final docReference = _getOrderDocumentReference(orderModel.id, routeId);
    await docReference.set(orderModel);
  }

  Future<List<OrderModel>> getAllUserOrders(String routeId) async {
    final collectionReference = _getOrderCollectionReference(routeId);
    final querySnapshot = await collectionReference.orderBy('orderIndex').get();
    if (querySnapshot.docs.isEmpty) throw OrdersNotFoundException();
    return querySnapshot.docs.map((document) => document.data()).toList();
  }

  Future<void> saveOrders(
    List<OrderModel> orders,
    String routeId,
  ) async {
    final collectionReference = _getOrderCollectionReference(routeId);
    final batch = _firestore.batch();
    for (final order in orders) {
      batch.set(collectionReference.doc(order.id), order);
    }
    await batch.commit();
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
