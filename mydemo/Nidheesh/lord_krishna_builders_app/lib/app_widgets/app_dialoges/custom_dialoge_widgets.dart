// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:lord_krishna_builders_app/app/app_colors/app_colors.dart';

// import 'package:vyapari_mithra/constants/app_colors.dart';
// import 'package:vyapari_mithra/utilities/size_config.dart';

// typedef OnTap<T> = Function(T);

// class CustomDialog extends StatelessWidget {
//   final String title;
//   final String content;
//   final Widget? leadingIcon;
//   final CustomDialogButton? positiveButton;
//   final CustomDialogButton? negativeButton;

//   const CustomDialog(
//       {super.key,
//       required this.title,
//       required this.content,
//       required this.leadingIcon,
//       this.negativeButton,
//       this.positiveButton});

//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async => false,
//       child: AlertDialog(
//         backgroundColor: AppColors.appWhite,
//         shape: RoundedRectangleBorder(
//             borderRadius:
//                 BorderRadius.circular(SizeConfig.sizeMultiplier * 5.1)),
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             leadingIcon ?? const SizedBox(),
//             const SizedBox(width: 15),
//             Text(
//               title,
//               textAlign: TextAlign.justify,
//               style: const TextStyle(
//                 color: AppColors.colorPrimary,
//                 fontWeight: FontWeight.w600,
//                 height: 1.2,
//               ),
//             ),
//           ],
//         ),
//         content: Text(
//           content,
//           textAlign: TextAlign.justify,
//           style: TextStyle(
//             color: AppColors.appBlack,
//             fontWeight: FontWeight.w400,
//             fontSize: 13.sp,
//             height: 1.2,
//           ),
//         ),
//         actions: [
//           Padding(
//             padding: EdgeInsets.symmetric(
//                 horizontal: SizeConfig.widthMultiplier * 3.2,
//                 vertical: SizeConfig.widthMultiplier),
//             child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   if (negativeButton != null)
//                     Expanded(
//                         child: ElevatedButton(
//                       onPressed: () async {
//                         negativeButton!.onTap("");
//                       },
//                       style: ElevatedButton.styleFrom(
//                           backgroundColor: AppColors.cardBgColor),
//                       child: Text(
//                         negativeButton!.text,
//                         style: TextStyle(
//                             color: AppColors.colorPrimary,
//                             fontSize: SizeConfig.widthMultiplier * 4.2,
//                             height: 1.2,
//                             fontWeight: FontWeight.w600),
//                       ),
//                     )),
//                   const SizedBox(
//                     width: 10,
//                   ),
//                   if (positiveButton != null)
//                     Expanded(
//                       child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: AppColors.colorPrimary,
//                           ),
//                           onPressed: () {
//                             positiveButton!.onTap("");
//                           },
//                           child: Text(
//                             positiveButton!.text,
//                             style: TextStyle(
//                                 color: AppColors.cardBgColor,
//                                 height: 1.2,
//                                 fontSize: SizeConfig.widthMultiplier * 4.2,
//                                 fontWeight: FontWeight.w600),
//                           )),
//                     ),
//                 ]),
//           )
//         ],
//       ),
//     );
//   }
// }

// class CustomDialogButton {
//   final String text;
//   final OnTap onTap;
//   CustomDialogButton({required this.text, required this.onTap});
// }