import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentcar/domain/repo/fav_car_repo.dart';
import 'package:rentcar/presentation/bloc/car_state.dart';

class CarCubit extends Cubit<CarState> {
  // final GetCars getCars;
  final FavCarRepo favCarRepo;
  CarCubit({required this.favCarRepo}) : super(CarsLoading());

  Future<void> loadCars() async {
    emit(CarsLoading());
    try {
      final cars = await favCarRepo.getCars();

      // final cars = await favCarRepo.call();
      emit(CarsLoaded(cars));
    } catch (e) {
      emit(CarsError(e.toString()));
    }
  }
}
