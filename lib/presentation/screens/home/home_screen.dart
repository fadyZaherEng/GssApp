// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gss/presentation/blocs/home/home_bloc.dart';
import 'package:gss/presentation/blocs/home/home_events.dart';
import 'package:gss/presentation/blocs/home/home_states.dart';
import 'package:gss/presentation/screens/home/widgets/home_body.dart';
import 'package:gss/presentation/screens/home/widgets/home_bottom_nav.dart';
import 'package:gss/presentation/screens/home/widgets/home_floating_widget.dart';
import 'package:gss/presentation/screens/home/widgets/home_list_item.dart';
import 'package:gss/presentation/widgets/custom_text_filed_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  var searchController = TextEditingController();
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
            title: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color.fromRGBO(255, 255, 255, 1),
              ),
              margin: const EdgeInsetsDirectional.symmetric(horizontal: 10),
              height: 55,
              width: MediaQuery.sizeOf(context).width,
              child: CustomTextFiledWidget(
                context: context,
                controller: searchController,
                prefixIcon: const Icon(
                  Icons.search_outlined,
                  size: 40,
                  color: Colors.grey,
                ),
                text: 'Search by building',
                validate: (val) {
                  return null;
                },
                type: TextInputType.text,
              ),
            ),
            actions: [
              InkWell(
                onTap: () {},
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
          ),
          body: Column(
            children: [
              HomeBody(),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, idx) {
                    return HomeListItem(towerModel: appGetDataSuccessState.towers[idx],context: context);
                  },
                  itemCount: bloc!.towers.length,
                  separatorBuilder: (context, idx) => const SizedBox(
                    height: 15,
                  ),
                ),
              ),
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
