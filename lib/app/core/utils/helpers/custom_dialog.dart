import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../global_widgets/custom_button.dart';
import '../../theme/text_theme.dart';

class CustomDialog {
  static Future<bool?> showYesNoDialog({
    required String title,
    required String content,
    IconData? icons,
    Color? iconsColor,
    String? yesButtonText,
    String? noButtonText,
    VoidCallback? onYesPressed,
    VoidCallback? onNoPressed,
    Color? yesButtonColor,
    bool barrierDismissible = true,
    Widget? body,
  }) async {
    return await Get.dialog<bool>(
      AlertDialog(
        titlePadding:
            const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
        backgroundColor: Get.theme.colorScheme.background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        title: Column(
          children: [
            Text(
              title,
              style: AppStyle.headLine2,
            ),
            const SizedBox(height: 35.0),
            body ??
                Text(
                  content,
                  style: AppStyle.headLine4,
                  textAlign: TextAlign.center,
                ),
            const SizedBox(height: 35.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  CustomButton(
                    label: yesButtonText ?? 'Yes',
                    backgroundColor:
                        yesButtonColor ?? Get.theme.colorScheme.primary,
                    onPressed: () {
                      Get.back(result: true);
                      onYesPressed?.call();
                    },
                  ),
                  const SizedBox(height: 10.0),
                  CustomButton(
                    label: noButtonText ?? 'No',
                    backgroundColor: Get.theme.colorScheme.background,
                    onPressed: () {
                      Get.back(result: false);
                      onNoPressed?.call();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      barrierDismissible: barrierDismissible,
    );
  }

  static Future<bool?> showDoneDialog({
    required String title,
    String? content,
    final Widget? body,
    final String? doneButtonText,
    final VoidCallback? onDonePressed,
    bool barrierDismissible = true,
  }) async {
    return await Get.dialog<bool>(
      AlertDialog(
        titlePadding: EdgeInsets.zero,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Column(
          children: [
            Container(
              width: double.infinity,
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
              decoration: BoxDecoration(
                color: Get.theme.colorScheme.background,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12.0),
                  topRight: Radius.circular(12.0),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: AppStyle.headLine2,
                  ),
                  const SizedBox(height: 35.0),
                  body ??
                      Text(
                        content ?? "content",
                        style: AppStyle.headLine4,
                        textAlign: TextAlign.center,
                      ),
                  const SizedBox(height: 35.0),
                ],
              ),
            ),
            const SizedBox(height: 4.0),
            MaterialButton(
              minWidth: double.infinity,
              padding: const EdgeInsets.all(12.0),
              color: Get.theme.colorScheme.primary,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(12.0),
              )),
              onPressed: () {
                Get.back(result: true);
                onDonePressed?.call();
              },
              child: Text(
                doneButtonText ?? 'Done',
                style: AppStyle.button.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      barrierDismissible: barrierDismissible,
    );
  }

  static void buildguestdialog(BuildContext buildContext) {}
}
