import 'package:betalent/data/models/employers.dart';
import 'package:betalent/features/components/employe_view.dart';
import 'package:flutter/material.dart';

class EmployeesList extends StatefulWidget {
  final List<EmployersModel> employees;

  const EmployeesList({
    super.key,
    required this.employees,
  });

  @override
  State<EmployeesList> createState() => _EmployeesListState();
}

class _EmployeesListState extends State<EmployeesList> {
  final TextEditingController _searchController = TextEditingController();
  List<EmployersModel> _filteredEmployees = [];

  @override
  void initState() {
    super.initState();
    _filteredEmployees = widget.employees;
    _searchController.addListener(_filterEmployees);
  }

  void _filterEmployees() {
    final query = _searchController.text.toLowerCase();

    setState(() {
      _filteredEmployees = widget.employees.where((employee) {
        return employee.name!.toLowerCase().contains(query) ||
            employee.role!.toLowerCase().contains(query) ||
            employee.phone!.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Column(
        spacing: 20,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Funcionários',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          SearchBar(
            controller:
                _searchController, // Adicionado controller para capturar input
            hintText: "Pesquisar",
            leading: const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Icon(Icons.search),
            ),
            hintStyle: const WidgetStatePropertyAll(
              TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
            elevation: const WidgetStatePropertyAll(0),
          ),
          Column(
            children: [
              Container(
                height: 40,
                decoration: const BoxDecoration(
                  color: Color(0xFFEDEFFB),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(5)),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        spacing: 40,
                        children: const [
                          Text(
                            'Foto',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'Nome',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 8,
                        width: 8,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const SizedBox(),
                      ),
                    ],
                  ),
                ),
              ),
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.9,
                ),
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _filteredEmployees.length,
                  itemBuilder: (context, index) {
                    final employer = _filteredEmployees[index];
                    return EmployeView(
                      employe: employer,
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
