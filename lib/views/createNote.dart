import 'package:flutter/material.dart';
import 'package:quick_note/model/NoteModel.dart';

class CreateNote extends StatefulWidget {
  final NoteModel _currentNote;

  CreateNote(this._currentNote);

  @override
  State<StatefulWidget> createState() => _CreateNoteState(this._currentNote);
}

class _CreateNoteState extends State<CreateNote> {
  NoteModel currentNote;

  _CreateNoteState(this.currentNote);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(currentNote.title != null ? currentNote.title : "New Note"),
      ),
      body:  Container(
        child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 32.0,
            ),
            child: Column(
              children: <Widget>[
                /* TextField(
                  controller: TextEditingController()..text = currentNote.title,
                  style: TextStyle(fontSize: 20,color: Color(currentNote.fontColor),
                    fontFamily: currentNote.fontNum == 1 ? 'PermanentMarker' : 'Roboto'),
                  
                  onSubmitted: (String titleTxt) {
                    currentNote.title = titleTxt;
                  },
                ),
                Expanded(
                  child: TextField(
                     controller: TextEditingController()..text = currentNote.description,
                    maxLines: 10,
                    style: TextStyle(fontSize: 20,color: Color(currentNote.fontColor),
                    fontFamily: currentNote.fontNum == 1 ? 'PermanentMarker' : 'Roboto'),
                    onSubmitted: (String descTxt) {
                      currentNote.description = descTxt;
                    },
                  ),
                ), */
              

              


              ],
            )),
      ),
    );
  }
}
