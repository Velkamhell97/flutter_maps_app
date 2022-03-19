import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' show AndroidGoogleMapsFlutter;
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/blocs/blocs.dart';
import 'src/screens/screens.dart';
import 'src/services/services.dart';

void main() {
  if (defaultTargetPlatform == TargetPlatform.android) {
    AndroidGoogleMapsFlutter.useAndroidViewSurface = true;
  }

  // timeDilation = 2.0;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => ApiRepository(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => PermissionsBloc()),
          BlocProvider(create: (_) => LocationBloc()),
          BlocProvider(create: (context) => MapBloc(locationBloc: BlocProvider.of<LocationBloc>(context))),
          BlocProvider(create: (context) => SearchBloc()),
          BlocProvider(create: (context) => Search2Bloc(context.read<ApiRepository>())),
          BlocProvider(create: (context) => FetchBloc(context.read<ApiRepository>()))
        ],
        child: MaterialApp(
          scaffoldMessengerKey: NotificationsService.messengerKey,
          navigatorKey: NotificationsService.navigatorKey,
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            fontFamily: 'ProximaNova',
            
            floatingActionButtonTheme: const FloatingActionButtonThemeData(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black
            ),
    
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
                shape: const StadiumBorder()
              )
            )
          ),
          home: const LoadingScreen(),
          // home: const TestMarkerScreen(),
        ),
      ),
    );
  }
}