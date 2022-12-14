import 'package:flutter/material.dart';
import 'package:flutter_study_case/core/widgets/exercises_view_widgets/filter_continer.dart';

import '../../../view_model/exercises_view_model.dart';
import '../../helper/modal_sheet.dart';

class CustomSearchAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final ExercisesViewModel viewModel;
  const CustomSearchAppBar({
    Key? key,
    required this.viewModel,
  }) : super(key: key);
  @override
  Size get preferredSize => const Size.fromHeight(90);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 90,
      title: TextFormField(
        controller: viewModel.searchInputController,
        onEditingComplete: () => viewModel.searchExercise(),
        decoration: InputDecoration(
          hintText: "Search",
          contentPadding: const EdgeInsets.only(left: 30.0),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50.0),
              borderSide: BorderSide.none),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: InkWell(
            onTap: () => viewModel.clearFilteredLists(),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Center(
                  child: Icon(
                Icons.close,
                color: Colors.black,
              )),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: InkWell(
            onTap: () => bottomSheet(
                context,
                viewModel,
                FilterContainer(
                  model: viewModel,
                )),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Center(
                child: SizedBox(
                    height: 20,
                    width: 20,
                    child: Image.asset("assets/icon/filter.png")),
              ),
            ),
          ),
        )
      ],
      elevation: 0,
    );
  }
}
