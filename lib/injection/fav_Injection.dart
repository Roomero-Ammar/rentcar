import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:rentcar/data/datasources/firebase_car_data_source.dart';
import 'package:rentcar/domain/repo/fav_car_repo.dart';
import 'package:rentcar/domain/usercases/get_cars.dart';

import '../presentation/cubit/car_cubit.dart';

GetIt getIt = GetIt.instance;

void favInitInjection() {
  try {
    getIt.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);
    
    // تسجيل FirebaseCarDataSource
    getIt.registerLazySingleton<FirebaseCarDataSource>(
      () => FirebaseCarDataSource(firestore: getIt<FirebaseFirestore>())
    );

    // تسجيل GetCars مباشرة باستخدام FirebaseCarDataSource
  getIt.registerLazySingleton<FavCarRepo>(
      () => FavCarRepo(getIt<FirebaseCarDataSource>())
    );
    // تسجيل CarBloc باستخدام GetCars
    getIt.registerFactory(() => CarCubit(favCarRepo: getIt<FavCarRepo>()));

// getIt.registerFactory(() => CarCubit(getCars: getIt<GetCars>()));
  } catch (e) {
    rethrow;
  }
}