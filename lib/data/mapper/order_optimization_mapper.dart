import 'package:smart_courier_assistant_app/data/models/api/order_optimization_model.dart';
import 'package:smart_courier_assistant_app/domain/entity/order_entity.dart';

class OrderOptimizationMapper {
  static OrderOptimizationModel fromEntity(OrderEntity orderEntity) {
    return OrderOptimizationModel(
      id: int.parse(orderEntity.id),
      latitude: orderEntity.address.latitude,
      longitude: orderEntity.address.longitude,
      deliveryBy: orderEntity.deliveryBy,
      deliveryRisk: orderEntity.deliveryRisk.text,
      plannedEta: orderEntity.plannedEta,
      orderIndex: orderEntity.orderIndex,
    );
  }
}
