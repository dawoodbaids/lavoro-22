import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../modules/auth/forget_page/themehelper.dart';
import 'text_theme.dart';

class CustomButton extends StatelessWidget {
  final String? label;
  final Widget? child;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final IconData? icons;
  final void Function()? onPressed;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final double borderRadiusValue;
  final String? tooltip;
  final Color? disabledColor;
  final double? elevation;
  const CustomButton({
    super.key,
    this.label,
    this.child,
    this.onPressed,
    this.icons,
    this.backgroundColor = Colors.purple,
    this.foregroundColor = Colors.white,
    this.width,
    this.height,
    this.padding,
    this.borderRadiusValue = 19,
    this.tooltip,
    this.disabledColor,
    this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip ?? '',
      child: MaterialButton(
        height: height ?? 50,
        minWidth: width ?? double.infinity,
        onPressed: onPressed,
        disabledTextColor: Colors.grey,
        disabledColor: disabledColor,
        disabledElevation: 2,
        elevation: elevation,
        color: backgroundColor ?? Get.theme.colorScheme.primary,
        padding: padding,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadiusValue),
          side: const BorderSide(
            color: Colors.purple,
          ),
        ),
        child: icons == null
            ? child ??
                Text(
                  label ?? '',
                  style: AppStyles.button.copyWith(
                    color: Get.theme.colorScheme.background,
                  ),
                )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icons, color: foregroundColor),
                  if (label != null) const SizedBox(width: 8.0),
                  if (label != null)
                    Text(
                      label!,
                      style: TextStyle(fontSize: 18, color: foregroundColor),
                    ),
                ],
              ),
      ),
    );
  }
}

class CustomButtonWithLoading extends StatefulWidget {
  const CustomButtonWithLoading({
    super.key,
    required this.onPressed,
    this.label,
    this.color,
    this.height,
    this.width,
    this.padding,
    this.loadingColor,
  });

  final Future<void> Function()? onPressed;
  final Widget? label;
  final Color? color;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final Color? loadingColor;

  @override
  State<CustomButtonWithLoading> createState() =>
      _CustomButtonWithLoadingState();
}

class _CustomButtonWithLoadingState extends State<CustomButtonWithLoading> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: widget.padding ?? const EdgeInsets.all(14.0),
      color: widget.color,
      minWidth: widget.width ?? double.infinity,
      height: widget.height,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      onPressed: () async {
        setState(() => isLoading = true);
        await widget.onPressed?.call().whenComplete(() => null);
        setState(() => isLoading = false);
      },
      child: isLoading
          ? Center(
              child: LinearProgressIndicator(
                color: widget.loadingColor,
              ),
            )
          : widget.label,
    );
  }
}

class CustomPrimaryButton extends StatelessWidget {
  final String? label;
  final VoidCallback? onPresssed;
  final int? maxLines;
  final Color? backgroundColor;
  final Color? textColor;
  const CustomPrimaryButton({
    super.key,
    this.onPresssed,
    this.label,
    this.maxLines,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ThemeHelper().buttonBoxDecoration(context),
      width: double.infinity,
      child: ElevatedButton(
        style: ThemeHelper().buttonStyle().copyWith(
              backgroundColor: MaterialStateProperty.all(
                  backgroundColor ?? Get.theme.colorScheme.primary),
            ),
        onPressed: onPresssed,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
          child: Text(
            label ?? "label",
            maxLines: maxLines,
            overflow: TextOverflow.ellipsis,
            style: AppStyles.button.copyWith(
              color: textColor ?? Get.theme.colorScheme.background,
            ),
          ),
        ),
      ),
    );
  }
}
