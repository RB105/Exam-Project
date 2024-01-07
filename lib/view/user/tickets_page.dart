import 'package:exam_project/model/recommendations_model.dart';
import 'package:flutter/material.dart';

class TicketsPage extends StatelessWidget {
  final RecommedationsModel recommedationsModel;
  const TicketsPage({super.key, required this.recommedationsModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "${recommedationsModel.search.segments[0].from.name} - ${recommedationsModel.search.segments[0].to.name}"),
      ),
    );
  }
}
