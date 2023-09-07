import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gss/presentation/blocs/home/home_bloc.dart';
import 'package:gss/presentation/blocs/home/home_events.dart';

class HomeBottomNav extends StatelessWidget {
  final BuildContext context;
  final dynamic changeNavState;
  Color active = const Color.fromRGBO(3, 106, 130, 1);
  Color disActive = Colors.grey;
  HomeBottomNav({required this.context,required this.changeNavState});

  @override
  Widget build(BuildContext context) {
    return   BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      elevation: 5,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
            icon: (changeNavState.idx == 0)
                ? Container(
              margin:
              const EdgeInsetsDirectional.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(3, 106, 130, 0.08),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.symmetric(
                    horizontal: 8, vertical: 10),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/svg/ic_bar_search_fill.svg',
                      color: changeNavState.idx == 0 ? active : disActive,
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
            )
                : Padding(
              padding:
              const EdgeInsetsDirectional.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/svg/ic_bar_search_fill.svg',
                    color: changeNavState.idx == 0 ? active : disActive,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Search",
                    style: TextStyle(
                        color:
                        changeNavState.idx == 0 ? active : disActive),
                  )
                ],
              ),
            ),
            label: ""),
        BottomNavigationBarItem(
            icon: (changeNavState.idx == 1)
                ? Container(
              margin:
              const EdgeInsetsDirectional.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(3, 106, 130, 0.08),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.symmetric(
                    horizontal: 8.0, vertical: 10),
                child: Row(
                  children: [
                    SvgPicture.asset('assets/svg/ic_bar_save.svg',
                        color:
                        changeNavState.idx == 1 ? active : disActive),
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
            )
                : Padding(
              padding: const EdgeInsetsDirectional.symmetric(
                  horizontal: 8.0, vertical: 10),
              child: Row(
                children: [
                  SvgPicture.asset('assets/svg/ic_bar_save.svg',
                      color:
                      changeNavState.idx == 1 ? active : disActive),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Saved",
                    style: TextStyle(
                        color:
                        changeNavState.idx == 1 ? active : disActive),
                  )
                ],
              ),
            ),
            label: ""),
        BottomNavigationBarItem(
            icon: (changeNavState.idx == 2)
                ? Container(
              margin:
              const EdgeInsetsDirectional.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(3, 106, 130, 0.08),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.symmetric(
                    vertical: 10, horizontal: 8),
                child: Row(
                  children: [
                    SvgPicture.asset('assets/svg/ic_bar_more.svg',
                        color:
                        changeNavState.idx == 2 ? active : disActive),
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
            )
                : Padding(
              padding: const EdgeInsetsDirectional.symmetric(
                  vertical: 10, horizontal: 8),
              child: Row(
                children: [
                  SvgPicture.asset('assets/svg/ic_bar_more.svg',
                      color:
                      changeNavState.idx == 2 ? active : disActive),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "More",
                    style: TextStyle(
                        color:
                        changeNavState.idx == 2 ? active : disActive),
                  )
                ],
              ),
            ),
            label: ""),
      ],
      selectedIconTheme:
      const IconThemeData(color: Color.fromRGBO(3, 106, 130, 0.08)),
      currentIndex: changeNavState.idx,
      onTap: (idx) {
        //changeNavState.idxmNav(idx);
        context.read<AppBloc>().add(GetChangeNavBottomEvents(idx: idx));
      },
    );
  }
}
