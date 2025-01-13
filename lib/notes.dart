import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class NotePage extends StatefulWidget {
  const NotePage({super.key});

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  final SupabaseClient supabase = Supabase.instance.client;

  // Stream data dari tabel "notes"
  final noteStream =
      Supabase.instance.client.from('notes').stream(primaryKey: ['id']);
  String searchQuery = ''; // State untuk query pencarian

  Future<void> createNote(String note) async {
    await supabase.from('notes').insert({'body': note});
  }

  Future<void> updateNote(int noteId, String updatedNote) async {
    await supabase.from('notes').update({'body': updatedNote}).eq("id", noteId);
  }

  Future<void> deleteNote(int noteId) async {
    await supabase.from('notes').delete().eq("id", noteId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Notes'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search notes...',
                filled: true,
                fillColor: Colors.white,
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              String noteContent = '';
              return AlertDialog(
                title: const Text("Add a note"),
                content: TextField(
                  onChanged: (value) {
                    noteContent = value;
                  },
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      createNote(noteContent);
                      if (mounted) Navigator.pop(context);
                    },
                    child: const Text('Save'),
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder(
        stream: noteStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final notes = (snapshot.data as List<dynamic>)
              .where((note) => note['body']
                  .toString()
                  .toLowerCase()
                  .contains(searchQuery.toLowerCase()))
              .toList();

          if (notes.isEmpty) {
            return const Center(child: Text('No notes found.'));
          }

          return ListView.builder(
            itemCount: notes.length,
            itemBuilder: (context, index) {
              final note = notes[index];
              final noteId = note['id'] as int;

              return Card(
                color: Colors.white,
                elevation: 2,
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: ListTile(
                  title: Text(note['body']),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              String updatedNoteContent = note['body'];
                              return AlertDialog(
                                title: const Text("Edit a note"),
                                content: TextField(
                                  controller: TextEditingController(
                                      text: updatedNoteContent),
                                  onChanged: (value) {
                                    updatedNoteContent = value;
                                  },
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      updateNote(noteId, updatedNoteContent);
                                      if (mounted) Navigator.pop(context);
                                    },
                                    child: const Text('Save'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        icon: const Icon(Icons.edit),
                      ),
                      IconButton(
                        onPressed: () async {
                          bool deleteConfirmed = await showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text("Delete note"),
                                content: const Text(
                                    "Are you sure you want to delete this note?"),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context, false);
                                    },
                                    child: const Text("Cancel"),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context, true);
                                    },
                                    child: const Text("Delete"),
                                  ),
                                ],
                              );
                            },
                          );

                          if (deleteConfirmed) {
                            await deleteNote(noteId);
                          }
                        },
                        icon: const Icon(Icons.delete),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
