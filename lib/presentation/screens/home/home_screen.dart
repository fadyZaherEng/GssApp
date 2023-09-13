// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gss/domain/models/tower.dart';
import 'package:gss/presentation/blocs/home/home_bloc.dart';
import 'package:gss/presentation/blocs/home/home_event.dart';
import 'package:gss/presentation/blocs/home/home_state.dart';
import 'package:gss/presentation/screens/home/saved/saved_screen.dart';
import 'package:gss/presentation/screens/home/widgets/home_body_widget.dart';
import 'package:gss/presentation/screens/home/widgets/home_bottom_nav_widget.dart';
import 'package:gss/presentation/screens/home/widgets/home_floating_widget.dart';
import 'package:gss/presentation/widgets/custom_text_field_widget.dart';
import 'package:gss/utils/navigate_with_return.dart';
import 'package:hive/hive.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  HomeBloc get _bloc => BlocProvider.of<HomeBloc>(context);
  List<TowerModel> _towers = [];
  int _homeChangeNavIndex = 0;
  Box? boxTowers;

  @override
  void initState() {
    super.initState();
    _bloc.add((HomeGetDataFromApiEvent()));
    _bloc.initFavoritiesValueOFList();
    _bloc.add(HomeGetTowerClickEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, AbstractionHomeState>(
      listener: (context, state) {
        if (state is HomeGetDataSuccessState) {
          _towers = state.towers;
        }
        if (state is HomeChangeNavState) {
          _homeChangeNavIndex = state.homeChangeNavIdx;
        }
        if(state is HomeGetTowerClickState){
          boxTowers=state.savedTowers;
        }
        if(state is HomeGetFavState){
          boxTowers=state.savedTower;
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color.fromRGBO(244, 244, 244, 1),
          appBar: _homeAppBar(),
          body: HomeBodyWidget(
            towers: _towers,
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
              _bloc.add(HomeOpenWhatsAppClickEvent(homeWhatsAppNumber: ""));
            },
          ),
          bottomNavigationBar: HomeBottomNavWidget(
            homeChangeNavIdx: _homeChangeNavIndex,
            homeBottomNavChange: (index) {
              _bloc.add(HomeChangeNavBottomEvent(homeChangNavIdx: index));
              if (index == 1) {
                navigateToWithReturn(
                  context: context,
                  screen: SavedScreen(savedTowers:boxTowers!),
                );
            }
            },
          ),
          floatingActionButton: HomeFloatingWidget(
            homeFloatingMapClick: () {
              _bloc.add(HomeFloatingSortClickEvent());
            },
            homeFloatingSortClick: () {
              _bloc.add(HomeFloatingMapClickEvent());
            },
          ),
          floatingActionButtonLocation:
          FloatingActionButtonLocation.centerFloat,
        );
      },
    );
  }

  PreferredSizeWidget _homeAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      automaticallyImplyLeading: false,
      toolbarHeight: 90,
      titleSpacing: 0,
      title: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color.fromRGBO(255, 255, 255, 1),
        ),
        margin: const EdgeInsetsDirectional.symmetric(horizontal: 10),
        height: 55,
        width: MediaQuery
            .sizeOf(context)
            .width,
        child: CustomTextFieldWidget(
          onSubmitted: (val) {},
          onChanged: (val) {
            //add event
            _bloc.add(HomeSearchChangeEvent(homeSearchKey: val));
          },
          controller: _searchController,
          text: 'Search by building',
          errorMSG: null,
        ),
      ),
      actions: [
        InkWell(
          onTap: () {
            //add event
            _bloc.add(HomeSavedClickedEvent());
          },
          child: Row(
            children: [
              SvgPicture.asset('assets/svg/ic_save_home.svg'),
              const SizedBox(
                width: 6,
              ),
              Container(
                margin: const EdgeInsets.only(right: 17),
                child: const Text(
                  "Save",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(3, 106, 130, 1),
                      fontSize: 17),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
