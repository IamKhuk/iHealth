import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ihealth/src/theme/app_theme.dart';
import 'map_style.dart';

class MapScreen extends StatefulWidget {

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? controller;
  BitmapDescriptor? _markerIcon;

  @override
  Widget build(BuildContext context) {
    _createMarkerImageFromAsset(context);
    return Scaffold(
      backgroundColor: AppTheme.bg,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        brightness: Brightness.light,
        leadingWidth: 76,
        leading: Row(
          children: [
            SizedBox(width: 36),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: AppTheme.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/icons/left.svg',
                    color: AppTheme.black,
                  ),
                ),
              ),
            ),
          ],
        ),
        centerTitle: true,
        title: Text(
          'Location',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            fontFamily: AppTheme.fontFamily,
            height: 1.5,
            color: AppTheme.black,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height*0.8,
            child: GoogleMap(
              myLocationButtonEnabled: false,
              mapType: MapType.normal,
              scrollGesturesEnabled: true,
              initialCameraPosition: CameraPosition(
                target: LatLng(41.313540829447746, 69.52841010693683),
                zoom: 16,
              ),
              zoomControlsEnabled: false,
              compassEnabled: false,
              myLocationEnabled: false,
              markers: <Marker>{_createMarker()},
              onMapCreated: _onMapCreated,
            ),
          ),
        ],
      ),
    );
  }

  Marker _createMarker() {
    if (_markerIcon != null) {
      return Marker(
        markerId: MarkerId("marker_1"),
        position: LatLng(41.313540829447746, 69.52841010693683),
        icon: _markerIcon!,
      );
    } else {
      return Marker(
        markerId: MarkerId("marker_1"),
        position: LatLng(41.313540829447746, 69.52841010693683),
      );
    }
  }

  Future<void> _createMarkerImageFromAsset(BuildContext context) async {
    if (_markerIcon == null) {
      final ImageConfiguration imageConfiguration =
      createLocalImageConfiguration(
        context,
        size: Size.square(64),
      );
      BitmapDescriptor.fromAssetImage(
        imageConfiguration,
        'assets/images/location_pin.png',
      ).then(_updateBitmap);
    }
  }

  void _updateBitmap(BitmapDescriptor bitmap) {
    setState(() {
      _markerIcon = bitmap;
    });
  }

  void _onMapCreated(GoogleMapController controllerParam) {
    setState(() {
      controller = controllerParam;
      controller!.setMapStyle(MapStyle().retro);
    });
  }
}
