import 'package:flutter/material.dart';
import 'package:gss/domain/models/tower.dart';
import 'package:gss/presentation/blocs/home/home_states.dart';
import 'package:gss/presentation/screens/home/widgets/home_list_item.dart';

class HomeListWidget extends StatelessWidget {
  List<TowerModel>towers=[];

  HomeListWidget({required this.towers});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, idx) {
          return HomeListItem(
              towerModel: towers[idx], context: context);
        },
        itemCount: towers.length,
        separatorBuilder: (context, idx) =>
        const SizedBox(
          height: 15,
        ),
      ),
    );
  }
}
