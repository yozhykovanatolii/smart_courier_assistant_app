import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_courier_assistant_app/feature/proof_delivery/cubit/proof_delivery_cubit.dart';
import 'package:smart_courier_assistant_app/feature/proof_delivery/widgets/dashed_border.dart';

class PhotoListView extends StatelessWidget {
  const PhotoListView({super.key});

  @override
  Widget build(BuildContext context) {
    final orderPhotos = context.select(
      (ProofDeliveryCubit proofDeliveryCubit) =>
          proofDeliveryCubit.state.orderPhotos,
    );

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.15,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: orderPhotos.length + 1,
        itemBuilder: (context, index) {
          if (index < orderPhotos.length) {
            return _PhotoCardItem(
              photoUrl: orderPhotos[index],
            );
          }
          return const _OpenGalleryButton();
        },
        separatorBuilder: (_, _) => const SizedBox(width: 10),
      ),
    );
  }
}

class _PhotoCardItem extends StatelessWidget {
  final String photoUrl;

  const _PhotoCardItem({
    required this.photoUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: 120,
          child: ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(12),
            child: Image.network(
              fit: BoxFit.cover,
              photoUrl,
            ),
          ),
        ),
        Positioned(
          left: 75,
          child: _DeletePhotoButton(photoUrl),
        ),
      ],
    );
  }
}

class _DeletePhotoButton extends StatelessWidget {
  final String photoUrl;

  const _DeletePhotoButton(this.photoUrl);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 30,
      onPressed: () =>
          context.read<ProofDeliveryCubit>().deleteOrderPhoto(photoUrl),
      style: const ButtonStyle(
        foregroundColor: WidgetStatePropertyAll(Colors.white),
      ),
      icon: const Icon(Icons.cancel),
    );
  }
}

class _OpenGalleryButton extends StatelessWidget {
  const _OpenGalleryButton();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<ProofDeliveryCubit>().addOrderPhoto();
      },
      child: CustomPaint(
        painter: DashedBorder(),
        child: Container(
          width: 120,
          alignment: Alignment.center,
          child: const Icon(
            size: 30,
            Icons.add_circle,
          ),
        ),
      ),
    );
  }
}
