import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';

class AppMethods {
  checkOffLine() async {
    if (await DataConnectionChecker().connectionStatus ==
        DataConnectionStatus.connected) {
      return true;
    } else {
      return false;
    }
  }

  String getGreeting() {
    final hour = DateTime.now().hour;

    if (hour < 12) {
      return 'Good Morning...!';
    } else if (hour < 17) {
      return 'Good Afternoon...!';
    } else {
      return 'Good Evening...!';
    }
  }

  convertToDateUserView(String? date) {
    DateTime givenStartDate = DateFormat("yyyy-MM-dd HH:mm:ss").parse(date!);
    String formattedDate = DateFormat('dd-MMM-yyyy').format(givenStartDate);
    return formattedDate;
  }

  Future<bool> requestPermission(Permission permission) async {
    final status = await permission.request();
    if (status.isGranted) {
      return true;
    } else {
      return false;
    }
  }

  // Future<bool> requestPermission(Permission permission) async {
  //   final status = await permission.request();
  //   if (status.isGranted) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }
}

String convertDateTimeDisplay(String date) {
  final DateFormat displayFormater = DateFormat('yyyy-MM-dd HH:mm:ss.SSS');
  final DateFormat serverFormater = DateFormat('dd-MM-yyyy');
  final DateTime displayDate = displayFormater.parse(date);
  final String formatted = serverFormater.format(displayDate);
  return formatted;
}

extension StringExtensions on String {
  String convertToDateUserView() {
    DateTime givenStartDate = DateFormat("yyyy-MM-dd HH:mm:ss").parse(this);
    String formattedDate = DateFormat('dd-MMM-yyyy').format(givenStartDate);
    return formattedDate;
  }
}


extension StringExtensionsDate on String {
  String convertToHumanReadableDate() {
    try {
      final givenDate = DateFormat("yyyy-MM-dd HH:mm:ss.S").parse(this);
      final formattedDate = DateFormat('dd-MMM-yyyy').format(givenDate);
      return formattedDate;
    } catch (e) {
      // Handle any parsing errors, such as an invalid date string
      return 'Invalid Date';
    }
  }
}