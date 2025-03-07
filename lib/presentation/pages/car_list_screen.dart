import 'package:flutter/material.dart';
import 'package:rentcar/data/models/car.dart';
import 'package:rentcar/presentation/widgets/car_card.dart';

class CarListScreen extends StatelessWidget {
  CarListScreen({super.key});
  final List<Car> cars = [
    Car(
        model: 'Fortuner GR1',
        distance: 850,
        fuelCapacity: 50,
        pricePerHour: 30),
    Car(
        model: 'Fortuner GR2',
        distance: 900,
        fuelCapacity: 60,
        pricePerHour: 40),
    Car(
        model: 'Fortuner GR3',
        distance: 700,
        fuelCapacity: 70,
        pricePerHour: 50),
    Car(
        model: 'Fortuner GR4',
        distance: 400,
        fuelCapacity: 80,
        pricePerHour: 60),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Choose Your Car')),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: cars.length,
        itemBuilder: (context, index) => CarCard(car: cars[index]),
      ),
    );
  }
}
