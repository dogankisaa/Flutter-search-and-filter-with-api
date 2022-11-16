import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../view_model/exercises_view_model.dart';

class DynamicFilterTitleDropDown extends StatelessWidget {
  final title;
  const DynamicFilterTitleDropDown({
    Key? key,
    required this.viewModel,
    this.title,
  }) : super(key: key);

  final ExercisesViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 2),
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey),
        height: 500,
        width: double.infinity,
        child: Center(
          child: Consumer<ExercisesViewModel>(
            builder: (context, value, child) => DropdownButton(
              value: title == "type"
                  ? viewModel.filterDropdownType.first
                  : viewModel.filterDropdownMuscle.first,
              style: const TextStyle(color: Colors.black),
              onChanged: (String? value) {
                viewModel.changeFilterStatus(title, context, value!);
              },
              items: title == "type"
                  ? viewModel.filterDropdownType
                      .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList()
                  : viewModel.filterDropdownMuscle
                      .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
