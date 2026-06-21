import 'package:smart_courier_assistant_app/domain/entity/address_entity.dart';
import 'package:smart_courier_assistant_app/domain/entity/proof_delivery_entity.dart';

enum DeliveryRisk {
  unknown('Unknown'),
  onTime('On time'),
  atRisk('At risk'),
  delayed('Delayed');

  final String text;

  const DeliveryRisk(this.text);
}

class OrderEntity {
  final String id;
  final String clientFullName;
  final String clientPhoneNumber;
  final AddressEntity address;
  final DateTime plannedEta;
  final DateTime deliveryBy;
  final DeliveryRisk deliveryRisk;
  final ProofDeliveryEntity? proofDeliveryEntity;
  final String recommendation;
  final String status;
  final int orderIndex;

  OrderEntity({
    required this.id,
    required this.clientFullName,
    required this.clientPhoneNumber,
    required this.address,
    required this.plannedEta,
    required this.deliveryBy,
    required this.deliveryRisk,
    required this.proofDeliveryEntity,
    required this.recommendation,
    required this.status,
    required this.orderIndex,
  });

  factory OrderEntity.initial() {
    return OrderEntity(
      id: '',
      clientFullName: '',
      clientPhoneNumber: '',
      address: AddressEntity.initial(),
      plannedEta: DateTime.now(),
      deliveryBy: DateTime.now(),
      deliveryRisk: DeliveryRisk.onTime,
      proofDeliveryEntity: null,
      recommendation: '',
      status: '',
      orderIndex: 0,
    );
  }

  OrderEntity copyWith({
    String? id,
    String? clientFullName,
    String? clientPhoneNumber,
    AddressEntity? address,
    DateTime? plannedEta,
    DateTime? deliveryBy,
    DeliveryRisk? deliveryRisk,
    ProofDeliveryEntity? proofDeliveryEntity,
    String? recommendation,
    String? status,
    int? orderIndex,
  }) {
    return OrderEntity(
      id: id ?? this.id,
      clientFullName: clientFullName ?? this.clientFullName,
      clientPhoneNumber: clientPhoneNumber ?? this.clientPhoneNumber,
      address: address ?? this.address,
      plannedEta: plannedEta ?? this.plannedEta,
      deliveryBy: deliveryBy ?? this.deliveryBy,
      deliveryRisk: deliveryRisk ?? this.deliveryRisk,
      proofDeliveryEntity: proofDeliveryEntity ?? this.proofDeliveryEntity,
      recommendation: recommendation ?? this.recommendation,
      status: status ?? this.status,
      orderIndex: orderIndex ?? this.orderIndex,
    );
  }
}
