import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/note_provider.dart';
import '../widgets/note_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final NoteProvider noteProvider;

  @override
  void initState() {
    super.initState();
    noteProvider = Provider.of<NoteProvider>(context, listen: false);
    noteProvider.fetchNotes().catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to load notes: $error')),
      );
    });
  }

  void _showNoteDialog({String? id, String? initialText}) {
    final controller = TextEditingController(text: initialText ?? '');

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(id == null ? 'Add Note' : 'Edit Note'),
        content: TextField(
          controller: controller,
          autofocus: true,
          decoration: const InputDecoration(hintText: 'Enter your note'),
          maxLines: null,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              final text = controller.text.trim();
              if (text.isEmpty) return;

              try {
                if (id == null) {
                  await noteProvider.addNote(text);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Note added')),
                  );
                } else {
                  await noteProvider.updateNote(id, text);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Note updated')),
                  );
                }
                Navigator.of(context).pop();
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Operation failed: $e')),
                );
              }
            },
            child: Text(id == null ? 'Add' : 'Update'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NoteProvider>(
      builder: (context, provider, _) {
        if (provider.isLoading) {
          return Scaffold(
            appBar: AppBar(title: Text('Notes')),
            body: const Center(child: CircularProgressIndicator()),
          );
        }

        return Scaffold(
          appBar: AppBar(title: const Text('Notes')),
          body: provider.notes.isEmpty
              ? const Center(
            child: Text(
              'Nothing here yet—tap ➕ to add a note.',
              style: TextStyle(fontSize: 16),
            ),
          )
              : ListView.builder(
            itemCount: provider.notes.length,
            itemBuilder: (context, index) {
              final note = provider.notes[index];
              return NoteItem(
                note: note,
                onEdit: () => _showNoteDialog(id: note.id, initialText: note.text),
                onDelete: () async {
                  try {
                    await provider.deleteNote(note.id);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Note deleted')),
                    );
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Delete failed: $e')),
                    );
                  }
                },
              );
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => _showNoteDialog(),
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
