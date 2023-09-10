// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gss/presentation/blocs/home/home_bloc.dart';
import 'package:gss/presentation/blocs/home/home_events.dart';
import 'package:gss/presentation/blocs/home/home_states.dart';
import 'package:gss/presentation/screens/home/widgets/app_bar_action.dart';
import 'package:gss/presentation/screens/home/widgets/app_bar_title.dart';
import 'package:gss/presentation/screens/home/widgets/home_body.dart';
import 'package:gss/presentation/screens/home/widgets/home_bottom_nav.dart';
import 'package:gss/presentation/screens/home/widgets/home_floating_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  Color active = const Color.fromRGBO(3, 106, 130, 1);
  Color disActive = Colors.grey;
  AppBloc? bloc;
  AppGetDataSuccessState appGetDataSuccessState = AppGetDataSuccessState(towers: []);
  AppEChangeNavState changeNavState = AppEChangeNavState(idx: 0);
  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<AppBloc>(context);
    ///instead of static methods
    context.read<AppBloc>().add((GetDataFromApiEvents()));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppBloc, AppStates>(
      listener: (context, state) {
        if (state is AppGetDataSuccessState) {
          appGetDataSuccessState = state;
        }
        if (state is AppEChangeNavState) {
          changeNavState = state;
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color.fromRGBO(244, 244, 244, 1),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            automaticallyImplyLeading: false,
            toolbarHeight: 90,
            titleSpacing: 0,
            title: AppBarTitle(),
            actions: const [AppBarAction()],
          ),
          body: Column(
            children: [
              HomeBody(appGetDataSuccessState),
            ],
          ),
          bottomNavigationBar: HomeBottomNav(
              context: context,
              changeNavState: state is AppEChangeNavState?state:changeNavState),
          floatingActionButton: HomeFloatingWidget(context: context),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        );
      },
    );
  }
}
