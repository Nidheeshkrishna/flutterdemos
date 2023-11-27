import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lord_krishna_builders_app/app_configs/app_colors/app_colors.dart';
import 'package:lord_krishna_builders_app/app_configs/size_config/responsive_config.dart';
import 'package:lord_krishna_builders_app/app_modules/company_selection_module/Views/widgets/custom_radio_group_company.dart';
import 'package:lord_krishna_builders_app/app_modules/login_module/views/widgets/login_bg_widget.dart';
import 'package:lord_krishna_builders_app/app_utils/app_text_styles/app_text_style.dart';

class CompanyselectionPage extends StatefulWidget {
  const CompanyselectionPage({super.key});

  @override
  State<CompanyselectionPage> createState() => _CompanyselectionPageState();
}

class _CompanyselectionPageState extends State<CompanyselectionPage> {
  @override
  Widget build(BuildContext context) {
    final responsiveData = ResponsiveData.of(context);
    return Scaffold(
        body: BgSetter(
      child: SizedBox(
        width: responsiveData.screenWidth,
        height: responsiveData.screenHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                width: responsiveData.screenWidth,
                child: RadioListTileExample(
                  selectedCompany: (commpany) {
                    if (kDebugMode) {
                      print(commpany);
                    }
                  },
                ))
          ],
        ),
      ),
    ));
  }
}
