import 'package:cloud_firestore/cloud_firestore.dart';
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
