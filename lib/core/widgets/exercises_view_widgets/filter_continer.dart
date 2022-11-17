import 'package:flutter/material.dart';
import 'package:flutter_study_case/core/widgets/exercises_view_widgets/filter_type_button.dart';

class FilterContainer extends StatelessWidget {
  final model;
  const FilterContainer({
    Key? key,
    this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      height: 500,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilterTypeButton(
              viewModel: model,
              title: "muscle",
            ),
            const SizedBox(
              height: 20,
            ),
            FilterTypeButton(
              viewModel: model,
              title: "type",
            ),
          ]),
    );
  }
}
