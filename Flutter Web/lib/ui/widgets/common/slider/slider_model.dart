import 'package:stacked/stacked.dart';

class SliderModel extends BaseViewModel {
  int currentCarouselIndex = 0;

  void updateindex(index) {
    currentCarouselIndex = index;
    notifyListeners();
  }
}
