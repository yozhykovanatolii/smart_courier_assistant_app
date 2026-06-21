import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:smart_courier_assistant_app/domain/entity/order_entity.dart';
import 'package:smart_courier_assistant_app/domain/entity/route_point_entity.dart';
import 'package:smart_courier_assistant_app/feature/home/bloc/home_bloc.dart';
import 'package:smart_courier_assistant_app/feature/home/bloc/home_state.dart';
import 'package:smart_courier_assistant_app/ui/marker_factory.dart';

class GoogleMapSection extends StatefulWidget {
  const GoogleMapSection({super.key});

  @override
  State<GoogleMapSection> createState() => _GoogleMapSectionState();
}

class _GoogleMapSectionState extends State<GoogleMapSection> {
  GoogleMapController? _controller;

  Set<Marker> _markers = {};
  Set<Polyline> _polylines = {};

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listenWhen: (previous, current) {
        return previous.latitude != current.longitude ||
            previous.longitude != current.longitude ||
            previous.routePoints != current.routePoints ||
            previous.orders != current.orders;
      },
      listener: (context, state) {
        _updateMap(state);
      },
      child: GoogleMap(
        zoomControlsEnabled: false,
        myLocationEnabled: true,
        myLocationButtonEnabled: false,
        markers: _markers,
        polylines: _polylines,
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
    setState(() {
      _polylines = _buildRoutePolyline(state.routePoints);
    });
    _updateMarkers(state.orders);
    if (state.routePoints.isNotEmpty) {
      _moveCameraToBounds(state.routePoints);
    } else if (state.latitude != 0 && state.longitude != 0) {
      _moveCameraToUser(state.latitude, state.longitude);
    }
  }

  Set<Polyline> _buildRoutePolyline(List<RoutePointEntity> points) {
    return {
      Polyline(
        polylineId: const PolylineId('route'),
        points: points
            .map((point) => LatLng(point.latitude, point.longitude))
            .toList(),
        width: 5,
        color: Colors.blue,
      ),
    };
  }

  Future<void> _updateMarkers(List<OrderEntity> orders) async {
    final Set<Marker> markers = {};
    for (int i = 0; i < orders.length; i++) {
      final order = orders[i];
      final icon = await MarkerFactory.numberedMarker(i + 1);

      markers.add(
        Marker(
          markerId: MarkerId(order.id),
          position: LatLng(order.address.latitude, order.address.longitude),
          icon: icon,
          infoWindow: InfoWindow(
            title: order.clientFullName,
            snippet: order.address.name,
          ),
        ),
      );
    }

    setState(() {
      _markers = markers;
    });
  }

  void _moveCameraToBounds(List<RoutePointEntity> points) {
    if (_controller == null || points.isEmpty) return;

    double minLat = points.first.latitude;
    double maxLat = points.first.latitude;
    double minLng = points.first.longitude;
    double maxLng = points.first.longitude;

    for (final p in points) {
      minLat = min(minLat, p.latitude);
      maxLat = max(maxLat, p.latitude);
      minLng = min(minLng, p.longitude);
      maxLng = max(maxLng, p.longitude);
    }

    _controller!.animateCamera(
      CameraUpdate.newLatLngBounds(
        LatLngBounds(
          southwest: LatLng(minLat, minLng),
          northeast: LatLng(maxLat, maxLng),
        ),
        50,
      ),
    );
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
