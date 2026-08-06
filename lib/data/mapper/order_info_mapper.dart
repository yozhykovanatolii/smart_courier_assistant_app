import 'package:smart_courier_assistant_app/data/models/api/order_info_model.dart';
import 'package:smart_courier_assistant_app/domain/entity/address_entity.dart';
import 'package:smart_courier_assistant_app/domain/entity/order_entity.dart';
import 'package:smart_courier_assistant_app/domain/entity/proof_delivery_entity.dart';

class OrderInfoMapper {
  static OrderEntity toEntity(OrderInfoModel orderModel) {
    final proofDeliveryEntity = orderModel.courierComment != null
        ? ProofDeliveryEntity(
            courierComment: orderModel.courierComment!,
            orderPhotos: orderModel.orderPhotosUrl!,
            confirmedAt: orderModel.confirmedAt!,
          )
        : null;
    return OrderEntity(
      id: orderModel.id.toString(),
      clientFullName: orderModel.clientFullName,
      clientPhoneNumber: orderModel.clientPhoneNumber,
      address: AddressEntity(
        name: orderModel.address,
        latitude: orderModel.latitude,
        longitude: orderModel.longitude,
      ),
      plannedEta: orderModel.plannedEta,
      deliveryBy: orderModel.deliveryBy,
      deliveryRisk: _mapFromText(orderModel.deliveryRisk),
      proofDeliveryEntity: proofDeliveryEntity,
      recommendation: '',
      status: orderModel.status,
      orderIndex: orderModel.orderIndex,
    );
  }

  static OrderInfoModel fromEntity(OrderEntity order) {
    return OrderInfoModel(
      id: int.parse(order.id),
      clientFullName: order.clientFullName,
      clientPhoneNumber: order.clientPhoneNumber,
      address: order.address.name,
      latitude: order.address.latitude,
      longitude: order.address.longitude,
      plannedEta: order.plannedEta,
      deliveryBy: order.deliveryBy,
      deliveryRisk: order.deliveryRisk.text,
      status: order.status,
      courierComment: order.proofDeliveryEntity?.courierComment,
      confirmedAt: order.proofDeliveryEntity?.confirmedAt,
      orderPhotosUrl: order.proofDeliveryEntity?.orderPhotos,
      orderIndex: order.orderIndex,
    );
  }

  static DeliveryRisk _mapFromText(String textRisk) {
    return DeliveryRisk.values.firstWhere(
      (status) => status.text == textRisk,
      orElse: () => DeliveryRisk.unknown,
    );
  }
}
