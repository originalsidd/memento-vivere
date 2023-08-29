import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/res/assets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class EmptyView extends StatelessWidget {
  const EmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Lottie.asset(
        AnimationAssets.empty,
        width: 220,
        height: 220,
      ),
      Text("Things look empty here. Tap + to start",
          style: GoogleFonts.poppins(fontSize: 16)),
    ]);
  }
}
