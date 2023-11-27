import 'package:flutter/material.dart';
import 'package:lord_krishna_builders_app/app_configs/app_colors/app_colors.dart';
import 'package:lord_krishna_builders_app/app_configs/app_constants/app_routes_config/app_navigator.dart';
import 'package:lord_krishna_builders_app/app_configs/app_constants/app_routes_config/app_route_names.dart';
import 'package:lord_krishna_builders_app/app_configs/size_config/responsive_config.dart';
import 'package:lord_krishna_builders_app/app_utils/app_text_styles/app_text_style.dart';

typedef SelectedCompany = String Function(String);

class RadioListTileExample extends StatefulWidget {
  final Function(String) selectedCompany;
  const RadioListTileExample({super.key, required this.selectedCompany});

  @override
  State<RadioListTileExample> createState() => _RadioListTileExampleState();
}

class _RadioListTileExampleState extends State<RadioListTileExample> {
  int? selectedValue;

  @override
  Widget build(BuildContext context) {
    final responsiveData = ResponsiveData.of(context);
    return SizedBox(
      width: responsiveData.screenWidth,
      height: responsiveData.screenHeight * .60,
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Selected Company",
              style: TextStyle(
                  color: AppColors.kIconColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 9 * responsiveData.textFactor),
            ),
            SizedBox(height: responsiveData.screenHeight * .040),
            Card(
              color: AppColors.kCardBgColor,
              child: SizedBox(
                width: responsiveData.screenWidth,
                child: Column(
                  children: [
                    ListView.builder(
                      padding: EdgeInsets.only(
                          bottom: responsiveData.screenWidth * .025,
                          top: responsiveData.screenWidth * .075),
                      shrinkWrap: true,
                      itemCount: radioOptions.length,
                      itemBuilder: (context, index) {
                        final option = radioOptions[index];
                        return SizedBox(
                          width: responsiveData.screenWidth,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ChoiceChip(
                                      disabledColor: AppColors.kWhite,
                                      backgroundColor: AppColors.kWhite,
                                      elevation: 3,
                                      padding: const EdgeInsets.all(10),
                                      avatar: const Icon(
                                        Icons.circle,
                                        size: 20,
                                      ),
                                      side: BorderSide.none,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12.0)),
                                      label: SizedBox(
                                        width: responsiveData.screenWidth * .60,
                                        child: Text(
                                          option.label,
                                          style: TextStyle(
                                              fontSize:
                                                  8 * responsiveData.textFactor,
                                              fontWeight: FontWeight.w500,
                                              color: selectedValue == index
                                                  ? AppColors.kWhite
                                                  : AppColors
                                                      .kAppBartitleColor),
                                        ),
                                      ),
                                      selectedColor: AppColors.kIconColor,
                                      selected: selectedValue == index,
                                      onSelected: (bool selected) {
                                        widget.selectedCompany(
                                            option.value.toString());
                                        setState(() {
                                          selectedValue =
                                              selected ? index : null;
                                        });
                                      }),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    Container(
                      width: responsiveData.screenWidth * .80,
                      padding: EdgeInsets.only(
                          bottom: responsiveData.screenHeight * .025,
                          left: responsiveData.screenWidth * .025,
                          right: responsiveData.screenWidth * .025),
                      child: ElevatedButton(
                          onPressed: () {
                            AppNavigator.pushNamed(AppRoutes.homePage);
                            //loadingOverlay.show(context);
                          },
                          child: Text(
                            "Done",
                            style: AppTextStyle.commonTextStyle(
                                color: AppColors.kWhite,
                                fontSize: 10 * responsiveData.textFactor),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RadioOption {
  final int value;
  final String label;

  RadioOption({required this.value, required this.label});
}

final List<RadioOption> radioOptions = [
  RadioOption(value: 1, label: 'Lord Krishna Construction'),
  RadioOption(value: 2, label: 'Lord Krishna Interior'),
  RadioOption(value: 3, label: 'Lord Krishna Material'),
];
