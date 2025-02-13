import 'package:betalent/data/models/employers.dart';
import 'package:flutter/material.dart';

class EmployeView extends StatefulWidget {
  final EmployersModel employe;
  const EmployeView({
    super.key,
    required this.employe,
  });

  @override
  State<EmployeView> createState() => _EmployeViewState();
}

class _EmployeViewState extends State<EmployeView> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        height: isExpanded == true ? 180 : 63,
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
                          color: Theme.of(context).colorScheme.surface,
                          shape: BoxShape.circle,
                        ),
                        width: 45,
                        height: 45,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10000),
                          child: Image.network(
                            widget.employe.profileImageUrl!,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      widget.employe.name!,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                Icon(
                  isExpanded == true
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  size: 30,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ],
            ),
            if (isExpanded == true)
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Column(
                  spacing: 10,
                  children: [
                    _buildMoreInfos(
                      'Cargo',
                      widget.employe.role!,
                    ),
                    _buildMoreInfos(
                      'Data de admissão',
                      widget.employe.addmissionDate!,
                    ),
                    _buildMoreInfos(
                      'telefone',
                      widget.employe.phone!,
                    )
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }

  Widget _buildMoreInfos(String leftLabel, String rightLabel) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 0.1,
            style: BorderStyle.values[1],
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            leftLabel,
            style: TextStyle(color: Colors.black, fontSize: 14),
          ),
          Text(
            rightLabel,
            style: TextStyle(color: Colors.black, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
