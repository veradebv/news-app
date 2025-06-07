import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<String> todoList = [];

  final TextEditingController _controller = TextEditingController();

  int updatedIndex = -1;

  addList(String task) {  
    setState(() {
      todoList.add(task);
      _controller.clear();
    });
  }

  updateListItem(String task, int index) {
    setState(() {
      todoList[index] = task;

      updatedIndex = -1;
      _controller.clear();
    });
  }

  deleteItem(index) {
    setState(() {
      todoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Todo Application",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              flex: 90,
              child: ListView.builder(
                itemCount: todoList.length,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)
                    ),
                    color: Colors.green,
                    child: Container(
                      margin: EdgeInsets.only(left: 20),
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 80,
                            child: Text(todoList[index],
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                            ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  _controller.clear();
                                  _controller.text = todoList[index];
                                  updatedIndex = index;
                                });
                              } ,
                              icon: Icon(
                                Icons.edit,
                                size: 30,
                                color: Colors.white,
                              )
                            ),
                            SizedBox(width: 10),

                            // Delete button
                            IconButton(
                              onPressed: () {
                                deleteItem(index);
                            }, 
                            icon: Icon(
                            Icons.delete,
                            size: 30,
                            color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
              Expanded(
                flex: 10,
                child: Row(
                  children: [
                    Expanded(
                      flex: 10,
                      child: SizedBox(
                        height: 60,
                        child: TextFormField(
                          // Input field controller
                          controller: _controller,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: Colors.green,
                                )),
                            filled: true,

                              // Placeholder text
                              labelText: 'Create Task...',
                              labelStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 5),

                      // Floating action button for adding/updating tasks
                      FloatingActionButton(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        onPressed: () {
                          // Guard for an empty input
                          if (_controller.text.trim().isEmpty) return;

                          updatedIndex != -1
                          ? updateListItem(_controller.text, updatedIndex) : addList(_controller.text);
                        },
                        child: Icon(updatedIndex != -1 ? Icons.edit : Icons.add),
                        ),
                  ],
                )
            )
          ],
        ),
      ),
    );
  }
}