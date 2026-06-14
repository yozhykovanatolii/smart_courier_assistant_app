import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

enum DeliveryRisk {
  unknown,
  onTime,
  atRisk,
  delayed;

  static DeliveryRisk fromFirestore(String risk) {
    return DeliveryRisk.values.firstWhere(
      (deliveryRisk) => deliveryRisk.name == risk,
      orElse: () => DeliveryRisk.unknown,
    );
  }
}

class OrderModel {
  final String id;
  final String clientFullName;
  final String clientPhoneNumber;
  final String address;
  final double latitude;
  final double longitude;
  final DateTime plannedEta;
  final DateTime deliveryBy;
  final DeliveryRisk deliveryRisk;
  final String recommendation;
  final String status;
  final int orderIndex;

  OrderModel({
    required this.id,
    required this.clientFullName,
    required this.clientPhoneNumber,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.plannedEta,
    required this.deliveryBy,
    required this.deliveryRisk,
    required this.recommendation,
    required this.status,
    required this.orderIndex,
  });

  factory OrderModel.initial() {
    return OrderModel(
      id: const Uuid().v1(),
      clientFullName: '',
      clientPhoneNumber: '',
      address: '',
      latitude: 0,
      longitude: 0,
      recommendation: 'Uknown',
      deliveryRisk: DeliveryRisk.unknown,
      plannedEta: DateTime.now(),
      deliveryBy: DateTime.now(),
      status: 'Active',
      orderIndex: 0,
    );
  }

  Map<String, dynamic> toFirestore() {
    return <String, dynamic>{
      'id': id,
      'clientFullName': clientFullName,
      'clientPhoneNumber': clientPhoneNumber,
      'address': address,
      'latitude': latitude,
      'longitude': longitude,
      'plannedEta': Timestamp.fromDate(plannedEta),
      'deliveryBy': Timestamp.fromDate(deliveryBy),
      'deliveryRisk': deliveryRisk.name,
      'status': status,
      'recommendation': recommendation,
      'orderIndex': orderIndex,
    };
  }

  factory OrderModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return OrderModel(
      id: data?['id'] as String,
      clientFullName: data?['clientFullName'] as String,
      clientPhoneNumber: data?['clientPhoneNumber'] as String,
      address: data?['address'] as String,
      latitude: data?['latitude'] as double,
      longitude: data?['longitude'] as double,
      plannedEta: (data?['plannedEta'] as Timestamp).toDate(),
      deliveryBy: (data?['deliveryBy'] as Timestamp).toDate(),
      status: data?['status'] as String,
      deliveryRisk: DeliveryRisk.fromFirestore(data?['deliveryRisk'] as String),
      recommendation: data?['recommendation'] as String,
      orderIndex: (data?['orderIndex'] ?? 0) as int,
    );
  }

  OrderModel copyWith({
    String? id,
    String? clientFullName,
    String? clientPhoneNumber,
    String? address,
    double? latitude,
    double? longitude,
    DateTime? plannedEta,
    DateTime? deliveryBy,
    DeliveryRisk? deliveryRisk,
    String? recommendation,
    String? status,
    int? orderIndex,
  }) {
    return OrderModel(
      id: id ?? this.id,
      clientFullName: clientFullName ?? this.clientFullName,
      clientPhoneNumber: clientPhoneNumber ?? this.clientPhoneNumber,
      address: address ?? this.address,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      plannedEta: plannedEta ?? this.plannedEta,
      deliveryBy: deliveryBy ?? this.deliveryBy,
      deliveryRisk: deliveryRisk ?? this.deliveryRisk,
      recommendation: recommendation ?? this.recommendation,
      status: status ?? this.status,
      orderIndex: orderIndex ?? this.orderIndex,
    );
  }
}
