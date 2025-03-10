import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentcar/data/models/car.dart';
import 'package:rentcar/presentation/bloc/car_bloc.dart';
import 'package:rentcar/presentation/bloc/car_state.dart';
import 'package:rentcar/presentation/cubit/car_cubit.dart';
import 'package:rentcar/presentation/widgets/car_card.dart';

class CarListScreen extends StatelessWidget {
  const CarListScreen({super.key});
  // final List<Car> cars = [
  //   Car(
  //     image: 'assets/white_car.png',
  //       model: 'Fortuner GR1',
  //       distance: 850,
  //       fuelCapacity: 50,
  //       pricePerHour: 30),
  //   Car(
  //     image: 'assets/car2.png',
  //       model: 'Fortuner GR2',
  //       distance: 900,
  //       fuelCapacity: 60,
  //       pricePerHour: 40),
  //   Car(
  //     image: 'assets/car3.png',
  //       model: 'Fortuner GR3',
  //       distance: 700,
  //       fuelCapacity: 70,
  //       pricePerHour: 50),
  //   Car(
  //     image: 'assets/car4.png',
  //       model: 'Fortuner GR4',
  //       distance: 400,
  //       fuelCapacity: 80,
  //       pricePerHour: 60),
  // ];

  // @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Choose Your Car')),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      // using cubit
      body: BlocBuilder<CarCubit, CarState>(
      // using bloc
      // body: BlocBuilder<CarBloc, CarState>(
        builder: (context, state) {
          if (state is CarsLoading) {
            return Center(child: CircularProgressIndicator());
          }
          else if (state is CarsLoaded) {
                      return ListView.builder(
        itemCount: state.cars.length,
        itemBuilder: (context, index) => CarCard(car: state.cars[index]),
      );

          }
          else if (state is CarsError) {
            return Center(
              child: Center(child: Text('error : ${state.message}'),),
            );
          }
          return Container();
        },
      )
    );
  }
}
