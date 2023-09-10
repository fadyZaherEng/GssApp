import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppBarAction extends StatelessWidget {
  const AppBarAction({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
    );
  }
}
