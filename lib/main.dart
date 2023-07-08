import 'package:derapidos/user_prefs/user_prefs.dart';
import 'package:derapidos/theme.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'View/Splash/splash_screen.dart';
import 'View/real_estate/r_s_bottom_nev_bar/r_s_bottom_nev_bar_screen.dart';
import 'controllers/update_location_controller.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await UserPreferences.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  UpdateLocationController updateLocationController = UpdateLocationController();

  @override
  void initState() {
    // TODO: implement initState
    getLocation();
    super.initState();
  }

  getLocation() async {
    await updateLocationController.getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Derapidos',
          theme: ThemeData(
            // fontFamily: "DMSans",
            primarySwatch: AppTheme.appColor,
          ),
          home:
              // RSBottomNevBar()
              const SplashScreen(),
        );
      },
    );
  }
}
