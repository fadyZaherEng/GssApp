import 'package:flutter/material.dart';
import 'package:gss/domain/models/tower.dart';
import 'package:gss/presentation/screens/home/widgets/home_list_item_widget.dart';

class HomeListWidget extends StatelessWidget {
  List<TowerModel> towers = [];
  void Function() homeItemListClick;
  void Function() homeLogoListClick;
  void Function() homeFavoritesClick;
  void Function() homeOpenWhatsAppClick;
  void Function() homeCallClick;
  void Function() homeEmailClick;

  HomeListWidget({
    super.key,
    required this.towers,
    required this.homeItemListClick,
    required this.homeLogoListClick,
    required this.homeFavoritesClick,
    required this.homeCallClick,
    required this.homeEmailClick,
    required this.homeOpenWhatsAppClick,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, idx) {
          return HomeListItemWidget(
            towerModel: towers[idx],
            context: context,
            homeItemListClick: homeItemListClick,
            homeCallClick: homeCallClick,
            homeFavoritesClick: homeFavoritesClick,
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
