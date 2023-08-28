import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/res/strings.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isListView = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.appname,
                style: GoogleFonts.poppins(
                  fontSize: 24,
                ),
              ),
              IconButton(
                  onPressed: () {
                    setState(() {
                      isListView = !isListView;
                    });
                  },
                  icon: Icon(isListView
                      ? Icons.splitscreen_outlined
                      : Icons.grid_view))
            ],
          ),
        ),
      ]),
    ));
  }
}
