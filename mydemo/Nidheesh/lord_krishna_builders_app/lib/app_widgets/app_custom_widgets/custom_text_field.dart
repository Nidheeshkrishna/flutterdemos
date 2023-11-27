import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lord_krishna_builders_app/app_configs/app_colors/app_colors.dart';
import 'package:lord_krishna_builders_app/app_configs/size_config/app_size_config.dart';
import 'package:lord_krishna_builders_app/app_configs/size_config/responsive_config.dart';
import 'package:lord_krishna_builders_app/app_utils/app_text_styles/app_text_style.dart';
import 'package:lord_krishna_builders_app/app_utils/app_validations/text_field_validation.dart';

class ClickableText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final Function onPressed;

  const ClickableText(
      {Key? key, required this.text, this.style, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed.call();
      },
      child: Text(
        text,
        style: style,
      ),
    );
  }
}

class FormInputField extends StatelessWidget {
  final String label;
  final int? maxLine;
  final bool? enabled;

  final TextInputType? inputType;
  final TextEditingController controller;
  final Icon? iconText;
  const FormInputField({
    Key? key,
    required this.label,
    this.inputType = TextInputType.text,
    required this.controller,
    required this.enabled,
    this.maxLine = 1,
    this.iconText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsiveData = ResponsiveData.of(context);
    return Padding(
      padding: const EdgeInsets.only(top: 3, bottom: 3),
      child: TextFormField(
        smartDashesType: SmartDashesType.enabled,
        enabled: enabled,
        //expands: true,
        maxLines: maxLine,

        validator: (value) {
          dynamic errorMessage = messageSetter(value!, label);
          return errorMessage == null ? null : "$errorMessage \u2757";
        },
        controller: controller,
        style: AppTextStyle.textFieldAddUser(
            color: Colors.black,
            fontSize: 13 * responsiveData.textFactor,
            fontWeight: FontWeight.w500),
        keyboardType: inputType,
        cursorColor: AppColors.primaryColor,
        //textCapitalization: TextCapitalization.characters,
        inputFormatters: label == "Mobile Number" ? null : null,

        autovalidateMode: AutovalidateMode.onUserInteraction,

        decoration: InputDecoration(
          suffixIcon: iconText,
          suffixIconColor: AppColors.kIconColor,
          //floatingLabelBehavior: FloatingLabelBehavior.always,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.primaryColor,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          hintText: label,
          labelStyle: AppTextStyle.textFieldAddUser(
              color: Colors.black, fontSize: SizeConfig.textMultiplier * 3.5),
          isDense: true,
          //isCollapsed: true,
          filled: true,
          // errorStyle:
          //     const TextStyle(fontSize: 10, backgroundColor: Colors.transparent),
          hintStyle: AppTextStyle.textFieldAddUser(
              color: AppColors.kTextFieldHintColor,
              fontWeight: FontWeight.w400,
              fontSize: SizeConfig.textMultiplier * 3.5),
          fillColor: AppColors.kTextFieldFillColor,
          border: OutlineInputBorder(
              borderSide: const BorderSide(
                  color: AppColors.kTextFieldFillColor, width: 0.5),
              //gapPadding: 0.0,
              borderRadius: BorderRadius.circular(8)),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(color: Colors.red, width: 1.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(
                color: AppColors.kTextFieldFillColor, width: 0.5),
          ),
        ),
      ),
    );
  }
}

class PassWordField extends StatefulWidget {
  final TextEditingController inputController;
  final String hintText;
  final Color primaryColor;
  final bool? obsureText;
  final TextInputType? inputType;
  const PassWordField(
      {Key? key,
      required this.inputController,
      required this.hintText,
      this.obsureText,
      this.inputType = TextInputType.text,
      this.primaryColor = Colors.white})
      : super(key: key);

  @override
  State<PassWordField> createState() => _PassWordFieldState();
}

class _PassWordFieldState extends State<PassWordField> {
  bool showPass = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.inputController,
      obscureText: showPass,
      enabled: true,
      validator: (value) {
        return messageSetter(value!, widget.hintText);
      },
      cursorColor: Colors.white,
      keyboardType: widget.inputType,
      style: AppTextStyle.commonTextStyle(
          color: Colors.white,
          fontSize: SizeConfig.textMultiplier * 2,
          fontWeight: FontWeight.w500),
      decoration: InputDecoration(
        suffixIcon: widget.obsureText!
            ? IconButton(
                icon: Icon(
                  showPass ? Icons.visibility_off : Icons.visibility,
                  color: AppColors.primaryColor,
                ),
                onPressed: () {
                  setState(() {
                    showPass = !showPass;
                  });
                },
              )
            : null,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.primaryColor,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        hintText: widget.hintText,
        labelStyle: AppTextStyle.textFieldStyle(
            color: Colors.white, fontSize: SizeConfig.textMultiplier * 3.5),
        //isDense: true,
        // filled: true,
        hintStyle: AppTextStyle.textFieldAddUser(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: SizeConfig.textMultiplier * 3.5),
        fillColor: AppColors.kTextFieldFillColor,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 14, horizontal: 20.0),
        border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
            gapPadding: 0.0,
            borderRadius: BorderRadius.circular(8)),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(
              color: AppColors.kTextFieldFillColor, width: 1.0),
        ),
      ),
    );
  }

  @override
  void initState() {
    showPass = widget.obsureText!;
    super.initState();
  }
}
