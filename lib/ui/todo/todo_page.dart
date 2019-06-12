import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:silver_lake_app/ui/todo/todo_list_widget.dart';
import 'package:silver_lake_app/ui/models/todo/todo_response.dart';
import 'package:silver_lake_app/utils/widget_loading_indicator.dart';

class TodoPage extends StatefulWidget {
  final int empID;
  final String empName;

  TodoPage(this.empID, this.empName);

  @override
  State<StatefulWidget> createState() {
    return _TodoState();
  }
}

class _TodoState extends State<TodoPage> {
  List<EmpTodoDetailResponse> _empTodoListResponse;
  bool _isLoading;

  @override
  void initState() {
    _loadTodoByID(widget.empID);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.empName),
      ),
      body: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.light,
        ),
        home: new Scaffold(

            body: Center(
                child: _isLoading
                    ? loadingIndicator()
                    : empTodoListView(_empTodoListResponse, context))),
      ),
    );
  }

  void _loadTodoByID(int empID) async {
    setLoadingState(true);

    final responseTodo = await http
        .get('https://jsonplaceholder.typicode.com/todos?userId=' + empID.toString());

    if (responseTodo.statusCode == 200) {


      return setState(() {
        _empTodoListResponse =
            empTodoDetailResponseFromJson(responseTodo.body.toString());

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
