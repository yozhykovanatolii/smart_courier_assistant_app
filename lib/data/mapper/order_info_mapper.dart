import 'package:smart_courier_assistant_app/data/models/api/order_info_model.dart';
import 'package:smart_courier_assistant_app/domain/entity/address_entity.dart';
import 'package:smart_courier_assistant_app/domain/entity/order_entity.dart';

class OrderInfoMapper {
  static OrderEntity toEntity(OrderInfoModel orderModel) {
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
      proofDeliveryEntity: null,
      recommendation: '',
      status: orderModel.status,
      orderIndex: 0,
    );
  }

  static OrderInfoModel fromEntity(OrderEntity order) {
    return OrderInfoModel(
      id: int.parse(order.id),
      routeId: 1,
      clientFullName: order.clientFullName,
      clientPhoneNumber: order.clientPhoneNumber,
      address: order.address.name,
      latitude: order.address.latitude,
      longitude: order.address.longitude,
      plannedEta: order.plannedEta,
      deliveryBy: order.deliveryBy,
      deliveryRisk: order.deliveryRisk.text,
      status: order.status,
    );
  }

  static DeliveryRisk _mapFromText(String textRisk) {
    return DeliveryRisk.values.firstWhere(
      (status) => status.text == textRisk,
      orElse: () => DeliveryRisk.unknown,
    );
  }
}
