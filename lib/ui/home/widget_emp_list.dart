import 'package:flutter/material.dart';
import 'package:silver_lake_app/ui/models/listofemp/list_of_emp_response.dart';

Widget employeeList(List<EmployeeResponseModel> list, BuildContext context,
    Function onItemTapped) {
  return ListView.separated(
    separatorBuilder: (context, index) => Divider(
          color: Colors.grey,
          height: 5.0,
        ),
    itemCount: list.length,
    itemBuilder: (context, index) {
      return ListTile(
        title: Text(
          '${list[index].name}',
          style: TextStyle(fontSize: 18.0),
        ),
        subtitle:
            Text('${list[index].email}', style: TextStyle(fontSize: 15.0)),
        onTap: () => onItemTapped(list[index].id,list[index].name),
      );
    },
  );
}
