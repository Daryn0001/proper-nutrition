import '../dishes/dish.dart';
import 'createFeedFromJson.dart';
import 'json_decoder.dart';

class FeedConstructor {
  final String jsonPath;
  final CreateFeedFromJson _createFeedFromJson = CreateFeedFromJson();
  final JSONDecoder _decoder = JSONDecoder();

  FeedConstructor({required this.jsonPath});

  List<dynamic> getFeeds() {
    List<dynamic> feeds = [];
    List<Dish> dishes = [];
    dishes = _decoder.getDishes(jsonPath);
    if(dishes.isNotEmpty) {
      feeds = _createFeedFromJson.feedBuild(dishes);
    }

    return feeds;
  }
}
