import 'package:flutter/material.dart';
import 'package:my_pokemon/src/pokemon_detail_view.dart';

class PokemonViewCopy extends StatefulWidget {
  const PokemonViewCopy({Key? key}) : super(key: key);

  @override
  State<PokemonViewCopy> createState() => _PokemonViewCopyState();
}

class _PokemonViewCopyState extends State<PokemonViewCopy> {

  List<String> listName = [
    "Bullbasaur",
    "Charmander",
    "Eevee",
    "Pidgey",
    "Pikachu",
    "Pokeball",
    "Rattata",
    "Snorlax",
    "Squirtle",
    "Zubat",
  ];

  //init state digunakan untuk debugging jika statefull bukan stateless
  @override
  void initState() {
    // print("Init State: listName ${listName[4].toString()}");
    listName.forEach((element) {
      print("Init State: element ${element.toString()}");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Pokemon"),),
      body: ListView.builder(
        itemCount: listName.length,
          itemBuilder: (context, position){
            return Container(
              padding: EdgeInsets.all(20),
              child: InkWell(
                child: Text(
                  listName[position],
                  style: TextStyle(
                      fontSize: 20
                  ),
                ),
                onTap: (){
                  print("listName ${listName[position].toString()}");
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                      builder: (context) => PokemonDetailView(title: listName[position],)
                      ),
                  );
                },
              ),
            );
          },
      ),
    );
  }
}
