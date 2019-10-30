class NoteModel {
  int _id;
  String _title;
  String description;
  DateTime createdDate;
  bool checkFlag;
  int fontNum;
  var fontColor;
  var noteColor;
  List<NotesCheckList> checkList;

  NoteModel(this._id, this._title,
      {this.description,
      this.createdDate,
      this.checkFlag: false,
      this.checkList,
      this.fontNum: 1,
      this.fontColor: 0xffc4d853,
      this.noteColor: 'white'});

  int get id => _id;
  String get title => _title;
  set title(String titleTxt) => _title;

  setTitle(String titleInst) {
    this._title = titleInst;
  }

  String getFontNameByIndex(int fontNum){
      if(fontNum==1){
        return 'PermanentMarker';
      } else if (fontNum == 2){
        return 'Roboto';
      } else if (fontNum == 3){
        return 'Sacramento';
      } else if (fontNum == 4){
        return 'ShadowsIntoLightTwos';
      }

      return 'PermanentMarker';

  }

  Map<String, dynamic> convertToMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = _id;
    }
    map['title'] = _title;
    map['description'] = description;
    map['fontNum'] = fontNum;

    return map;
  }

  NoteModel.convertToObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._title = map['title'];
    this.description = map['description'];
    this.fontNum = map['fontNum'];
  }
}

class NotesCheckList {
  int rowNum;
  String description;
  bool checkFlag;

  NotesCheckList(this.rowNum, this.description, [this.checkFlag]);
}
