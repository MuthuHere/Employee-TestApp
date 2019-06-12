import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:silver_lake_app/ui/details/emp_detail_page.dart';
import 'package:silver_lake_app/ui/home/widget_emp_list.dart';
import 'package:silver_lake_app/ui/models/listofemp/list_of_emp_response.dart';
import 'package:silver_lake_app/utils/widget_loading_indicator.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  bool _isLoading = false;

  List<EmployeeResponseModel> _empList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.light,
        ),
        home: new Scaffold(
            appBar: AppBar(
              title: Text('Employee List'),
            ),
            body: Center(
                child: _isLoading
                    ? loadingIndicator()
                    : employeeList(_empList, context, onItemTapped))),
      ),
    );
  }

  //on tap from user list
  void onItemTapped(int userID, String empName) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EmployeeDetailPage(userID, empName),
      ),
    );
  }

  @override
  void initState() {
    _loadEmpList();
    super.initState();
  }

  void _loadEmpList() async {
    setLoadingState(true);

    final responseListOfEmp =
        await http.get('https://jsonplaceholder.typicode.com/users');

    if (responseListOfEmp.statusCode == 200) {
      print(responseListOfEmp.toString());
      return setState(() {
        _empList = welcomeFromJson(responseListOfEmp.body.toString());

        setLoadingState(false);
      });
    }
  }

  void setLoadingState(bool isLoading) {
    setState(() {
      _isLoading = isLoading;
    });
  }
}
