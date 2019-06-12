import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:silver_lake_app/ui/details/widget_emp_detail.dart';
import 'package:silver_lake_app/ui/models/empdetails/emp_detail_response.dart';
import 'package:silver_lake_app/ui/todo/todo_page.dart';
import 'package:silver_lake_app/utils/widget_loading_indicator.dart';

class EmployeeDetailPage extends StatefulWidget {
  final int empID;
  final String empName;

  EmployeeDetailPage(this.empID, this.empName);

  @override
  State<StatefulWidget> createState() {
    return _EmployeeDetailState();
  }
}

class _EmployeeDetailState extends State<EmployeeDetailPage> {
  bool _isLoading = false;
  EmpDetailResponse _empDetailResponse;

  @override
  void initState() {
    _loadEmpByID(widget.empID);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.empName),
      ),
      body: Center(
          child: _isLoading
              ? loadingIndicator()
              : Center(
                  child: empDetail(_empDetailResponse, _viewTodo),
                )),
    );
  }

  void _viewTodo() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TodoPage(widget.empID,widget.empName),
      ),
    );

  }

  void _loadEmpByID(int empID) async {
    setLoadingState(true);

    final responseEmpDetail = await http
        .get('https://jsonplaceholder.typicode.com/users/' + empID.toString());

    if (responseEmpDetail.statusCode == 200) {
      print(responseEmpDetail.toString());

      _empDetailResponse =
          empDetailResponseFromJson(responseEmpDetail.body.toString());
      return setState(() {
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
