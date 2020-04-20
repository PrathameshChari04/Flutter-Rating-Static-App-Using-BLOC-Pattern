class SuperHero {

  int _id;
  String _name;
  double _ratings;

  SuperHero(this._id,this._name,this._ratings);

  //setter

  set id(int id){
    this._id = id;
  }

  set name(String name){
    this._name = name;
  }

  set ratings(double ratings){
    this._ratings = ratings;
  }

  ////getter
  int get id => this._id;
  String get name => this._name;
  double get ratings => this._ratings;

}