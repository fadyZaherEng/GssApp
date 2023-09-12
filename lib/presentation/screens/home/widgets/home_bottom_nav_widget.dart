// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeBottomNavWidget extends StatelessWidget {
  final int homeChangeNavIdx;
  final Color _active = const Color.fromRGBO(3, 106, 130, 1);
  final Color _disActive = Colors.grey;
  void Function(int index) homeBottomNavChange;
  HomeBottomNavWidget({
    super.key,
    required this.homeChangeNavIdx,
    required this.homeBottomNavChange,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      elevation: 5,
      type: BottomNavigationBarType.fixed,
      items:homeBottomNavList(),
      selectedIconTheme: const IconThemeData(color: Color.fromRGBO(3, 106, 130, 0.08)),
      currentIndex: homeChangeNavIdx,
      onTap: homeBottomNavChange,
    );
  }

 List<BottomNavigationBarItem> homeBottomNavList() {
    return
      [
        BottomNavigationBarItem(
            icon: (homeChangeNavIdx == 0)
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
                      color: homeChangeNavIdx == 0 ? _active : _disActive,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Search",
                      style: TextStyle(
                          color: homeChangeNavIdx == 0
                              ? _active
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
                    color: homeChangeNavIdx == 0 ? _active : _disActive,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Search",
                    style: TextStyle(
                        color:
                        homeChangeNavIdx == 0 ? _active : _disActive),
                  )
                ],
              ),
            ),
            label: ""),
        BottomNavigationBarItem(
            icon: (homeChangeNavIdx == 1)
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
                        homeChangeNavIdx == 1 ? _active : _disActive),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Saved",
                      style: TextStyle(
                          color: homeChangeNavIdx == 1
                              ? _active
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
                      homeChangeNavIdx == 1 ? _active : _disActive),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Saved",
                    style: TextStyle(
                        color:
                        homeChangeNavIdx == 1 ? _active : _disActive),
                  )
                ],
              ),
            ),
            label: ""),
        BottomNavigationBarItem(
            icon: (homeChangeNavIdx == 2)
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
                        homeChangeNavIdx == 2 ? _active : _disActive),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "More",
                      style: TextStyle(
                          color: homeChangeNavIdx == 2
                              ? _active
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
                      homeChangeNavIdx == 2 ? _active : _disActive),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "More",
                    style: TextStyle(
                        color:
                        homeChangeNavIdx == 2 ? _active : _disActive),
                  )
                ],
              ),
            ),
            label: ""),
      ];
 }
}
