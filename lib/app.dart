import 'package:alibi_shop/feature/home/bloc/animation/animation_cubit.dart';
import 'package:alibi_shop/service/navigation/go_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final router = AppGoRouter();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          BlocProvider(create: (context) => AnimationCubit()),
        ],
        child: ScreenUtilInit(
          minTextAdapt: true,
          splitScreenMode: true,
          designSize: const Size(430, 932),
          builder: (context, child) {
            return MaterialApp.router(
              routerConfig: router.router,
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                useMaterial3: false,
                // ...
              ),
            );
          },
        ));
  }
}
