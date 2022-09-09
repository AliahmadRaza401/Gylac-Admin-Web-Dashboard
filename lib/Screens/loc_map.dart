// ignore_for_file: unused_element, prefer_const_constructors, must_be_immutable, use_key_in_widget_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latlng/latlng.dart';
import 'package:map/map.dart';

class MarkersPage extends StatefulWidget {
  double lat;
  double lang;
  MarkersPage({required this.lat, required this.lang});

  @override
  _MarkersPageState createState() => _MarkersPageState(lang: lang, lat: lat);
}

class _MarkersPageState extends State<MarkersPage> {
  late double lat;
  late double lang;
  _MarkersPageState({required this.lat, required this.lang});
  var controller = MapController(
    location: LatLng(35.68, 51.41),
  );

  // final markers = [
  //   LatLng(35.674, 51.41),
  // ];

  void _gotoDefault() {
    controller.center = LatLng(lat, lang);
    setState(() {});
  }

  void _onDoubleTap() {
    controller.zoom += 0.5;
    setState(() {});
  }

  Offset? _dragStart;
  double _scaleStart = 1.0;
  void _onScaleStart(ScaleStartDetails details) {
    _dragStart = details.focalPoint;
    _scaleStart = 1.0;
  }

  void _onScaleUpdate(ScaleUpdateDetails details) {
    final scaleDiff = details.scale - _scaleStart;
    _scaleStart = details.scale;

    if (scaleDiff > 0) {
      controller.zoom += 0.02;
      setState(() {});
    } else if (scaleDiff < 0) {
      controller.zoom -= 0.02;
      setState(() {});
    } else {
      final now = details.focalPoint;
      final diff = now - _dragStart!;
      _dragStart = now;
      // controller.drag(diff.dx, diff.dy);
      setState(() {});
    }
  }

  Widget _buildMarkerWidget(Offset pos, Color color,
      [IconData icon = Icons.location_on]) {
    return Positioned(
      left: pos.dx - 24,
      top: pos.dy - 24,
      width: 48,
      height: 48,
      child: GestureDetector(
        child: Icon(
          icon,
          color: color,
          size: 48,
        ),
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: Text('clickMarker'.tr),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    controller = MapController(
      location: LatLng(lat, lang),
    );
    return MapLayoutBuilder(
      controller: controller,
      builder: (context, transformer) {
        // final markerPositions =
        //     markers.map(transformer.fromLatLngToXYCoords).toList();

        // final markerWidgets = markerPositions.map(
        //   (pos) => _buildMarkerWidget(pos, Colors.red),
        // );

        // final homeLocation =
            // transformer.fromLatLngToXYCoords(LatLng(lat, lang));

        // final homeMarkerWidget =
        //     _buildMarkerWidget(homeLocation, Colors.red, Icons.location_on);

        // final centerLocation = Offset(transformer.constraints.biggest.width / 2,
        //     transformer.constraints.biggest.height / 2);

        // final centerMarkerWidget =
        //     _buildMarkerWidget(centerLocation, Colors.purple);

        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onDoubleTap: _onDoubleTap,
          onScaleStart: _onScaleStart,
          onScaleUpdate: _onScaleUpdate,
          child: Listener(
            behavior: HitTestBehavior.opaque,
            onPointerSignal: (event) {
              if (event is PointerScrollEvent) {
                final delta = event.scrollDelta;

                controller.zoom -= delta.dy / 1000.0;
                setState(() {});
              }
            },
            child: Stack(
              children: [
                Map(
                  controller: controller,
                  builder: (context, x, y, z) {
                    //Legal notice: This url is only used for demo and educational purposes. You need a license key for production use.
                    //Google Maps
                    final url =
                        'https://www.google.com/maps/vt/pb=!1m4!1m3!1i$z!2i$x!3i$y!2m3!1e0!2sm!3i420120488!3m7!2sen!5e1105!12m4!1e68!2m2!1sset!2sRoadmap!4e0!5m1!1e0!23i4111425';
                    return CachedNetworkImage(
                      imageUrl: url,
                      fit: BoxFit.cover,
                    );
                  },
                ),
                // homeMarkerWidget,
                // ...markerWidgets,
                // centerMarkerWidget,
              ],
            ),
          ),
        );
      },
    );
  }
}
