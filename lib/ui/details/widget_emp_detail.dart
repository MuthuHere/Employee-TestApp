import 'package:flutter/material.dart';
import 'package:silver_lake_app/ui/models/empdetails/emp_detail_response.dart';

Widget empDetail(EmpDetailResponse empDetails, Function viewTodo) {
  return ListView(
    children: <Widget>[
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20),
                    SizedBox(
                      height: 150,
                      width: 150,
                      child: Center(
                        child: Image.network(
                            'https://i0.wp.com/www.winhelponline.com/blog/wp-content/uploads/2017/12/user.png?fit=256%2C256&quality=100&ssl=1'),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      empDetails.name,
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.purple,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Text(
                      empDetails.address.suite +
                          " " +
                          empDetails.address.street +
                          " " +
                          empDetails.address.city +
                          "-" +
                          empDetails.address.zipcode,
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                    SizedBox(height: 5),
                    Text('Phone-' + empDetails.phone),
                    SizedBox(
                      height: 5,
                    ),
                    Text(empDetails.email)
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(empDetails.company.name,
              style: TextStyle(fontSize: 20.0, color: Colors.purple)),
          SizedBox(
            height: 15,
          ),
          RaisedButton(
            padding: const EdgeInsets.all(8.0),
            textColor: Colors.white,
            color: Colors.blue,
            onPressed: () => viewTodo(),
            child: new Text("View Todo"),
          )
        ],
      ),
    ],
  );
}
