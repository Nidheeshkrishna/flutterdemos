import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lord_krishna_builders_app/app_configs/app_colors/app_colors.dart';
import 'package:lord_krishna_builders_app/app_configs/app_constants/app_routes_config/app_navigator.dart';
import 'package:lord_krishna_builders_app/app_configs/app_constants/app_routes_config/app_route_names.dart';
import 'package:lord_krishna_builders_app/app_configs/size_config/responsive_config.dart';
import 'package:lord_krishna_builders_app/app_modules/login_module/views/widgets/login_bg_widget.dart';
import 'package:lord_krishna_builders_app/app_utils/app_text_styles/app_text_style.dart';
import 'package:lord_krishna_builders_app/app_widgets/app_custom_widgets/custom_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passWordController = TextEditingController();

  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    final responsiveData = ResponsiveData.of(context);
    return SafeArea(
        bottom: true,
        child: Scaffold(
            body: BgSetter(
                child: SizedBox(
          width: responsiveData.screenWidth,
          height: responsiveData.screenHeight * .80,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/images/logo.svg",
                width: responsiveData.screenWidth * .80,
                fit: BoxFit.contain,
              ),
              SizedBox(
                height: responsiveData.screenHeight * .085,
              ),
              FormInputField(
                  label: 'User Name',
                  controller: usernameController,
                  enabled: true,
                  iconText: const Icon(Icons.person)),
              SizedBox(
                height: responsiveData.screenHeight * .018,
              ),
              TextFormField(
                enableSuggestions: true,
                obscuringCharacter: "*",
                obscureText: !_passwordVisible,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                textAlignVertical: TextAlignVertical.bottom,
                keyboardType: TextInputType.text,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(6),
                ],
                validator: (value) {
                  return null;

                  // if (value!.isEmpty) {
                  //   return 'Please Enter Mobile Number';
                  // } else if (value.length != 10) {
                  //   return 'Please Enter Valid Mobile Number';
                  // } else {
                  //   return null;
                  // }
                },
                // controller: phoneController,
                decoration: InputDecoration(
                  filled: true,
                  enabled: true,
                  fillColor: AppColors.kTextFieldFillColor,
                  isDense: true,
                  suffixIcon: IconButton(
                    icon: Icon(
                      // Based on passwordVisible state choose the icon
                      _passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: AppColors.ktitleColor,
                    ),
                    onPressed: () {
                      // Update the state i.e. toogle the state of passwordVisible variable
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: AppColors.kWhite,
                        width: 2,
                        style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: AppColors.kWhite, style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(8.0),
                  ),

                  // No underline
                  // Sample prefix icon
                  hintText: 'Pass Word',

                  border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: AppColors.kWhite, width: 0.5),
                      borderRadius: BorderRadius.circular(8)),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(color: Colors.red, width: 1.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide:
                        const BorderSide(color: AppColors.kWhite, width: 0.5),
                  ),
                ),
              ),
              SizedBox(
                height: responsiveData.screenHeight * .045,
              ),
              SizedBox(
                width: responsiveData.screenWidth,
                child: ElevatedButton(
                    onPressed: () {
                      AppNavigator.pushNamed(AppRoutes.companySelectionPage);
                      //loadingOverlay.show(context);
                    },
                    child: Text(
                      "LogIn",
                      style: AppTextStyle.commonTextStyle(
                          color: AppColors.kWhite,
                          fontSize: 10 * responsiveData.textFactor),
                    )),
              ),
            ],
          ),
        ))));
  }
}
