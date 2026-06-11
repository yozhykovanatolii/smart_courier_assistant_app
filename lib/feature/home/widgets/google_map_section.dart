import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:smart_courier_assistant_app/feature/home/cubit/home_cubit.dart';
import 'package:smart_courier_assistant_app/feature/home/cubit/home_state.dart';

class GoogleMapSection extends StatefulWidget {
  const GoogleMapSection({super.key});

  @override
  State<GoogleMapSection> createState() => _GoogleMapSectionState();
}

class _GoogleMapSectionState extends State<GoogleMapSection> {
  GoogleMapController? _controller;

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit, HomeState>(
      listenWhen: (previous, current) {
        return previous.latitude != current.longitude ||
            previous.longitude != current.longitude;
      },
      listener: (context, state) {
        _updateMap(state);
      },
      child: GoogleMap(
        zoomControlsEnabled: false,
        myLocationEnabled: true,
        myLocationButtonEnabled: false,
        initialCameraPosition: const CameraPosition(
          target: LatLng(50.4501, 30.5234),
          zoom: 16,
        ),
        onMapCreated: (controller) => _controller ??= controller,
      ),
    );
  }

  void _updateMap(HomeState state) {
    if (_controller == null) return;
    if (state.latitude != 0 && state.longitude != 0) {
      _moveCameraToUser(state.latitude, state.longitude);
    }
  }

  void _moveCameraToUser(double lat, double lng) {
    if (_controller == null) return;

    _controller!.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(lat, lng),
          zoom: 16,
        ),
      ),
    );
  }
}
