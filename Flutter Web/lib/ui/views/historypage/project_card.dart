import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:topicdetectionweb/ui/common/app_colors.dart';
import '../home/home_viewmodel.dart';
import 'ProjectView_viewmodel.dart';

class ProjectCardHistory extends ViewModelWidget<HistorypageViewModel> {
  final HomeViewModel homeViewModel;
  final Map projectData;
  final int index;
  const ProjectCardHistory({
    Key? key,
    required this.projectData,
    required this.index,
    required this.homeViewModel,
  }) : super(key: key);

  @override
  Widget build(
    BuildContext context,
    HistorypageViewModel viewModel,
  ) {
    DateTime timestamp = (projectData['timestamp'] as Timestamp).toDate();
    String  formattedDateTime= viewModel.formatDateTime(timestamp);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 120),
            child: SizedBox(
              height: 30,
              width: 100,
              child: Text(projectData['title']),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 180),
            child: SizedBox(
              height: 40,
              width: 190,
              child: Text(
               formattedDateTime,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 120),
            child: SizedBox(
              height: 50,
              width: 100,
              child: PopupMenuButton<String>(
                itemBuilder: (context) => [
                  const PopupMenuItem<String>(
                    value: 'editProject',
                    child: Row(
                      children: [
                        Icon(
                          Icons.edit_document,
                          color: kcsliderColor,
                        ),
                        SizedBox(width: 8),
                        Text('Project Details'),
                      ],
                    ),
                  ),
                  const PopupMenuItem<String>(
                    value: 'editFile',
                    child: Row(
                      children: [
                        Icon(
                          Icons.edit_attributes,
                          color: kcsliderColor,
                        ),
                        SizedBox(width: 8),
                        Text('Add File'),
                      ],
                    ),
                  ),
                  const PopupMenuItem<String>(
                    value: 'delete',
                    child: Row(
                      children: [
                        Icon(
                          Icons.delete,
                          color: kcsliderColor,
                        ),
                        SizedBox(width: 8),
                        Text('Delete'),
                      ],
                    ),
                  ),
                ],
                onSelected: (value) {
                  if (value == 'editProject') {
                    homeViewModel.setPage(5, projectData);
                  } else if (value == 'editFile') {
                    homeViewModel.updatename("Edit Project");
                    homeViewModel.setPage(6, projectData);
                  } else if (value == 'delete') {
                    viewModel.deleteProjectDialog(projectData['id']);
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
