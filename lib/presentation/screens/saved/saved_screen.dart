// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gss/presentation/blocs/home/home_bloc.dart';
import 'package:gss/presentation/blocs/home/home_event.dart';
import 'package:gss/presentation/blocs/home/home_state.dart';
import 'package:gss/presentation/screens/saved/widgets/saved_list_widget.dart';
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
          backgroundColor: const Color.fromRGBO(244, 244, 244, 1),
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SafeArea(
              child: widget.savedTowers.length == 0
                  ? const Center(
                      child: Text(
                        "Not Found Saved Item",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    )
                  : SavedListWidget(
                      savedTowers: widget.savedTowers,
                      context: context,
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
                        _bloc.add(
                            HomeOpenWhatsAppClickEvent(homeWhatsAppNumber: ""));
                      },
                    ),
            ),
          ),
        );
      },
    );
  }
}
