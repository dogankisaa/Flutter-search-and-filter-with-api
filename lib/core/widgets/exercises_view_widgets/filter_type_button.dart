import 'package:flutter/material.dart';
import 'package:flutter_study_case/core/helper/modal_sheet.dart';

import '../../../view_model/exercises_view_model.dart';
import 'filter_type_drop_down.dart';

class FilterTypeButton extends StatelessWidget {
  final title;

  const FilterTypeButton({
    Key? key,
    required this.viewModel,
    this.title,
  }) : super(key: key);

  final ExercisesViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        Navigator.pop(context);
        bottomSheet(
            context,
            viewModel,
            Align(
              alignment: Alignment.center,
              child: DynamicFilterTitleDropDown(
                viewModel: viewModel,
                title: title,
              ),
            ));
      },
      child: Container(
        width: 250,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey, width: 2)),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(color: Colors.grey),
            ),
          ),
        ),
      ),
    );
  }
}
