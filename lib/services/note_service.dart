import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/note.dart';

class NoteService {
  final _notesCollection = FirebaseFirestore.instance.collection('notes');

  Future<List<Note>> fetchNotes(String userId) async {
    final snapshot = await _notesCollection.where('userId', isEqualTo: userId).get();
    return snapshot.docs.map((doc) => Note.fromMap(doc.id, doc.data())).toList();
  }

  Future<void> addNote(String userId, String text) async {
    await _notesCollection.add({
      'userId': userId,
      'text': text,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  Future<void> updateNote(String id, String text) async {
    await _notesCollection.doc(id).update({'text': text});
  }

  Future<void> deleteNote(String id) async {
    await _notesCollection.doc(id).delete();
  }
}
