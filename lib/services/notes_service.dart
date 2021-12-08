import 'package:Notes/services/services.dart';
import 'package:Notes/models/models.dart';

class NotesService {
  static saveNoteLocally(Note note) {
    Global.boxes[BOX_NAME.NOTES_BOX]!.put(note.id, note);
  }

  static deleteNoteLocally(String id) {
    Global.boxes[BOX_NAME.NOTES_BOX]!.delete(id);
  }

}
