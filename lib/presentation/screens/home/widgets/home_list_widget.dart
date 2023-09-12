import 'package:flutter/material.dart';
import 'package:gss/domain/models/tower.dart';
import 'package:gss/presentation/screens/home/widgets/home_list_item_widget.dart';

class HomeListWidget extends StatelessWidget {
  List<TowerModel> towers = [];
  void Function() homeItemListClick;
  void Function() homeLogoListClick;
  void Function() homeOpenWhatsAppClick;
  void Function() homeCallClick;
  void Function() homeEmailClick;
  bool favClicked=false;
  HomeListWidget({
    super.key,
    required this.towers,
    required this.homeItemListClick,
    required this.homeLogoListClick,
    required this.homeCallClick,
    required this.homeEmailClick,
    required this.homeOpenWhatsAppClick,
    favClicked=false,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, idx) {
          return HomeListItemWidget(
            towerModel: towers[idx],
            index: idx,
            context: context,
            homeItemListClick: homeItemListClick,
            homeCallClick: homeCallClick,
            homeEmailClick: homeEmailClick,
            homeLogoListClick: homeLogoListClick,
            homeOpenWhatsAppClick: homeOpenWhatsAppClick,
          );
        },
        itemCount: towers.length,
        separatorBuilder: (context, idx) => const SizedBox(
          height: 15,
        ),
      ),
    );
  }
}
