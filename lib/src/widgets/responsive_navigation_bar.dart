import 'package:flutter/material.dart';
import 'package:layout_utils/src/controllers/size_controller.dart';

import '../data/constants.dart';

class ResponsiveNavigationBar extends StatelessWidget implements PreferredSize {
  const ResponsiveNavigationBar({super.key, required this.screenSize, this.decoration, this.title, this.leading, this.menus, this.trailing, required this.navigationBarSize});

  final Size screenSize;
  final Size navigationBarSize;
  final BoxDecoration? decoration;
  final Widget? title;
  final List<Widget>? menus;
  final Widget? leading;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return child;
  }

  @override
  Widget get child => LayoutBuilder(builder: (context, constrains){
    return Container(
      decoration: decoration,
      height: preferredSize.height,
      width: preferredSize.width,
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: SizeController.getSize(constrains.maxWidth).width, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              leading != null ?
              constrains.maxWidth <= Constants.mMaxWidth
                  ? leading!
                  : constrains.maxWidth <= Constants.tMaxWidth &&
                  constrains.maxWidth > Constants.mMaxWidth
                  ? leading!
                  : const SizedBox.shrink()
                  : const SizedBox.shrink(),

              Expanded(child: title ?? const SizedBox()),

              menus != null &&  constrains.maxWidth <= Constants.tMaxWidth &&
                  constrains.maxWidth > Constants.mMaxWidth?
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: menus!,
              ) : const SizedBox.shrink(),

              trailing != null ?
              trailing! : const SizedBox.shrink()
            ],
          )
        ),
      ),
    );
  });

  @override
  Size get preferredSize => navigationBarSize; // Adjust the height as needed
}



