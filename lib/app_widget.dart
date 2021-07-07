import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:payflow/modules/home/home_page.dart';
import 'package:payflow/modules/insert_boleto/insert_boleto_page.dart';
import 'package:payflow/shared/models/user_model.dart';
import 'package:payflow/shared/themes/themes.dart';
import 'modules/barcode_scanner/barcode_scanner_page.dart';
import 'modules/login/login_page.dart';
import 'modules/splash/splash_page.dart';
import 'shared/themes/app_colors.dart';

class AppWidget extends StatefulWidget {
  AppWidget() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: AppColors.background));
  }

  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> with WidgetsBindingObserver {
  var theme = Themes.lightTheme;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
    changeTheme();
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangePlatformBrightness() {
    changeTheme();
  }

  changeTheme() {
    var brightness = WidgetsBinding.instance!.window.platformBrightness;
    brightness == Brightness.dark
        ? theme = Themes.darkTheme
        : theme = Themes.lightTheme;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pay Flow',
      debugShowCheckedModeBanner: false,
      theme: theme,
      initialRoute: "/splash",
      routes: {
              "/splash": (context) => SplashPage(),
              "/home": (context) => HomePage(
              user: ModalRoute.of(context)!.settings.arguments as UserModel,
            ),
            "/login": (context) => LoginPage(),
            "/barcode_scanner": (context) => BarcodeScannerPage(),
            "/insert_boleto": (context) => InsertBoletoPage(
            barcode: ModalRoute.of(context) != null
                ? ModalRoute.of(context)!.settings.arguments.toString()
                : null)
      },
    );
  }
}
