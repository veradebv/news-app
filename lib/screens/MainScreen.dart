import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newsapp/constant/material.dart';
import 'package:newsapp/models/menu_item.dart';

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
        title: Text("Menu Cards"),
        backgroundColor: Color(0xFF138880),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: List.generate(4, (index) {
              return FutureBuilder<List<MenuItem>>(
                future: fetchMenus(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Center(child: CircularProgressIndicator()),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text('Error loading menu'),
                      ),
                    );
                  } else {
                    final menus = snapshot.data!;
                    return Column(
                      children: menus.map((menu) {
                        return Card(
                          margin: const EdgeInsets.only(bottom: 16),
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ListTile(
                            leading: Image.network(
                              menu.image,
                              width: 50,
                              height: 50,
                              errorBuilder: (context, error, stackTrace) =>
                                  Icon(Icons.image_not_supported),
                            ),
                            title: Text(menu.title),
                          ),
                        );
                      }).toList(),
                    );
                  }
                },
              );
            }),
          ),
        ),
      ),
    );
  }
}
