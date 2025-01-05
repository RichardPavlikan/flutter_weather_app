import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

/// [MenuContainer] is the container widget for the menu.
class MenuContainer extends StatelessWidget {
  const MenuContainer({
    required this.child,
    this.width,
    this.height,
    this.padding,
    this.contentPadding,
    this.spreadRadius = 5,
    this.blurRadius = 7,
    this.shadowColor,
    this.boxShadow,
    this.onTap,
    this.contentWidth,
    this.color,
    super.key,
  });
  final Widget child;
  final double? width;
  final double? height;
  final EdgeInsets? padding;
  final EdgeInsets? contentPadding;
  final double spreadRadius;
  final double blurRadius;
  final Color? shadowColor;
  final List<BoxShadow>? boxShadow;
  final void Function()? onTap;
  final double? contentWidth;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: padding ??
            const EdgeInsets.only(left: 30, top: 15, right: 30, bottom: 15),
        width: width ?? Adaptive.w(80),
        height: height,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          // color: color ?? Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          boxShadow: boxShadow ??
              [
                BoxShadow(
                  color: shadowColor ?? Colors.grey.withOpacity(0.30),
                  spreadRadius: 0.2,
                  blurRadius: 10,
                ),
              ],
        ),
        child: Padding(
          padding: contentPadding ?? const EdgeInsets.all(15),
          child: SizedBox(
            width: contentWidth,
            child: child,
          ),
        ),
      ),
    );
  }
}
