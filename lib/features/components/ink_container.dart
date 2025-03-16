import 'package:flutter/material.dart';

class InkContainer extends StatelessWidget{
  BorderRadiusGeometry? borderRadius;
  EdgeInsets? padding;
  BoxDecoration? decoration;
  EdgeInsets? margin;
  double? height;
  double? width;
  Widget? child;
  ShapeBorder? shape;
  Clip clipBehavior;
  Alignment? alignment;
  Color? splashColor;
  void Function()? onTap;
  void Function()? onDoubleTap;
  void Function()? onLongPress;
  Duration? duration;
  Curve? curve;
  InkContainer({super.key, 
    this.borderRadius,
    this.alignment,
    this.padding,
    this.margin,
    this.shape,
    this.clipBehavior = Clip.none,
    this.splashColor,
    this.decoration,
    this.width,
    this.height,
    this.child,
    this.onTap,
    this.onDoubleTap,
    this.onLongPress,
    this.duration,
    this.curve,
  });
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: duration ?? Duration(milliseconds: 300),
      curve: curve ?? Curves.easeInOut,
      margin: margin ?? EdgeInsets.zero,
      height: height,
      width: width,
      decoration: decoration,
      clipBehavior: clipBehavior,
      child: Material(
        color: decoration?.color,
        shape: shape,
        borderRadius: decoration?.borderRadius,
        child: Ink(
          decoration: decoration,
          child: InkWell(
            splashColor: splashColor,
            onTap: onTap,
            onDoubleTap: onDoubleTap,
            onLongPress: onLongPress,
            borderRadius: (borderRadius ?? decoration?.borderRadius) as BorderRadius?,
            child: Container(
              padding: padding ?? EdgeInsets.zero,
              alignment: alignment,
              child: child,
            ),
          ),
        ),
      )
    );
  }
}