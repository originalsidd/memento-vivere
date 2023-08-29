import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/model/note.dart';
import 'package:flutter_application_1/src/res/strings.dart';
import 'package:flutter_application_1/src/services/local_db.dart';
import 'package:flutter_application_1/src/views/create_new.dart';
import 'package:flutter_application_1/src/views/widgets/empty_view.dart';
import 'package:flutter_application_1/src/views/widgets/note_list.dart';
import 'package:flutter_application_1/src/views/widgets/notes_grid.dart';
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
            // const EmptyView(),
            StreamBuilder<List<Note>>(
                stream: LocalDBService().listenAllNotes(),
                builder: (context, snapshot) {
                  if (snapshot.data == null) {
                    return const EmptyView();
                  }
                  final notes = snapshot.data!;
                  // return Expanded(
                  //     child: isListView
                  //         ? NotesList(notes: notes)
                  //         : NotesGrid(notes: notes));
                  return Expanded(
                    child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        child: isListView
                            ? NotesList(notes: notes)
                            : NotesGrid(notes: notes)),
                  );
                })
          ]),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => CreateNoteView()));
          },
          backgroundColor: Colors.white,
          child: const Icon(Icons.add, color: Colors.grey),
        ));
  }
}
