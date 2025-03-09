import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentcar/domain/usercases/get_cars.dart';
import 'package:rentcar/presentation/bloc/car_state.dart';

class CarCubit extends Cubit<CarState> {
  final GetCars getCars;

  CarCubit({required this.getCars}) : super(CarsLoading());

  Future<void> loadCars() async {
    emit(CarsLoading());
    try {
      final cars = await getCars.call();
      emit(CarsLoaded(cars));
    } catch (e) {
      emit(CarsError(e.toString()));
    }
  }
}