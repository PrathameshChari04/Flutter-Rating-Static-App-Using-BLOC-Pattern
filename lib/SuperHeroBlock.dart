/// TODO: imports
import 'dart:async';
import 'SuperHero.dart';
/// TODO: List of superheros 

/// TODO: Stream Controller
/// TODO:Stream sink getter
/// TODO: Constructor - add data listen to changes
/// TODO: Corefunctions
/// TODO: dispose

class SuperHeroBlock{

  List<SuperHero> _superheroList = [

    SuperHero(1,"Batman", 100.0),
    SuperHero(2,"IronMan", 100.0),
    SuperHero(3,"Wolverine", 100.0),
    SuperHero(4,"Superman", 100.0),
    SuperHero(5,"CaptainAmerica", 100.0),
    SuperHero(6,"Thor", 100.0),
    SuperHero(7,"Hulk", 100.0),
    SuperHero(8,"Flash", 100.0),
    SuperHero(9,"Goku", 100.0),
    SuperHero(10,"Vegeta", 100.0),
  ];


  final _superHeroListStreamController  = StreamController<List<SuperHero>>();

  ///for increamnent Decrement
  final _superHeroRatingIncrementStreamController = StreamController<SuperHero>();
  final _superHeroRatingDecrementStreamController = StreamController<SuperHero>();

  ///getters
  Stream<List<SuperHero>> get superheroListStream => 
    _superHeroListStreamController.stream;

  StreamSink<List<SuperHero>> get superheroListSink =>
    _superHeroListStreamController.sink;

  StreamSink<SuperHero> get superheroRatingIncrement =>
    _superHeroRatingIncrementStreamController.sink;

  StreamSink<SuperHero> get superheroRatingDecrement =>
    _superHeroRatingDecrementStreamController.sink;


  SuperHeroBlock(){
    _superHeroListStreamController.add(_superheroList);

    _superHeroRatingIncrementStreamController.stream.listen(_incrementRating);
    _superHeroRatingDecrementStreamController.stream.listen(_decrementRating);

  }

  _incrementRating(SuperHero superhero){
      double ratings =  superhero.ratings;

      double incrementRating = ratings * 10/100;

      _superheroList[superhero.id -1].ratings = ratings + incrementRating ;

      superheroListSink.add(_superheroList);


  }
  _decrementRating(SuperHero superhero){
      double ratings =  superhero.ratings;

      double decrementRating = ratings * 10/100;

      _superheroList[superhero.id -1].ratings = ratings - decrementRating ;

      superheroListSink.add(_superheroList);


  }

  void dispose(){

    _superHeroListStreamController.close();
    _superHeroRatingIncrementStreamController.close();
    _superHeroRatingDecrementStreamController.close();
  }


}