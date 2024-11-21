import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:smart_bazar/bindings/genral_bindings.dart';
import 'package:smart_bazar/firebase_options.dart';
import 'package:smart_bazar/routes/app_routes.dart';
import 'data/repositories/authentication/authentication_repository.dart';
import 'utils/constants/colors.dart';
import 'utils/theme/theme.dart';

/// --Entry point of Flutter App

Future<void> main() async {
  ///--Widgets Binding.
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

  ///GetX Local Storage
  await GetStorage.init();

  /// --Await  splash Until other item load
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  ///--Initialize Firebase & Authentication Repository
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((FirebaseApp value) => Get.put(AuthenticationRepository()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Smart Bazaar',
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      initialBinding: GeneralBindings(),
      getPages:AppRoutes.pages,
      debugShowCheckedModeBanner: false,
      home: const Scaffold(backgroundColor: TColors.primary,body: Center(
        child: CircularProgressIndicator(color: Colors.white,),
      ),),
    );
  }
}
