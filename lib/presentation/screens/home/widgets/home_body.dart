// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeBody extends StatelessWidget {
  List<dynamic> options = [
    'assets/svg/ic_filter.svg',
    'Buy',
    'Property Type',
    'Beds',
    'Price'
  ];
   @override
  Widget build(BuildContext context) {
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
                  return getIconTheme(options[idx]);
                },
                separatorBuilder: (context, idx) {
                  return const SizedBox(
                    width: 15,
                  );
                },
                itemCount: options.length),
          ),
          const SizedBox(
            height: 8,
          ),
        ],
      ),
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
}
