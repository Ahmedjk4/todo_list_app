import 'package:flutter/material.dart';
import 'custom_app_bar.dart';
import 'todo_list_view_builder.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: CustomAppBar()),
        TodoListViewBuilder(),
      ],
    );
  }
}
