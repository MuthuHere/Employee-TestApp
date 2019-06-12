import 'package:flutter/material.dart';
import 'package:silver_lake_app/ui/models/todo/todo_response.dart';

Widget empTodoListView(List<EmpTodoDetailResponse> list, BuildContext context) {
  return ListView.builder(
    itemCount: list.length,
    itemBuilder: (context, index) {
      return Card(
        child: ListTile(
          title: Text(
            '${list[index].title}',
            style: TextStyle(fontSize: 18.0),
          ),
          trailing: list[index].completed
              ? Text('Completed',
                  style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.green,
                      fontWeight: FontWeight.bold))
              : Text(
                  'Pending',
                  style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.redAccent,
                      fontWeight: FontWeight.bold),
                ),
        ),
      );
    },
  );
}
