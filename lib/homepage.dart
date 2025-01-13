import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uas_miftakhul/notes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  late double height, width;
  // final supabase = Supabase.instance.client;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        color: Colors.indigo,
        width: width,
        height: height,
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(),
              height: height * 0.25,
              width: width,
              child: Column(
                children: [
                  // Padding(
                  //   padding: const EdgeInsets.only(
                  //     top: 50,
                  //     left: 15,
                  //     right: 15,
                  //   ),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       // InkWell(
                  //       //   onTap: () {},
                  //       //   child: const Icon(
                  //       //     Icons.sort,
                  //       //     color: Colors.white,
                  //       //     size: 40,
                  //       //   ),
                  //       // ),
                  //       InkWell(
                  //         onTap: () {
                  //           Navigator.push(
                  //               context,
                  //               MaterialPageRoute(
                  //                   builder: (context) =>
                  //                       profile())); // Tambahkan aksi yang ingin dilakukan ketika foto profil ditekan
                  //         },
                  //         child: Container(
                  //           height: 35,
                  //           width: 35,
                  //           decoration: BoxDecoration(
                  //             borderRadius: BorderRadius.circular(35),
                  //             color: Colors.white,
                  //           ),
                  //           child: Icon(
                  //             Icons.person,
                  //             color: Colors.blue,
                  //             size: 35,
                  //           ),
                  //         ),
                  //       )
                  //     ],
                  //   ),
                  // ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 80,
                      right: 50,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Dashboard",
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 1,
                          ),
                        ),
                        Text(
                          "Welcome Back Miftakhul",
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                            letterSpacing: 1,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: ListView(
                  children: [
                    Card(
                      shadowColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: const EdgeInsets.all(20),
                      child: Container(
                        height: 150, // Ubah tinggi sesuai kebutuhan Anda
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NotePage(),
                              ),
                            );
                          },
                          splashColor: Colors.blue,
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: const <Widget>[
                                Icon(Icons.notes), // Contoh widget dalam card
                                Text(
                                    'Add Your Note'), // Contoh widget dalam card
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(top: 30, left: 9),
                    //   child: Text(
                    //     'notes terakhir dibuat',
                    //     style: TextStyle(
                    //       fontSize: 20,
                    //       fontWeight: FontWeight.bold,
                    //     ),
                    //   ),
                    // ),
                    // ListView.builder(
                    //   physics: NeverScrollableScrollPhysics(),
                    //   shrinkWrap: true,
                    //   itemCount: 10, // Jumlah item dalam daftar
                    //   itemBuilder: (context, index) {
                    //     return ListTile(
                    //       contentPadding:
                    //           EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    //       title: Text('Uas ${index + 1}'),
                    //       subtitle: Text('Uas Mobile '),
                    //       onTap: () {
                    //         // Tambahkan aksi ketika item daftar diklik
                    //       },
                    //     );
                    //   },
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}






//import 'package:flutter/material.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   State<HomePage> createState() => HomePageState();
// }

// class HomePageState extends State<HomePage> {
//   late double height, width;

//   // List untuk menyimpan catatan
//   List<Map<String, String>> notes = [];

//   // Tambahkan Note
//   void _addNote(String title, String description) {
//     setState(() {
//       notes.add({'title': title, 'description': description});
//     });
//   }

//   // Edit Note
//   void _editNote(int index, String newTitle, String newDescription) {
//     setState(() {
//       notes[index] = {'title': newTitle, 'description': newDescription};
//     });
//   }

//   // Hapus Note
//   void _deleteNote(int index) {
//     setState(() {
//       notes.removeAt(index);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     height = MediaQuery.of(context).size.height;
//     width = MediaQuery.of(context).size.width;

//     return Scaffold(
//       body: Container(
//         color: Colors.indigo,
//         width: width,
//         height: height,
//         child: Column(
//           children: [
//             // Header
//             Container(
//               height: height * 0.25,
//               width: width,
//               child: Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(
//                       top: 50,
//                       left: 15,
//                       right: 15,
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         InkWell(
//                           onTap: () {
//                             // Profil tap action
//                           },
//                           child: Container(
//                             height: 35,
//                             width: 35,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(35),
//                               color: Colors.white,
//                             ),
//                             child: Icon(
//                               Icons.person,
//                               color: Colors.blue,
//                               size: 35,
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(
//                       top: 40,
//                       right: 60,
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Dashboard",
//                           style: TextStyle(
//                             fontSize: 25,
//                             color: Colors.white,
//                             fontWeight: FontWeight.w800,
//                             letterSpacing: 1,
//                           ),
//                         ),
//                         Text(
//                           "Welcome Back",
//                           style: TextStyle(
//                             fontSize: 17,
//                             color: Colors.white,
//                             letterSpacing: 1,
//                           ),
//                         )
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ),

//             // Body
//             Expanded(
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(30),
//                     topRight: Radius.circular(30),
//                   ),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     children: [
//                       // List Notes
//                       Expanded(
//                         child: notes.isEmpty
//                             ? Center(
//                                 child: Text(
//                                   "Belum ada catatan.",
//                                   style: TextStyle(fontSize: 16),
//                                 ),
//                               )
//                             : ListView.builder(
//                                 itemCount: notes.length,
//                                 itemBuilder: (context, index) {
//                                   final note = notes[index];
//                                   return Card(
//                                     child: ListTile(
//                                       title: Text(note['title'] ?? ""),
//                                       subtitle: Text(note['description'] ?? ""),
//                                       trailing: Row(
//                                         mainAxisSize: MainAxisSize.min,
//                                         children: [
//                                           IconButton(
//                                             icon: Icon(Icons.edit),
//                                             onPressed: () {
//                                               _showNoteDialog(
//                                                   index: index,
//                                                   existingTitle:
//                                                       note['title'] ?? "",
//                                                   existingDescription:
//                                                       note['description'] ??
//                                                           "");
//                                             },
//                                           ),
//                                           IconButton(
//                                             icon: Icon(Icons.delete),
//                                             onPressed: () {
//                                               _deleteNote(index);
//                                             },
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   );
//                                 },
//                               ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),

//       // Tombol tambah note di pojok kanan bawah
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           _showNoteDialog();
//         },
//         child: Icon(Icons.add),
//         backgroundColor: Colors.blue,
//       ),
//     );
//   }

//   // Dialog untuk Tambah/Edit Note
//   void _showNoteDialog(
//       {int? index, String? existingTitle, String? existingDescription}) {
//     final titleController = TextEditingController(text: existingTitle ?? "");
//     final descriptionController =
//         TextEditingController(text: existingDescription ?? "");

//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text(index == null ? "Tambah Note" : "Edit Note"),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               TextField(
//                 controller: titleController,
//                 decoration: InputDecoration(labelText: "Judul"),
//               ),
//               TextField(
//                 controller: descriptionController,
//                 decoration: InputDecoration(labelText: "Deskripsi"),
//               ),
//             ],
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child: Text("Batal"),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 final title = titleController.text;
//                 final description = descriptionController.text;

//                 if (index == null) {
//                   _addNote(title, description);
//                 } else {
//                   _editNote(index, title, description);
//                 }

//                 Navigator.pop(context);
//               },
//               child: Text("Simpan"),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
