import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lord_krishna_builders_app/app_configs/app_colors/app_colors.dart';

class LoadingOverlay {
  OverlayEntry? _overlay;

  LoadingOverlay();

  void hide() {
    if (_overlay != null) {
      _overlay!.remove();
      _overlay = null;
    }
  }

  void show(BuildContext context) {
    if (_overlay == null) {
      _overlay = OverlayEntry(
        // replace with your own layout
        builder: (context) => ColoredBox(
          color: const Color(0x80000000),
          child: Center(
            child: LoadingAnimationWidget.inkDrop(
              color: AppColors.ktitleColor,
              size: MediaQuery.of(context).size.width * .10,
            ),
          ),
        ),
      );
      Overlay.of(context).insert(_overlay!);
    }
  }
}
