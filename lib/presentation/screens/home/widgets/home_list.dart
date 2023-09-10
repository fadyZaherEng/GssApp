import 'package:flutter/material.dart';
import 'package:gss/presentation/blocs/home/home_states.dart';
import 'package:gss/presentation/screens/home/widgets/home_list_item.dart';

class HomeList extends StatelessWidget {
  AppGetDataSuccessState appGetDataSuccessState;

  HomeList(this.appGetDataSuccessState);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, idx) {
          return HomeListItem(
              towerModel: appGetDataSuccessState.towers[idx], context: context);
        },
        itemCount: appGetDataSuccessState.towers.length,
        separatorBuilder: (context, idx) =>
        const SizedBox(
          height: 15,
        ),
      ),
    );
  }
}
