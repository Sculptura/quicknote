import 'package:flutter/material.dart';
import 'package:quick_note/model/NoteModel.dart';
import 'package:quick_note/service/noteService.dart';
import 'package:quick_note/views/createNote.dart';

class AlphaView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AlphaViewState();
}

class _AlphaViewState extends State<AlphaView> {
  @override
  Widget build(BuildContext context) {
    return prepNotesWidgetList();
  }

  Widget prepNotesWidgetList() {
    var notesList = NoteService.generateSampleNotes();

    return ListView.builder(
        itemCount: notesList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: NoteRow(notesList[index]),
            onTap: () => showNote(notesList[index]),
          );
        });
  }

  
  showNote(NoteModel noteObject) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return CreateNote(noteObject);
        },
      ),
    );
  }

  // FOR UNDO OPERATION
  void showSnackBar(BuildContext context, NoteModel currentNote) {
    Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("${currentNote.title} selected"),
        action: SnackBarAction(label: "UNDO", onPressed: () => null)));
  }
}

class NoteRow extends StatefulWidget {
 
 final NoteModel noteObject;

  NoteRow(this.noteObject);
  @override
  State<StatefulWidget> createState() =>_NoteRowState(noteObject);
  
}

class _NoteRowState extends State<NoteRow> {
  NoteModel noteObject;

  _NoteRowState(this.noteObject);

  @override
  Widget build(BuildContext context) {
    return  Container(
          //alignment: Alignment.center,
          decoration: BoxDecoration(
              // border: Border.all(color: Colors.black12),
              //color: Colors.blueGrey[800]
              ),
          //width: 120,
          //height: 80,
          padding: EdgeInsets.all(18),
          margin: EdgeInsets.all(2),
          child: Column(
            children: <Widget>[
              Row(children: <Widget>[
                Expanded(
                  child: Text(
                    //generateLuckyNumber(),
                    noteObject.title,
                    // textDirection: TextDirection.ltr,
                    style: TextStyle(
                        color: Color(noteObject.fontColor),
                        shadows: <Shadow>[
                          Shadow(
                            offset: Offset(2.0, 2.0),
                            blurRadius: 4.0,
                            color: Color.fromARGB(255, 40, 40, 40),
                          ),
                        ],
                        fontFamily: noteObject.fontNum == 1
                            ? 'PermanentMarker'
                            : 'Roboto',
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Icon(
                  Icons.chevron_right,
                  size: 25.0,
                  color: Color(noteObject.fontColor),
                )
              ]),
              /* Text(
                DateFormat('yyyy-MM-dd').format(noteObject.createdDate),
                style: TextStyle(fontSize: 12),
              ), */
            ],
          ),
    );
  }

}




class NoteImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Image(
        image: AssetImage('images/file.png'),
        width: 35,
        height: 35,
      );
}

class AddButton extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddButtonState();
}

class _AddButtonState extends State<AddButton> {

   NoteModel note;

  //_AddButtonState(this.note);

  @override
  Widget build(BuildContext context) => FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _showCreateNote,
        tooltip: "This will open a new note window",
        //elevation: 5.0,
      );

  Future _showCreateNote() async {
    Navigator.of(context).push(
      MaterialPageRoute(
        // builder methods always take context!
        builder: (context) {
          return CreateNote(note);
        },
      ),
    );
  }

  void addNotes(BuildContext contextB) {
    showDialog(
        context: contextB,
        builder: (BuildContext context) => AlertDialog(
              title: Row(children: <Widget>[
                Icon(
                  Icons.check,
                  color: Colors.green,
                ),
                Text("Note added!")
              ]),
              content: Text("This was beyond all expectations!"),
              backgroundColor: Colors.white,
            ));
  }
}
