import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lord_krishna_builders_app/app_configs/app_assets/image_assets.dart';
import 'package:lord_krishna_builders_app/app_configs/app_colors/app_colors.dart';
import 'package:lord_krishna_builders_app/app_configs/size_config/responsive_config.dart';
import 'package:lord_krishna_builders_app/app_utils/app_functions/app_functions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime? pickedDate;
  String? datepicked;
  @override
  void initState() {
    setState(() {
      DateTime now = DateTime.now();
      datepicked = now.toString().convertToHumanReadableDate();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final responsiveData = ResponsiveData.of(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: responsiveData.screenHeight * .20,
        // Set this height
        flexibleSpace: Container(
          margin: EdgeInsets.only(
            top: responsiveData.screenHeight * .010,
            left: responsiveData.screenWidth * .055,
          ),
          child: SafeArea(
            child: SizedBox(
              width: responsiveData.screenWidth,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: responsiveData.screenWidth,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 2,
                          child: SvgPicture.asset(
                            "assets/images/logo.svg",
                            width: responsiveData.screenWidth * .30,
                            fit: BoxFit.contain,
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child: InkWell(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Flexible(
                                  flex: 1,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 20,
                                    child: IconButton(
                                      padding: EdgeInsets.zero,
                                      icon: const Icon(Icons.calendar_month),
                                      color: AppColors.kButtonColor,
                                      onPressed: () async {
                                        pickedDate = await showDatePicker(
                                            context: context,
                                            initialDate: DateTime
                                                .now(), //get today's date
                                            firstDate: DateTime(
                                                2000), //DateTime.now() - not to allow to choose before today.
                                            lastDate: DateTime(2101));
                                        setState(() {
                                          datepicked = pickedDate
                                              .toString()
                                              .convertToHumanReadableDate();
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                Flexible(
                                    flex: 1,
                                    child: InkWell(
                                      onTap: () {
                                        if (kDebugMode) {
                                          print(pickedDate.toString());
                                        }
                                      },
                                      child: Text(
                                        datepicked ?? "",
                                        style: const TextStyle(
                                            color: AppColors.kIconColor,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ))
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      body: const Column(
        children: [],
      ),
    );
  }
}
