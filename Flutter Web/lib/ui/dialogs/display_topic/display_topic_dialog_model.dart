import 'package:stacked/stacked.dart';

import '../../../services/display_topic_service.dart';

class DisplayTopicDialogModel extends BaseViewModel {
  DisplayTopicService displayTopicService = DisplayTopicService();
  final String urduText;
  List<dynamic> summaries;
  

  



  DisplayTopicDialogModel(this.urduText,this.summaries);
}
