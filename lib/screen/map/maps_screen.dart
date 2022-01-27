import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kost/core/utils/height_and_width.dart';

class MapsScreen extends StatefulWidget {
  const MapsScreen({Key? key}) : super(key: key);

  @override
  State<MapsScreen> createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen>
    with AutomaticKeepAliveClientMixin {
  late GoogleMapController googleMapController;

  CameraPosition klake = const CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  bool isLoaded = false;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            isLoaded
                ? GestureDetector(
                    onTap: () {
                      googleMapController.animateCamera(
                        CameraUpdate.newLatLngZoom(
                            const LatLng(-000002, 000000), 4.0),
                      );
                    },
                    child: Container(
                      height: heightMediaQuery(context) * 0.1,
                      decoration: const BoxDecoration(
                        color: Colors.yellow,
                      ),
                    ),
                  )
                : const SizedBox(),
            Expanded(
              child: GoogleMap(
                zoomControlsEnabled: false,
                initialCameraPosition: klake,
                onMapCreated: (mapController) async {
                  googleMapController = mapController;

                  await Future.delayed(const Duration(seconds: 3));

                  setState(() {
                    isLoaded = !isLoaded;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
