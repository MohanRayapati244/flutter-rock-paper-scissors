import 'package:get/get.dart';
import '../modules/auth/bindings/auth_binding.dart';
import '../modules/auth/views/login_view.dart';
import '../modules/color_blast/views/color_blast_view.dart';
import '../modules/spec/views/spec_view.dart';
import 'app_routes.dart';

class AppPages {
  AppPages._();

  static final List<GetPage> pages = <GetPage>[
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginView(),
      binding: AuthBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.colorBlast,
      page: () => const ColorBlastView(),
      transition: Transition.cupertinoDialog,
    ),
    GetPage(
      name: AppRoutes.spec,
      page: () => const SpecView(),
      transition: Transition.rightToLeftWithFade,
    ),
  ];
}
