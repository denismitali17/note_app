import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/note.dart';
import '../services/note_service.dart';

class NoteProvider extends ChangeNotifier {
  final NoteService _noteService = NoteService();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  List<Note> _notes = [];
  bool _isLoading = false;

  List<Note> get notes => _notes;
  bool get isLoading => _isLoading;

  Future<void> fetchNotes() async {
    _isLoading = true;
    notifyListeners();

    try {
      final user = _auth.currentUser;
      if (user == null) throw Exception('User not logged in');
      _notes = await _noteService.fetchNotes(user.uid);
    } catch (e) {
      _notes = [];
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> addNote(String text) async {
    final user = _auth.currentUser;
    if (user == null) throw Exception('User not logged in');
    await _noteService.addNote(user.uid, text);
    await fetchNotes();
  }

  Future<void> updateNote(String id, String text) async {
    await _noteService.updateNote(id, text);
    await fetchNotes();
  }

  Future<void> deleteNote(String id) async {
    await _noteService.deleteNote(id);
    await fetchNotes();
  }
}
