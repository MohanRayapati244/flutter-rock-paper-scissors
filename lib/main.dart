// import 'package:colorful_login_getx/best_UI_desgin/apple.dart';
// import 'package:colorful_login_getx/best_UI_desgin/mainsecrren.dart';
// import 'package:colorful_login_getx/best_UI_desgin/models/firstmodel.dart';
// import 'package:colorful_login_getx/classesnew/binding.dart';
// import 'package:colorful_login_getx/classesnew/update.dart';
// import 'package:colorful_login_getx/classesnew/update2.dart';
// import 'package:colorful_login_getx/cotrollersandBinding/controllerhome.dart';
// import 'package:colorful_login_getx/cotrollersandBinding/productBinding.dart';
// import 'package:colorful_login_getx/injectionstypes/controllers.dart';
// import 'package:colorful_login_getx/injectionstypes/screens/home.dart';
// import 'package:colorful_login_getx/injectionstypes/screens/pages/landing.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'app/routes/app_pages.dart';
// import 'app/routes/app_routes.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';


// /// Entry point. Initializes storage and controllers, then starts the app.
// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await GetStorage.init();

//   // register controllers (names preserved from original project)
//   Get.put(permanentController(), permanent: true);
//   Get.lazyPut(() => lazyController());
//   Get.create(() => teansientController());

//   runApp(const MyApp());
// }

// /// Root application widget
// class MyApp extends StatelessWidget {

//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       // title: 'Colorful Login',
//       title: 'Injections types',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF7C4DFF)),
//         useMaterial3: true,
//         fontFamily: 'Poppins',
//       ),
//     // home: HomeworkScreen()
//      home: HomeqScreen(),
//      initialBinding: homeBinding(),
//     //  initialBinding: ProductBiiinding(),
//     //   home:Controllerhome(),
//     //  home:productModel(name: "", image: image, backgroundColor: backgroundColor, price: price)
//       //home: ChronoLandingPage(),
//       //home: HomeScreen(),
//       // initialRoute: AppRoutes.login,
//       // getPages: AppPages.pages,
//     );
//   }
// }
import 'package:colorful_login_getx/best_UI_desgin/apple.dart';
import 'package:colorful_login_getx/best_UI_desgin/mainsecrren.dart';
import 'package:colorful_login_getx/best_UI_desgin/models/firstmodel.dart';
import 'package:colorful_login_getx/classesnew/binding.dart';
import 'package:colorful_login_getx/classesnew/update.dart';
import 'package:colorful_login_getx/classesnew/update2.dart';
import 'package:colorful_login_getx/cotrollersandBinding/controllerhome.dart';
import 'package:colorful_login_getx/cotrollersandBinding/productBinding.dart';
import 'package:colorful_login_getx/injectionstypes/controllers.dart';
import 'package:colorful_login_getx/injectionstypes/screens/home.dart';
import 'package:colorful_login_getx/injectionstypes/screens/pages/landing.dart';
import 'package:colorful_login_getx/rock,paper,scioors/rock.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app/routes/app_pages.dart';
import 'app/routes/app_routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

/// Entry point. Initializes Firebase, GetStorage, and controllers, then starts the app.
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// 🧠 Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  /// 💾 Initialize local storage (GetStorage)
  await GetStorage.init();

  /// ⚙️ Register GetX controllers (from your original setup)
  Get.put(permanentController(), permanent: true);
  Get.lazyPut(() => lazyController());
  Get.create(() => teansientController());

  /// 🚀 Launch app
  runApp(const MyApp());
}

/// Root application widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Injections types',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF7C4DFF)),
        useMaterial3: true,
        fontFamily: 'Poppins',
      ),

      /// 🏠 Your home screen and GetX binding setup
      // home: HomeqScreen(),
      // initialBinding: homeBinding(),
      home:GamePage(),

      /// Optional: if you ever want to use routes
      // initialRoute: AppRoutes.login,
      // getPages: AppPages.pages,
    );
  }
}

