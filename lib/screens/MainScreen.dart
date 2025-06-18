import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newsapp/models/menu_item.dart';
import 'package:newsapp/screens/AddMenuScreen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Future<List<MenuItem>> fetchMenus() async {
    final response = await http.get(Uri.parse('http://192.168.21.190:3000/menus'));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((item) => MenuItem.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load menu items');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Folders"),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
      ),
      body: FutureBuilder<List<MenuItem>>(
        future: fetchMenus(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error loading menu items'));
          } else {
            final menus = snapshot.data!;
            return ListView(
              padding: const EdgeInsets.all(16),
              children: [
                // Static Add Folder Card
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddMenuScreen()),
                    );
                  },
                  child: Card(
                    color: Colors.teal.shade100,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Icon(Icons.create_new_folder, size: 40, color: Colors.teal[900]),
                          SizedBox(width: 16),
                          Text(
                            "Add New Folder",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.teal[900],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // API-loaded Menu Cards
                ...menus.map((menu) {
                  return Card(
                    margin: const EdgeInsets.only(top: 16),
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              menu.image,
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  Icon(Icons.image_not_supported, size: 80),
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  menu.title,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  menu.total?.toString() ?? "No description available",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[700],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ],
            );
          }
        },
      ),
    );
  }
}
