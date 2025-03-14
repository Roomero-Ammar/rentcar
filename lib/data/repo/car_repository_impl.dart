import 'package:rentcar/data/datasources/firebase_car_data_source.dart';
import 'package:rentcar/data/models/car.dart';
import 'package:rentcar/domain/repo/car_repository.dart';

class CarRepositoryImpl implements CarRepository {
  final FirebaseCarDataSource dataSource;

  CarRepositoryImpl(this.dataSource);

  @override
  Future<List<Car>> fetchCars() {
    return dataSource.getCars();
  }
}