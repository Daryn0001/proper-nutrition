import '../builders/dish_detail_page/dish_detail_page_builder.dart';
import '../builders/feed_builder.dart';
import '../dishes/dish.dart';

class CreateFeedFromJson{

  List<dynamic> feedBuild(List<Dish> dishes){
    List<dynamic> _feeds = [];

    for(Dish dish in dishes){
      String imgPath = '';
      if(dish.imagePath.startsWith('http')){
        imgPath = dish.imagePath;
      }

      else{
        imgPath = 'https://${dish.imagePath}';
        //print('imgPath: $imgPath');
      }

      _feeds.add(
          FeedBuilder(
            backgroundImg: imgPath,
            text: dish.title,
            routePage: DishDetailPageBuilder(
              title: dish.title,
              numberOfCalories: dish.numberOfCalories * 1.0,
              diets: dish.dietID,
              adviceText: dish.advice,
              imgPath: imgPath,
              cookMethod: dish.cookingMethod,
              ingredients: dish.getIngredients(),
              briefDescription: dish.description,
            ),
          )
      );

    }
    return _feeds;
  }

}