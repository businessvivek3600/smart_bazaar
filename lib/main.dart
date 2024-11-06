import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:smart_bazar/bindings/genral_bindings.dart';
import 'package:smart_bazar/firebase_options.dart';
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
      debugShowCheckedModeBanner: false,
      home: const Scaffold(backgroundColor: TColors.primary,body: Center(
        child: CircularProgressIndicator(color: Colors.white,),
      ),),
    );
  }
}
//For the system Java wrappers to find this JDK, symlink it with
//   sudo ln -sfn /opt/homebrew/opt/openjdk@17/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-17.jdk
//
// openjdk@17 is keg-only, which means it was not symlinked into /opt/homebrew,
// because this is an alternate version of another formula.
//
// If you need to have openjdk@17 first in your PATH, run:
//   echo '

//
// For compilers to find openjdk@17 you may need to set:
//   export CPPFLAGS="-I/opt/homebrew/opt/openjdk@17/include"
// ==> node@20
// node@20 is keg-only, which means it was not symlinked into /opt/homebrew,
// because this is an alternate version of another formula.
//
// If you need to have node@20 first in your PATH, run:
//   echo 'export PATH="/opt/homebrew/opt/node@20/bin:$PATH"' >> ~/.zshrc
//
// For compilers to find node@20 you may need to set:
//   export LDFLAGS="-L/opt/homebrew/opt/node@20/lib"
//   export CPPFLAGS="-I/opt/homebrew/opt/node@20/include"