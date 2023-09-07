// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gss/domain/models/tower.dart';
import 'package:gss/presentation/modules/home/cubit/bloc.dart';
import 'package:gss/presentation/modules/home/cubit/events.dart';
import 'package:gss/presentation/modules/home/cubit/states.dart';
import 'package:gss/presentation/resources/components.dart';
import 'package:intl/intl.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var searchController = TextEditingController();
  Color active = const Color.fromRGBO(3, 106, 130, 1);
  Color disActive = Colors.grey;
  final oCcy =  NumberFormat("#,##0", "en_US");
  List<dynamic>options=['assets/svg/ic_filter.svg','Buy','Property Type','Beds','Price'];
  AppGetDataSuccessState appGetDataSuccessState=AppGetDataSuccessState(towers: []);
  AppEChangeNavState changeNavState=AppEChangeNavState(idx: 0);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppBloc, AppStates>(
      listener: (context,state){
        if(state is AppGetDataSuccessState){
          appGetDataSuccessState=state;
        }
        if(state is AppEChangeNavState){
          changeNavState=state;
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color.fromRGBO(244, 244, 244, 1),
          appBar: getAppBar(context),
          body: getBody(context),
          bottomNavigationBar: getBottomNav(context,state),
          floatingActionButton: getFloating(context),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        );
      },
    );
  }

  Widget listItem(TowerModel towerModel,context) {
    return Container(
      width:double.infinity ,
      height: MediaQuery.sizeOf(context).height * 0.39,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(255, 255, 255, 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 10.0,vertical: 8),
        child: Column(
          children: [
            SizedBox(
              height: 152,
              child: InkWell(
                onTap: (){},
                child: Stack(
                  children: [
                    stackFirstPart(context, towerModel),
                    InkWell(
                      onTap: (){
                      },
                      child: Align(
                        alignment: AlignmentDirectional.bottomEnd,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: CircleAvatar(
                            backgroundColor: const Color.fromRGBO(3, 106, 130, 1),
                            child: InkWell(onTap:(){
                              //showToast(message: "ic_add_favourite", state: ToastState.SUCCESS);
                            },child: SvgPicture.asset('assets/svg/ic_add_favourite.svg')),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [//here money
                Text(
                  '${oCcy.format(towerModel.pounds).toString()} AED',
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                const Text(
                  ' / Month',
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ],
            ),
            const SizedBox(
              height: 3,
            ),
            Row(
              children: [
                SvgPicture.asset('assets/svg/ic_location_card.svg'),
                Text(
                  ' ${towerModel.address.toString()}',
                  style: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.normal,
                      fontSize: 12),
                ),
              ],
            ),
            const SizedBox(
              height: 3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                getRowData("ic_bed", '${towerModel.beds} Beds'),
                const SizedBox(
                  width: 10,
                ),
                getRowData("ic_bath", '${towerModel.bath} Bath'),
                const SizedBox(
                  width: 10,
                ),
                getRowData("ic_measure", '${towerModel.sqft} Sqft'),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              height: 0.6,
              width: double.infinity,
              color: Colors.grey,
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${towerModel.numOfDay} Days ago",
                  style: const TextStyle(
                      color: Color.fromRGBO(
                        3,
                        106,
                        130,
                        1,
                      ),
                      fontSize: 12),
                ),
                Row(
                  children: [
                    getCircleAvatar('ic_phone'),
                    const SizedBox(
                      width: 10,
                    ),
                    getCircleAvatar('ic_email'),
                    const SizedBox(
                      width: 10,
                    ),
                    getCircleAvatar('ic_whatsapp'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget getCircleAvatar(String path) {
    return InkWell(
      onTap: (){
       // showToast(message: path, state: ToastState.SUCCESS);
      },
      child: CircleAvatar(
        radius: 17,
        backgroundColor: const Color.fromRGBO(165, 165, 165, 1),
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: SvgPicture.asset('assets/svg/$path.svg'),
        ),
      ),
    );
  }

  getRowData(String name, String path) {
    return Row(
      children: [
        SizedBox(
            width: 18,
            height: 15,
            child: SvgPicture.asset('assets/svg/$name.svg')),
        const SizedBox(
          width: 5,
        ),
        Text(
          path,
          style: const TextStyle(
              color: Colors.grey, fontWeight: FontWeight.normal, fontSize: 12),
        ),
      ],
    );
  }

  getIconTheme(String data) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 36,
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 8),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(18)),
        ),
        child: Center(
          child: Text(
            data,
            style: const TextStyle(color: Color.fromRGBO(117, 117, 117, 1)),
          ),
        ),
      ),
    );
  }

  stackFirstPart(context, TowerModel towerModel) {
    return Container(
      width: 327,
      height: 135,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(7),
      ),
      child: Column(
        children: [
          Align(
            alignment: AlignmentDirectional.topStart,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: 57,
                height: 30,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(34, 34, 34, 1),
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
                child: Center(
                  child: Text(
                    "Villa",
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontWeight: FontWeight.bold,
                        fontSize: 13),
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                towerModel.title,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 26),
              ),
            ),
          ),
          const Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 6,
                  backgroundColor: Color.fromRGBO(204, 204, 204, 1),
                ),
                SizedBox(
                  width: 3,
                ),
                CircleAvatar(
                  radius: 6,
                  backgroundColor: Color.fromRGBO(204, 204, 204, 1),
                ),
                SizedBox(
                  width: 3,
                ),
                CircleAvatar(
                  radius: 8,
                  backgroundColor: Color.fromRGBO(204, 204, 204, 1),
                ),
                SizedBox(
                  width: 3,
                ),
                CircleAvatar(
                  radius: 10,
                  backgroundColor: Color.fromRGBO(255, 255, 255, 1),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  getFloating(BuildContext context) {
    return SizedBox(
      height: 60,
      child: FloatingActionButton.extended(
          backgroundColor: Colors.white,
          isExtended: true,
          onPressed: () {},
          label: Row(
            children: [
              InkWell(
                onTap: (){},
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(children: [
                    SvgPicture.asset('assets/svg/ic_map.svg'),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text(
                      "Map",
                      style: TextStyle(
                          color: Color.fromRGBO(3, 106, 130, 1),
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                  ],),
                ),
              ),
              Container(
                height: 60,
                width: .5,
                color: Colors.grey,
              ),
              InkWell(
                onTap: (){},
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children:
                    [
                      const SizedBox(
                        width: 5,
                      ),
                      SvgPicture.asset('assets/svg/ic_sort.svg'),
                      const Text(
                        "Sort",
                        style: TextStyle(
                            color: Color.fromRGBO(3, 106, 130, 1),
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }

  getBottomNav(BuildContext context,state) {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      elevation: 5,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
            icon:(changeNavState.idx==0)?
            Container(
              margin: const EdgeInsetsDirectional.symmetric(
                  horizontal: 8),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(3 ,106, 130, 0.08),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.symmetric(
                    horizontal: 8,vertical: 10),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/svg/ic_bar_search_fill.svg',
                      color: changeNavState.idx == 0
                          ? active
                          : disActive,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Search",
                      style: TextStyle(
                          color: changeNavState.idx == 0
                              ? active
                              : disActive),
                    )
                  ],
                ),
              ),
            ):
            Padding(
              padding: const EdgeInsetsDirectional.symmetric(
                  horizontal: 8.0),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/svg/ic_bar_search_fill.svg',
                    color: changeNavState.idx == 0
                        ? active
                        : disActive,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Search",
                    style: TextStyle(
                        color: changeNavState.idx == 0
                            ? active
                            : disActive),
                  )
                ],
              ),
            ),
            label: ""),
        BottomNavigationBarItem(
            icon:(changeNavState.idx==1)?
            Container(
              margin: const EdgeInsetsDirectional.symmetric(
                  horizontal: 8),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(3 ,106, 130, 0.08),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.symmetric(horizontal: 8.0,vertical: 10),
                child: Row(
                  children: [
                    SvgPicture.asset('assets/svg/ic_bar_save.svg',
                        color: changeNavState.idx == 1
                            ? active
                            : disActive),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Saved",
                      style: TextStyle(
                          color: changeNavState.idx == 1
                              ? active
                              : disActive),
                    )
                  ],
                ),
              ),
            ):Padding(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 8.0,vertical: 10),
              child: Row(
                children: [
                  SvgPicture.asset('assets/svg/ic_bar_save.svg',
                      color: changeNavState.idx == 1
                          ? active
                          : disActive),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Saved",
                    style: TextStyle(
                        color: changeNavState.idx == 1
                            ? active
                            : disActive),
                  )
                ],
              ),
            ),
            label: ""),
        BottomNavigationBarItem(
            icon:(changeNavState.idx==2)?
            Container(
              margin: const EdgeInsetsDirectional.symmetric(
                  horizontal: 8),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(3 ,106, 130, 0.08),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.symmetric(vertical: 10,horizontal: 8),
                child: Row(
                  children: [
                    SvgPicture.asset('assets/svg/ic_bar_more.svg',
                        color: changeNavState.idx == 2
                            ? active
                            : disActive),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "More",
                      style: TextStyle(
                          color: changeNavState.idx == 2
                              ? active
                              : disActive),
                    )
                  ],
                ),
              ),
            ):  Padding(
              padding: const EdgeInsetsDirectional.symmetric(vertical: 10,horizontal: 8),
              child: Row(
                children: [
                  SvgPicture.asset('assets/svg/ic_bar_more.svg',
                      color: changeNavState.idx == 2
                          ? active
                          : disActive),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "More",
                    style: TextStyle(
                        color: changeNavState.idx == 2
                            ? active
                            : disActive),
                  )
                ],
              ),
            ),
            label: ""),
      ],
      selectedIconTheme:const IconThemeData(
          color: Color.fromRGBO(3 ,106, 130, 0.08)
      ),
      currentIndex: changeNavState.idx,
      onTap: (idx) {
        //changeNavState.idxmNav(idx);
        context.read<AppBloc>().add(GetChangeNavBottomEvents(idx: idx));
      },
    );
  }

  getBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          SizedBox(
            height: 45,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
                itemBuilder: (context,idx){
                if(idx==0) {
                  return  InkWell(
                  onTap: () {},
                  child: Container(
                    width: 44,
                    height: 36,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                      BorderRadius.all(Radius.circular(36)),
                    ),
                    child: Center(
                        child: SvgPicture.asset(
                            'assets/svg/ic_filter.svg')),
                  ),
                );
                }
                return getIconTheme(options[idx]);
                },
                separatorBuilder:(context,idx){
                 return const SizedBox(width: 15,);
                },
                itemCount: options.length),
          ),
          const SizedBox(
            height: 8,
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, idx) {
                return listItem(appGetDataSuccessState.towers[idx],context);
              },
              itemCount: appGetDataSuccessState.towers.length,
              separatorBuilder: (context, idx) => const SizedBox(
                height: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }

  getAppBar(BuildContext context) {
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
        width: MediaQuery.sizeOf(context).width,
        child: defaultTextForm(
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
              const SizedBox(width: 6,),
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
