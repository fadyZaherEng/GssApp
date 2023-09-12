import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gss/presentation/blocs/home/home_bloc.dart';
import 'package:gss/presentation/blocs/home/home_event.dart';
import 'package:gss/presentation/blocs/home/home_state.dart';
import 'package:gss/presentation/screens/home/widgets/home_list_item_widget.dart';
import 'package:gss/presentation/widgets/custom_divider_widget.dart';
import 'package:hive/hive.dart';

class SavedScreen extends StatefulWidget {
  Box savedTowers;

  SavedScreen({
    required this.savedTowers,
  });

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  HomeBloc get _bloc => BlocProvider.of<HomeBloc>(context);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, AbstractionHomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SafeArea(
              child: ListView.separated(
                  itemBuilder: (context, index) => HomeListItemWidget(
                        towerModel: widget.savedTowers.getAt(index),
                        context: context,
                        index: index,
                        homeItemListClick: () {
                          _bloc.add(HomeItemListClickEvent());
                        },
                        homeCallClick: () {
                          _bloc.add(HomeCallClickEvent(homePhone: ""));
                        },
                        homeEmailClick: () {
                          _bloc.add(HomeEmailClickEvent(homeEmail: ""));
                        },
                        homeLogoListClick: () {
                          _bloc.add(HomeLogoListClickEvent());
                        },
                        homeOpenWhatsAppClick: () {
                          _bloc.add(HomeOpenWhatsAppClickEvent(
                              homeWhatsAppNumber: ""));
                        },
                      ),
                  separatorBuilder: (context, index) => const CustomDividerWidget(),
                  itemCount: widget.savedTowers.length),
            ),
          ),
        );
      },
    );
  }
}
