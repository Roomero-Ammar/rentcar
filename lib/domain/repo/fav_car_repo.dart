// TODO: If we want to get rid of the final CarRepository carsRepository; and CarRepositoryImpl File
// and use the Repository , impl content here in the same file
// I prefer to change the class name from GetCars to CarRepository

// we can write this code



import 'package:rentcar/data/datasources/firebase_car_data_source.dart';
import 'package:rentcar/data/models/car.dart';

class FavCarRepo {
  final FirebaseCarDataSource dataSource;

  FavCarRepo(this.dataSource);

  Future<List<Car>> getCars() async {
    Future<List<Car>> fetchCars() async {
      // استخدم dataSource مباشرة لجلب السيارات
      return await dataSource.getCars();
    }

    return await fetchCars();
  }
  
   // You can add other methods related to cars here
   // You can also change the position of the fetchCars() method to be here 
  
}