// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gss/domain/models/tower.dart';
import 'package:gss/presentation/blocs/home/home_states.dart';
import 'package:gss/presentation/screens/home/widgets/home_list.dart';

class HomeBody extends StatelessWidget {

  List<TowerModel>towers;

  HomeBody({required this.towers});

  @override
  Widget build(BuildContext context) {
    List<dynamic> _options = [
      'assets/svg/ic_filter.svg',
      'Buy',
      'Property Type',
      'Beds',
      'Price'
    ];
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          SizedBox(
            height: 45,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, idx) {
                  if (idx == 0) {
                    return InkWell(
                      onTap: () {},
                      child: Container(
                        width: 44,
                        height: 36,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(36)),
                        ),
                        child: Center(
                            child:
                            SvgPicture.asset('assets/svg/ic_filter.svg')),
                      ),
                    );
                  }
                  return _getIconTheme(_options[idx]);
                },
                separatorBuilder: (context, idx) {
                  return const SizedBox(
                    width: 15,
                  );
                },
                itemCount: _options.length),
          ),
          const SizedBox(
            height: 8,
          ),
          HomeList(towers:towers),
        ],
      ),
    );
  }
  Widget _getIconTheme(String data) {
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
}
