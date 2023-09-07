import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeFloatingWidget extends StatelessWidget {
   final BuildContext context;
   HomeFloatingWidget({required this.context,super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: FloatingActionButton.extended(
          backgroundColor: Colors.white,
          isExtended: true,
          onPressed: () {},
          label: Row(
            children: [
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
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
                    ],
                  ),
                ),
              ),
              Container(
                height: 60,
                width: .5,
                color: Colors.grey,
              ),
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
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
}
