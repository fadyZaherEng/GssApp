import 'package:flutter/cupertino.dart';
import 'package:gss/src/presentation/widgets/list_item_widget.dart';
import 'package:hive/hive.dart';

class SavedListWidget extends StatelessWidget {
  Box savedTowers;
  void Function() homeItemListClick;
  void Function() homeCallClick;
  void Function() homeEmailClick;
  void Function() homeLogoListClick;
  void Function() homeOpenWhatsAppClick;
  BuildContext context;

  SavedListWidget({
    required this.savedTowers,
    required this.context,
    required this.homeItemListClick,
    required this.homeCallClick,
    required this.homeEmailClick,
    required this.homeLogoListClick,
    required this.homeOpenWhatsAppClick,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) =>
            ListItemWidget(
              towerModel: savedTowers.getAt(index),
              context: context,
              index: index,
              homeItemListClick: homeItemListClick,
              homeCallClick: homeCallClick,
              homeEmailClick: homeEmailClick,
              homeLogoListClick: homeLogoListClick,
              homeOpenWhatsAppClick: homeOpenWhatsAppClick,
            ),
        separatorBuilder: (context, index) =>
        const SizedBox(
          height: 15,
        ),
        itemCount: savedTowers.length);
  }
}
