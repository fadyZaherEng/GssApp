import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gss/domain/models/tower.dart';
import 'package:gss/presentation/blocs/home/home_bloc.dart';
import 'package:gss/presentation/blocs/home/home_event.dart';
import 'package:gss/presentation/blocs/home/home_state.dart';
import 'package:intl/intl.dart';

class ListItemWidget extends StatelessWidget {
  TowerModel towerModel;
  int index;
  BuildContext context;
  void Function() homeItemListClick;
  void Function() homeLogoListClick;
  void Function() homeOpenWhatsAppClick;
  void Function() homeCallClick;
  void Function() homeEmailClick;

  ListItemWidget({
    super.key,
    required this.index,
    required this.context,
    required this.towerModel,
    required this.homeItemListClick,
    required this.homeLogoListClick,
    required this.homeCallClick,
    required this.homeEmailClick,
    required this.homeOpenWhatsAppClick,
  });

  HomeBloc get _bloc => BlocProvider.of<HomeBloc>(context);

  @override
  Widget build(BuildContext context) {
    final oCcy = NumberFormat("#,##0", "en_US");
    return BlocConsumer<HomeBloc, AbstractionHomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Wrap(children: [
          InkWell(
            onTap: homeItemListClick,
            child: Center(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(255, 255, 255, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.symmetric(
                      horizontal: 10.0, vertical: 10),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 152,
                        child: InkWell(
                          onTap: homeItemListClick,
                          child: Stack(
                            children: [
                              stackFirstPart(context, towerModel),
                              InkWell(
                                onTap: () {
                                  _bloc.add(HomeFavoritesClickEvent(
                                      towerModel: towerModel, index: index));
                                },
                                child: Align(
                                  alignment: AlignmentDirectional.bottomEnd,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: CircleAvatar(
                                      backgroundColor:
                                      state is HomeChangeFavColorState
                                          ? state.index != null &&
                                          index != null && state.index == index
                                          ? Colors.teal
                                          : const Color.fromRGBO(
                                          3, 106, 130, 1)
                                          : const Color.fromRGBO(
                                          3, 106, 130, 1),
                                      child: InkWell(
                                          onTap: () {
                                            _bloc.add(HomeFavoritesClickEvent(
                                                towerModel: towerModel,
                                                index: index));
                                          },
                                          child: SvgPicture.asset(
                                              'assets/svg/ic_add_favourite.svg')),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          //here money
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
                              InkWell(
                                onTap: homeCallClick,
                                child: getCircleAvatar('ic_phone'),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              InkWell(
                                onTap: homeEmailClick,
                                child: getCircleAvatar('ic_email'),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              InkWell(
                                onTap: homeOpenWhatsAppClick,
                                child: getCircleAvatar('ic_whatsapp'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ]);
      },
    );
  }

  Widget getCircleAvatar(String path) {
    return CircleAvatar(
      radius: 17,
      backgroundColor: const Color.fromRGBO(165, 165, 165, 1),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: SvgPicture.asset('assets/svg/$path.svg'),
      ),
    );
  }

  Widget getRowData(String name, String path) {
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

  Widget stackFirstPart(context, TowerModel towerModel) {
    return Container(
      width: double.infinity,
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
}
