import 'package:flutter/material.dart';

import '../../../view_model/exercises_view_model.dart';

class CustomSearchAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final ExercisesViewModel viewModel;
  const CustomSearchAppBar({
    Key? key,
    required this.viewModel,
  }) : super(key: key);
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
          contentPadding: EdgeInsets.only(left: 30.0),
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
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: Center(
              child: SizedBox(
                  height: 20,
                  width: 20,
                  child: Image.asset("assets/icon/filter.png")),
            ),
          ),
        )
      ],
      elevation: 0,
    );
  }
}
