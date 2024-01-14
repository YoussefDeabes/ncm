import 'package:ncm/_base/widgets/base_stateless_widget.dart';
import 'package:flutter/material.dart';
import 'package:ncm/res/const_colors.dart';

class PopupMenuWidget extends BaseStatelessWidget {
  final List<PopupMenuEntry> menuList;
  final Widget? icon;

  PopupMenuWidget({Key? key, required this.menuList, this.icon})
      : super(key: key);

  @override
  Widget baseBuild(BuildContext context) {
    return PopupMenuButton(

      iconSize: 40,
      elevation: 0,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          side: BorderSide(color: ConstColors.border)),
      itemBuilder: (context) => menuList,
      icon: icon,
      child: const Icon(
        Icons.more_horiz_rounded,
        color: ConstColors.app,
        size: 40,
      ),
    );
  }
}
