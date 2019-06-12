import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:silver_lake_app/ui/details/emp_detail_page.dart';
import 'package:silver_lake_app/ui/home/widget_emp_list.dart';
import 'package:silver_lake_app/ui/models/listofemp/list_of_emp_response.dart';
import 'package:silver_lake_app/utils/widget_loading_indicator.dart';

class HomePage extends StatefulWidget {
  final String EMP_LIST_API = "https://jsonplaceholder.typicode.com/users";

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

///home page is loading with all list of employees

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

  ///on tap from user list
  void onItemTapped(int userID, String empName) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EmployeeDetailPage(userID, empName),
      ),
    );
  }

  ///init state is called first
  @override
  void initState() {
    _loadEmpList();
    super.initState();
  }

  ///Loading all employee list

  void _loadEmpList() async {
    setLoadingState(true);

    final responseListOfEmp = await http.get(widget.EMP_LIST_API);

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
