import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentcar/firebase_options.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rentcar/injection/fav_Injection.dart';
// import 'package:rentcar/injection/injection.dart';
import 'package:rentcar/presentation/bloc/car_bloc.dart';
import 'package:rentcar/presentation/bloc/car_event.dart';
import 'package:rentcar/presentation/cubit/car_cubit.dart';

import 'presentation/pages/onboarding_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
    favInitInjection(); // استخدم favInitInjection هنا

  // initInjection();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      child: BlocProvider(
        // useing cubit
        create: (_) => getIt<CarCubit>()..loadCars(), // استخدم loadCars بدلاً من add
// using bloc
//create: (_) => getIt<CarBloc>()..add(LoadCars()),     
   child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const OnboardingPage(),
        ),
      ),
    );
  }
}
