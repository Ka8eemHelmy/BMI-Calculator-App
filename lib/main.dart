import 'package:bmi/view_model/bloc/bmi_cubit/bmi_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'view/screens/home/home_screen.dart';
import 'view/screens/splash/splash_screen.dart';
import 'view_model/bloc/observer.dart';
import 'view_model/bloc/todo/todo_cubit.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => BMICubit(),),
        BlocProvider(create: (context) => TodoCubit(),),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
