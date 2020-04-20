import 'package:flutter/material.dart';
import 'SuperHero.dart';
import 'SuperHeroBlock.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final SuperHeroBlock _superHeroBlock = new SuperHeroBlock();

  @override
  void dispose(){
    _superHeroBlock.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text("Super Hero Rating"),
      ),
      body: Container(
        child : StreamBuilder<List<SuperHero>>(
          stream: _superHeroBlock.superheroListStream,
          builder: (BuildContext context, AsyncSnapshot<List<SuperHero>> snapshot)
          {
              return ListView.builder(
                itemCount : snapshot.data.length,
                itemBuilder: (context,index){
                  return Card(
                    elevation: 5.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(

                          padding: EdgeInsets.all(20.0),
                          child: Text(
                            "${snapshot.data[index].id}.",
                            style: TextStyle(fontSize:20.0),
                          ),
                          
                        ),
                        Container(
                          
                          padding: EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:<Widget>[
                              Text(
                            "${snapshot.data[index].name}.",
                            style: TextStyle(fontSize:18.0),
                          ),
                          Text(
                            "RATING : ${snapshot.data[index].ratings}.",
                            style: TextStyle(fontSize:16.0),
                          ),
                          ],
                        ),
                        ),
                        Container(
                          child: IconButton(
                            icon: Icon(Icons.thumb_up) ,
                            color: Colors.green,
                            onPressed: (){
                              _superHeroBlock.superheroRatingIncrement.add
                              (snapshot.data[index]);
                            },
                            ),
                        ),

                        Container(
                          child: IconButton(
                            icon: Icon(Icons.thumb_down) ,
                            color: Colors.red,
                            onPressed: (){

                               _superHeroBlock.superheroRatingDecrement.add
                              (snapshot.data[index]);
                            },
                            ),
                        ),


                      ],
                    ),
                  );
                },
              );
          },
        ),
      ),
      
    );
  }
}