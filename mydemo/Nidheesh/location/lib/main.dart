import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_geolocation/flutter_background_geolocation.dart'
    as bg;

void main() {
  runApp(const MyApp());
  bg.BackgroundGeolocation.registerHeadlessTask(headlessTask);
}

void headlessTask(bg.HeadlessEvent event) {
  if (kDebugMode) {
    print(event.toString());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isTracking = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Background Location Tracking'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Location Tracking is: ${isTracking ? "On" : "Off"}',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (isTracking) {
                  // Stop location tracking.
                  bg.BackgroundGeolocation.stop();
                } else {
                  // Start location tracking.
                  startLocationTracking();
                }
              },
              child: Text(isTracking ? 'Stop Tracking' : 'Start Tracking'),
            ),
          ],
        ),
      ),
    );
  }

  void startLocationTracking() async {
    await bg.BackgroundGeolocation.ready(bg.Config(
      desiredAccuracy: bg.Config.DESIRED_ACCURACY_HIGH,
      distanceFilter: 10,
      stopOnTerminate: false,
      startOnBoot: true,
      enableHeadless: true,
      debug: true,
    ));

    bg.BackgroundGeolocation.start();

    setState(() {
      isTracking = true;
    });
  }

  @override
  void dispose() {
    bg.BackgroundGeolocation.stop(); // Stop tracking when the app is closed.
    super.dispose();
  }
}
