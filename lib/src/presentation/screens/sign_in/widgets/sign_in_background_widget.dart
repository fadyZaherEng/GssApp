import 'package:flutter/material.dart';

class SignInBackgroundWidget extends StatelessWidget {
  const SignInBackgroundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Image(
      alignment: AlignmentDirectional.bottomCenter,
      isAntiAlias: false,
      matchTextDirection: true,
      gaplessPlayback: true,
      image: const AssetImage('assets/png/group.png'),
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
      fit: BoxFit.fitWidth,
    );
  }
}
