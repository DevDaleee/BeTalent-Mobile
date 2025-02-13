import 'package:betalent/data/models/employers.dart';
import 'package:flutter/material.dart';

class EmployeesList extends StatelessWidget {
  final List<EmployersModel> employees;
  final bool expanded;

  const EmployeesList(
      {super.key, required this.employees, required this.expanded});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Funcionários',
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        SearchBar(
          hintText: "Pesquisar",
          leading: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Icon(Icons.search),
          ),
          hintStyle: WidgetStatePropertyAll(
            TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          elevation: WidgetStatePropertyAll(0),
        ),
        Column(
          children: [
            Container(
              height: 40,
              decoration: BoxDecoration(
                color: Color(0xFFEDEFFB),
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(5),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      spacing: 40,
                      children: [
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
                      child: SizedBox(),
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
                physics: NeverScrollableScrollPhysics(),
                itemCount: employees.length,
                itemBuilder: (context, index) {
                  final employer = employees[index];
                  return Container(
                    padding: EdgeInsets.all(8),
                    height: 70,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).colorScheme.surface,
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              spacing: 40,
                              children: [
                                Center(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color:
                                          Theme.of(context).colorScheme.surface,
                                      shape: BoxShape.circle,
                                    ),
                                    width: 45,
                                    height: 45,
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(10000),
                                      child: Image.network(
                                        employer.profileImageUrl!,
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  employer.name!,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            Icon(
                              expanded == false
                                  ? Icons.keyboard_arrow_down_outlined
                                  : Icons.keyboard_arrow_up,
                              size: 30,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
