// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gss/presentation/blocs/home/home_bloc.dart';
import 'package:gss/presentation/blocs/home/home_events.dart';

class HomeBottomNav extends StatelessWidget {
  final BuildContext context;
  final int idx;
  final Color _active = const Color.fromRGBO(3, 106, 130, 1);
  final Color _disActive = Colors.grey;
  AppBloc get bloc=> BlocProvider.of<AppBloc>(context);
  HomeBottomNav({super.key, required this.context,required this.idx});

  @override
  Widget build(BuildContext context) {
    return   BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      elevation: 5,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
            icon: (idx == 0)
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
                      color: idx == 0 ? _active : _disActive,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Search",
                      style: TextStyle(
                          color: idx == 0
                              ?_active
                              : _disActive),
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
                    color: idx == 0 ?_active : _disActive,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Search",
                    style: TextStyle(
                        color:
                        idx == 0 ?_active : _disActive),
                  )
                ],
              ),
            ),
            label: ""),
        BottomNavigationBarItem(
            icon: (idx == 1)
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
                        idx == 1 ?_active : _disActive),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Saved",
                      style: TextStyle(
                          color: idx == 1
                              ?_active
                              : _disActive),
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
                      idx == 1 ?_active : _disActive),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Saved",
                    style: TextStyle(
                        color:
                        idx == 1 ?_active : _disActive),
                  )
                ],
              ),
            ),
            label: ""),
        BottomNavigationBarItem(
            icon: (idx == 2)
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
                        idx == 2 ?_active : _disActive),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "More",
                      style: TextStyle(
                          color: idx == 2
                              ?_active
                              : _disActive),
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
                      idx == 2 ?_active : _disActive),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "More",
                    style: TextStyle(
                        color:
                        idx == 2 ?_active : _disActive),
                  )
                ],
              ),
            ),
            label: ""),
      ],
      selectedIconTheme:
      const IconThemeData(color: Color.fromRGBO(3, 106, 130, 0.08)),
      currentIndex: idx,
      onTap: (idx) {
        //idxmNav(idx);
        bloc.add(GetChangeNavBottomEvents(idx: idx));
      },
    );
  }
}
