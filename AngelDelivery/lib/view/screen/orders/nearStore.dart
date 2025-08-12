// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api

//Nearest neighbor algorithm
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class NearbyStores extends StatefulWidget {
  @override
  _NearbyStoresState createState() => _NearbyStoresState();
}

class _NearbyStoresState extends State<NearbyStores> {
  GoogleMapController? mapController;
  List<Marker> markers = [];
  Marker? userMarker;
  final double maxDistance = 30.0;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    LatLng userLocation = LatLng(position.latitude, position.longitude);
    List<Store> nearbyStores = _getNearbyStores(userLocation);

    setState(() {
      markers.clear();
      userMarker = Marker(
        markerId: const MarkerId('user'),
        position: userLocation,
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueBlue,
        ),
        infoWindow: const InfoWindow(
          title: 'موقع المستخدم',
        ),
      );
//----------------------------------------------------------//
      for (Store store in nearbyStores) {
        markers.add(
          Marker(
            markerId: MarkerId(store.name),
            position: LatLng(store.latitude, store.longitude),
            icon: BitmapDescriptor.defaultMarkerWithHue(
              store.isOpen
                  ? BitmapDescriptor.hueYellow
                  : BitmapDescriptor.hueRed,
            ),
            infoWindow: InfoWindow(
              title: store.name,
              snippet: store.isOpen ? 'مفتوح' : 'مغلق',
            ),
          ),
        );
      }
    });

    mapController?.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: userLocation,
          zoom: 12.0,
        ),
      ),
    );
  }

  List<Store> _getNearbyStores(LatLng userLocation) {
    List<Store> nearbyStores = [
      Store('متجر 1', 13.5289561, 44.0189108, true),
      Store('متجر 2', 13.586542, 44.0168105, false),
      Store('متجر 3', 13.5432105, 44.0587654, true),
    ];

    return nearbyStores;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Near Store '),
      ),
      body: GoogleMap(
        markers:
            // ignore: prefer_collection_literals
            Set<Marker>.from([...markers, if (userMarker != null) userMarker!]),
        onMapCreated: (GoogleMapController controller) {
          mapController = controller;
        },
        initialCameraPosition: const CameraPosition(
          target: LatLng(0, 0),
          zoom: 1.0,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getCurrentLocation,
        child: const Icon(Icons.location_searching),
      ),
    );
  }
}

class Store {
  final String name;
  final double latitude;
  final double longitude;
  final bool isOpen;

  Store(this.name, this.latitude, this.longitude, this.isOpen);
}
