import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smart_courier_assistant_app/exceptions/route_not_found_exception.dart';
import 'package:smart_courier_assistant_app/data/models/route_model.dart';

class RouteFirestore {
  final _firestore = FirebaseFirestore.instance;

  Future<String> saveRoute({String? courierId, String? recomendation}) async {
    RouteModel routeModel = RouteModel.initial();
    routeModel = routeModel.copyWith(
      courierId: courierId,
      recommendation: recomendation,
    );
    final docReference = _getRouteDocumentReference(routeModel.routeId);
    await docReference.set(routeModel);
    return routeModel.routeId;
  }

  Future<String?> getTodayRouteId(String courierId) async {
    final now = DateTime.now();
    final startOfDay = DateTime(now.year, now.month, now.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));
    final querySnapshot = await _firestore
        .collection('routes')
        .where('courierId', isEqualTo: courierId)
        .where('date', isGreaterThanOrEqualTo: Timestamp.fromDate(startOfDay))
        .where('date', isLessThan: Timestamp.fromDate(endOfDay))
        .limit(1)
        .get();
    if (querySnapshot.docs.isNotEmpty) return querySnapshot.docs.first.id;
    return null;
  }

  Future<RouteModel> getTodayRoute(String courierId) async {
    final snapshot = await _todayRouteQuery(courierId).get();
    if (snapshot.docs.isEmpty) throw RouteNotFoundException();
    return snapshot.docs.first.data();
  }

  Stream<RouteModel> watchTodayRoute(String courierId) {
    return _todayRouteQuery(courierId).snapshots().map(
      (snapshot) {
        if (snapshot.docs.isEmpty) throw RouteNotFoundException();
        return snapshot.docs.first.data();
      },
    );
  }

  Future<void> saveRouteRecommendation(
    String recommendation,
    String routeId,
  ) async {
    final docReference = _getRouteDocumentReference(routeId);
    await docReference.update({'recommendation': recommendation});
  }

  Future<List<RouteModel>> getAllCourierRoutes(String courierId) async {
    final collectionReference = _getRouteCollectionReference();
    final querySnapshot = await collectionReference
        .where('courierId', isEqualTo: courierId)
        .get();
    if (querySnapshot.docs.isEmpty) throw RouteNotFoundException();
    return querySnapshot.docs.map((document) => document.data()).toList();
  }

  Query<RouteModel> _todayRouteQuery(String courierId) {
    final now = DateTime.now();
    final startOfDay = DateTime(now.year, now.month, now.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));

    return _getRouteCollectionReference()
        .where('courierId', isEqualTo: courierId)
        .where('date', isGreaterThanOrEqualTo: Timestamp.fromDate(startOfDay))
        .where('date', isLessThan: Timestamp.fromDate(endOfDay))
        .limit(1);
  }

  CollectionReference<RouteModel> _getRouteCollectionReference() {
    return _firestore
        .collection('routes')
        .withConverter(
          fromFirestore: RouteModel.fromFirestore,
          toFirestore: (RouteModel routeModel, options) =>
              routeModel.toFirestore(),
        );
  }

  DocumentReference<RouteModel> _getRouteDocumentReference(String id) {
    return _firestore
        .collection('routes')
        .doc(id)
        .withConverter(
          fromFirestore: RouteModel.fromFirestore,
          toFirestore: (RouteModel routeModel, options) =>
              routeModel.toFirestore(),
        );
  }
}
