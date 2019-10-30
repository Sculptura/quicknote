import 'dart:math';

import 'package:quick_note/model/NoteModel.dart';

class NoteService {
  static List<NoteModel> generateSampleNotes() {
    List<NotesCheckList> ncheckList = List();
    ncheckList.add(NotesCheckList(1, "Vegetables", false));
    ncheckList.add(NotesCheckList(2, "Fruits", false));
    ncheckList.add(NotesCheckList(3, "Oil", false));
    ncheckList.add(NotesCheckList(4, "Toiletries", false));

    List<NoteModel> notes = List();
    notes.add(NoteModel(1, "My first note",
        description:
            "the sky was clear. The air was thick and still. I am not going to understand. I never will",
        createdDate: DateTime.now(),
        fontColor: 0xFF00FF00));

    notes.add(NoteModel(
      3, "OSDPytxddsdhjsk-ug2w545265 ",
      description: "34567890dfghasjdlakjhgfdasghdj",
      createdDate: DateTime.now(),
      fontNum: 2,
      //fontColor: 0xFF4B0082
    ));

    notes.add(NoteModel(2, "Nightmare to remember ",
        description:
            "Hoplessly drifting... bathing in beautiful agony. I am endlessly falling... lost in this wonderful misery",
        createdDate: DateTime.now(),
        fontColor: 0xffb74093));

    notes.add(NoteModel(4, "Groceries",
        description: "There are few more things to be added...",
        createdDate: DateTime.now(),
        fontColor: 0xffccc8a1, 
        fontNum: 2
        // checkList: ncheckList)
        ));

    notes.add(NoteModel(
      2, "Thriller movies ",
      description: "Here is a list of all time popular movies",
      createdDate: DateTime.now(),
      fontColor: 0xffc4384d
    ));

    return notes;
  }

  String generateLuckyNumber() {
    Random random = Random();
    return "A just world is a sane world... with a lucky number ${random.nextInt(10)}";
  }
}
