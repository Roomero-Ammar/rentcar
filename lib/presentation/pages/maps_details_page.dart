import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:rentcar/data/models/car.dart';
import 'package:rentcar/presentation/widgets/car_details_card.dart'; // تأكد من إضافة المكتبة

class MapsDetailsPage extends StatelessWidget {
  final Car car;
  const MapsDetailsPage({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back , color: Colors.white,),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              initialCenter: LatLng(51.5074, -0.1278), // ��ضافة موقع ��غرافي محلك
              initialZoom: 15, // تغيير مستوى التكامل
              minZoom: 12, // حد أدنى مستوى التكامل
              maxZoom: 18, // حد أعلى مستوى التكامل
            ),
            children: [
              TileLayer(
                urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: ['a', 'b', 'c'],
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: CarDetailsCard(car: car)
          )
        
        ],
      ),
    );
  }
}