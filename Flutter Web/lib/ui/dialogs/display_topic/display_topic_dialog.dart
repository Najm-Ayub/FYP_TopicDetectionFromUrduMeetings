import 'package:flutter/material.dart';
import 'package:topicdetectionweb/ui/common/app_colors.dart';
import 'package:topicdetectionweb/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:topicdetectionweb/ui/dialogs/display_topic/Widget/HighlightText.dart';

import 'display_topic_dialog_model.dart';

class DisplayTopicDialog extends StackedView<DisplayTopicDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const DisplayTopicDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  String cleanSummaryText(String inputText) {
    inputText = inputText.replaceAll('["', '').replaceAll(']', '');
    List<String> startRemove = ["اس میٹنگ میں", "آبوئسلی", "بیسکلی"];
    List<String> phrasesToRemove = [
      "کی گئی",
      "ہے۔",
      "ہے اور",
      " اور اس کے علاوہ",
      "کیا گیا",
      "کی گئی ہے",
      "گیا",
      "کیا گیا ہے",
      "گیا ہے"
    ];

    // Remove specified phrases and everything after "کیا گیا ہے"
    for (String phrase1 in startRemove) {
      inputText = inputText.replaceFirst(phrase1, "");
    }
    for (String phrase in phrasesToRemove) {
      int index = inputText.indexOf(phrase);
      if (index != -1) {
        inputText = inputText.substring(0, index);
      }
    }

    return inputText.trim();
  }

  @override
  Widget builder(
    BuildContext context,
    DisplayTopicDialogModel viewModel,
    Widget? child,
  ) {
    // Extract the summaries from the request data
    List<dynamic> summaries = request.data['summaries'];

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpaceLarge,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Container(),
                ),
                const Text(
                  'TOPICS',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    completer(DialogResponse(confirmed: true));
                  },
                  child: const Icon(
                    Icons.close,
                    color: kcsliderColor,
                  ),
                ),
              ],
            ),
            verticalSpaceMedium,
            if (summaries.isNotEmpty)
              // Display cleaned summaries with numbering
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: summaries.asMap().entries.map<Widget>((entry) {
                  int index = entry.key + 1;
                  dynamic summary = entry.value;
                  String cleanedSummary = cleanSummaryText(summary);
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          cleanedSummary,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        horizontalSpaceMedium,
                        Text(
                          '$index',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ],
                    ),
                  );
                }).toList(),
              )
            else
              // Display a message when there are no summaries
              const Center(
                child: Text(
                  'Text Too Short No Topic Available',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              verticalSpaceLarge,
            // Pass each cleaned summary individually to highlightText
            // for (dynamic summary in summaries)
            //   Padding(
            //     padding: const EdgeInsets.only(left: 20, right: 20),
            //     child: 
            //     highlightText(
            //       request.data['urduText'], // Pass the Urdu text
            //       cleanSummaryText(summary), // Pass each cleaned summary
            //     ),
            //   ),

           Padding(
             padding: const EdgeInsets.only(right: 20),
             child: Text(request.data['urduText'].replaceAll('۔', '\n\n'),
                            style: const TextStyle(
                              fontFamily: 'NotoNastaliqUrdu',
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.right),
           ),
          ],
        ),
      ),
    );
  }

  @override
  DisplayTopicDialogModel viewModelBuilder(BuildContext context) =>
      DisplayTopicDialogModel(
          request.data['urduText'], request.data['summaries']);
}
