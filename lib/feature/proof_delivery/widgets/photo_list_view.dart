import 'package:flutter/material.dart';
import 'package:smart_courier_assistant_app/feature/proof_delivery/widgets/dashed_border.dart';

class PhotoListView extends StatelessWidget {
  const PhotoListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.15,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return const _OpenGalleryButton();
        },
        separatorBuilder: (_, _) => const SizedBox(width: 10),
      ),
    );
  }
}

class _OpenGalleryButton extends StatelessWidget {
  const _OpenGalleryButton();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
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
