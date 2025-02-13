import 'package:betalent/data/models/employers.dart';
import 'package:flutter/material.dart';

class MoreInfos extends StatelessWidget {
  final EmployersModel employeInfos;
  const MoreInfos({super.key, required this.employeInfos});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.symmetric(),
          ),
        )
      ],
    );
  }
}
