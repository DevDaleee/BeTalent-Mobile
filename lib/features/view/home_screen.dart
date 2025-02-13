import 'package:betalent/features/components/employees_list.dart';
import 'package:betalent/features/viewmodel/employees_view_model.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final EmployeesViewModel viewModel = EmployeesViewModel();

  @override
  Widget build(BuildContext context) {
    bool isExpanded = false;
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Icon(Icons.notifications_outlined),
          ),
        ],
        leading: Row(
          children: [
            SizedBox(
              width: 11,
            ),
            Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  'CG',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
      body: FutureBuilder(
        future: viewModel.loadUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Erro: ${snapshot.error}'),
            );
          } else {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        EmployeesList(
                          employees: viewModel.employees,
                        ),
                        if (isExpanded == true)
                          SizedBox(
                            height: 150,
                            child: Column(
                              children: [
                                Row(
                                  children: [],
                                ),
                                Row(
                                  children: [],
                                ),
                                Row(
                                  children: [],
                                )
                              ],
                            ),
                          )
                      ],
                    ),
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
