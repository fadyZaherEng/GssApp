import 'package:flutter/material.dart';
import 'package:gss/presentation/widgets/custom_text_filed_widget.dart';

class AppBarTitle extends StatelessWidget {
  AppBarTitle({super.key});

  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color.fromRGBO(255, 255, 255, 1),
      ),
      margin: const EdgeInsetsDirectional.symmetric(horizontal: 10),
      height: 55,
      width: MediaQuery
          .sizeOf(context)
          .width,
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
    );
  }
}
