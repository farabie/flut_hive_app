import 'package:flut_hive_app/model/monster.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo Hive Tutorial'),
      ),
      body: FutureBuilder(
        future: Hive.openBox('monsters'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else {
              var monstersBox = Hive.box('monsters');
              if (monstersBox.length == 0) {
                monstersBox.add(Monster('Vampire', 1));
                monstersBox.add(Monster('Jelly Guardian', 5));
              }
              return WatchBoxBuilder(
                box: monstersBox,
                builder: (context, monsters) => Container(
                  margin: EdgeInsets.all(20),
                  child: ListView.builder(
                      itemCount: monsters.length,
                      itemBuilder: (context, index) {
                        Monster monster = monsters.getAt(index);
                        return Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.only(bottom: 10),
                            decoration:
                                BoxDecoration(color: Colors.white, boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.5),
                                  offset: Offset(3, 3),
                                  blurRadius: 6)
                            ]),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  monster.name +
                                      "[" +
                                      monster.level.toString() +
                                      "]",
                                ),
                                Row(
                                  children: <Widget>[
                                    IconButton(
                                      onPressed: () {
                                        monsters.putAt(
                                            index,
                                            Monster(monster.name,
                                                monster.level + 1));
                                      },
                                      color: Colors.green,
                                      icon: Icon(Icons.trending_up),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        monsters.add(Monster(
                                            monster.name, monster.level));
                                      },
                                      color: Colors.amber,
                                      icon: Icon(Icons.content_copy),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        monsters.delete(index);
                                      },
                                      color: Colors.red,
                                      icon: Icon(Icons.delete),
                                    ),
                                  ],
                                )
                              ],
                            ));
                      }),
                ),
              );
            }
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
