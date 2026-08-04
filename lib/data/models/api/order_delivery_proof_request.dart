class OrderDeliveryProofRequest {
  final String courierComment;
  final List<String> orderPhotos;
  final DateTime confirmedAt;

  OrderDeliveryProofRequest({
    required this.courierComment,
    required this.orderPhotos,
    required this.confirmedAt,
  });

  factory OrderDeliveryProofRequest.initial(
    String courierComment,
    List<String> orderPhotos,
  ) {
    final todayDate = DateTime.now();

    return OrderDeliveryProofRequest(
      courierComment: courierComment,
      orderPhotos: orderPhotos,
      confirmedAt: todayDate,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'courierComment': courierComment,
      'orderPhotos': orderPhotos,
      'confirmedAt': confirmedAt.millisecondsSinceEpoch,
    };
  }
}
