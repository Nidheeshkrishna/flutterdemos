import 'dart:async';

import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:flutter/material.dart';

class NetworkStatusProvider extends StatefulWidget {
  final Widget child;

  const NetworkStatusProvider({Key? key, required this.child})
      : super(key: key);

  @override
  State<NetworkStatusProvider> createState() => _NetworkStatusProviderState();
}

class _NetworkStatusProviderState extends State<NetworkStatusProvider> {
  late StreamSubscription<DataConnectionStatus> _subscription;
  bool isConnected = true;
  @override
  void initState() {
    super.initState();
    _subscription = DataConnectionChecker().onStatusChange.listen((status) {
      switch (status) {
        case DataConnectionStatus.connected:
          setState(() {
            isConnected = true;
          });

          break;
        case DataConnectionStatus.disconnected:
          setState(() {
            isConnected = false;
          });

          break;
      }
    });
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NetworkStatus(
      isConnected: isConnected,
      child: widget.child,
    );
  }
}

class NetworkStatus extends InheritedWidget {
  final bool isConnected;

  const NetworkStatus(
      {super.key, required this.isConnected, required Widget child})
      : super(child: child);

  static NetworkStatus of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<NetworkStatus>()!;
  }

  @override
  bool updateShouldNotify(NetworkStatus oldWidget) {
    return oldWidget.isConnected != isConnected;
  }
}
