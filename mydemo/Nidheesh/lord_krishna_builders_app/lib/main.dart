import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lord_krishna_builders_app/app_configs/app_colors/app_colors.dart';
import 'package:lord_krishna_builders_app/app_configs/app_constants/app_strings.dart';
import 'package:lord_krishna_builders_app/app_configs/app_themes/app_custom_theme.dart';
import 'package:lord_krishna_builders_app/app_configs/size_config/app_size_config.dart';
import 'package:lord_krishna_builders_app/app_configs/size_config/responsive_config.dart';
import 'package:lord_krishna_builders_app/app_configs/app_constants/app_routes_config/app_navigator.dart';
import 'package:lord_krishna_builders_app/app_configs/app_constants/app_routes_config/app_routes.dart';
import 'package:lord_krishna_builders_app/app_widgets/loading_overlay_widget.dart';

import 'app_configs/app_constants/app_routes_config/app_route_names.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.black, // navigation bar color
    statusBarColor: AppColors.kAppBartitleColor, // status bar color
    statusBarIconBrightness: Brightness.light, // status bar icon color
    systemNavigationBarIconBrightness:
        Brightness.light, // color of navigation controls
  ));
  // try {
  //   HttpOverrides.global = MyHttpOverrides();
  // } catch (_) {}
  // runApp(DevicePreview(
  //     enabled: !kReleaseMode,
  //     builder: (context) {
  //       return const MyApp();
  //     }));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      return LayoutBuilder(builder: (context, constraints) {
        SizeConfig().init(constraints, orientation);

        return ResponsiveData(
          screenWidth: constraints.maxWidth,
          screenHeight: constraints.maxHeight,
          orientation: orientation,
          textFactor: (MediaQuery.of(context).size.width / 100).clamp(0.5, 2.0),
          context: context,
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            // locale: DevicePreview.locale(context),
            // builder: DevicePreview.appBuilder,
            navigatorKey: AppNavigator.navigatorKey,
            onGenerateRoute: RouteEngine.generateRoute,
            scaffoldMessengerKey: scaffoldMsgKey,
            initialRoute: AppRoutes.loginPage,
            title: AppStrings.appName,
            themeMode: ThemeMode.system,
            theme: AppTheme().getAppThemeLight(),
            darkTheme: AppTheme().getAppThemeDark(),
            //home: const MyHomePage(title: 'Flutter Demo Home Page'),
          ),
        );
      });
    });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // var fontsize = MediaQuery.of(context).copyWith(textScaleFactor: 1.0);
    // bool isConnected = NetworkStatus.of(context).isConnected;

    LoadingOverlay loadingOverlay = LoadingOverlay();

    final responsiveData = ResponsiveData.of(context);
    return SafeArea(
      maintainBottomViewPadding: true,
      top: true,
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            //title: Text(widget.title),
            automaticallyImplyLeading: true,
          ),
          body: Center(
            child: SizedBox(
              width: responsiveData.screenWidth - 15,
              height: responsiveData.screenHeight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      'You have pushed the button this many times:',
                      style:
                          TextStyle(fontSize: 10 * responsiveData.textFactor),
                    ),
                  ),
                  const TextField(
                    decoration: InputDecoration(
                        icon: Icon(Icons.person),
                        hintText: 'What do people call you?',
                        labelText: 'Name *',
                        filled: true,
                        fillColor: Colors.amber),
                  ),
                  Container(
                    color: Colors.blue,
                    width: responsiveData.screenWidth,
                    height: responsiveData.screenHeight * .30,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        AppNavigator.pushNamed(AppRoutes.loginPage);
                        //loadingOverlay.show(context);
                      },
                      child: const Text("Click")),

                  // ClipRRect(
                  //   //to clip overflown positioned containers.
                  //   borderRadius: BorderRadius.circular(30),
                  //   child: Container(
                  //     color: Colors.redAccent.withOpacity(0.5),
                  //     width: responsiveData.screenWidth,
                  //     height: responsiveData.screenHeight * .30,
                  //     child: Stack(children: <Widget>[
                  //       //Stack helps to overlap widgets
                  //       Positioned(
                  //           //positioned helps to position widget wherever we want.
                  //           top: -20,
                  //           left: -50, //position of the widget
                  //           child: Container(
                  //               height: 250,
                  //               width: 250,
                  //               decoration: BoxDecoration(
                  //                   shape: BoxShape.circle,
                  //                   color: Colors.orange.withOpacity(
                  //                       0.5) //background color with opacity
                  //                   ))),
                  //       Positioned(
                  //           left: -80,
                  //           top: -50,
                  //           child: Container(
                  //               height: 230,
                  //               width: 230,
                  //               decoration: BoxDecoration(
                  //                   shape: BoxShape.circle,
                  //                   color:
                  //                       Colors.lightGreen.withOpacity(0.5)))),
                  //       Positioned(
                  //           left: -80,
                  //           top: -50,
                  //           child: Container(
                  //               height: 220,
                  //               width: 220,
                  //               decoration: BoxDecoration(
                  //                   shape: BoxShape.circle,
                  //                   color:
                  //                       Colors.blueAccent.withOpacity(0.5)))),

                  //       Positioned(
                  //           left: -80,
                  //           top: -50,
                  //           child: Container(
                  //               height: 210,
                  //               width: 210,
                  //               decoration: BoxDecoration(
                  //                   shape: BoxShape.circle,
                  //                   color:
                  //                       Colors.greenAccent.withOpacity(0.5)))),

                  //       Positioned(
                  //           left: -80,
                  //           top: -50,
                  //           child: Container(
                  //               height: 200,
                  //               width: 200,
                  //               decoration: BoxDecoration(
                  //                   shape: BoxShape.circle,
                  //                   color:
                  //                       Colors.yellowAccent.withOpacity(0.5)))),

                  //       Positioned(
                  //           left: -80,
                  //           top: -50,
                  //           child: Container(
                  //               height: 180,
                  //               width: 180,
                  //               decoration: BoxDecoration(
                  //                   shape: BoxShape.circle,
                  //                   color: Colors.redAccent.withOpacity(0.5)))),
                  //     ]),
                  //   ),
                  // )
                ],
              ),
            ),
          )

          // This trailing comma makes auto-formatting nicer for build methods.
          ),
    );
  }
}
