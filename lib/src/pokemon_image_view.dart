import 'package:flutter/material.dart';
import 'package:my_pokemon/src/pokemon_detail_view.dart';
import 'package:my_pokemon/src/pokemon_model.dart';

class PokemonImageView extends StatelessWidget {
  List<PokemonModel> listPokemon = [
    PokemonModel("Bullbasaur", "assets/images/bullbasaur.png"),
    PokemonModel("Charmander", "assets/images/charmander.png"),
    PokemonModel("Eevee", "assets/images/eevee.png"),
    PokemonModel("Pidgey", "assets/images/pidgey.png"),
    PokemonModel("Pikachu", "assets/images/pikachu.png"),
    PokemonModel("Pokeball", "assets/images/pokeball.png"),
    PokemonModel("Rattata", "assets/images/rattata.png"),
    PokemonModel("Snorlax", "assets/images/snorlax.png"),
    PokemonModel("Squirtle", "assets/images/squirtle.png"),
    PokemonModel("Zubat", "assets/images/zubat.png"),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Pokemon"),),
      body: ListView.builder(
        itemCount: listPokemon.length,
        itemBuilder: (context, position){
          return Container(
            padding: EdgeInsets.all(20),
            child: InkWell(
              child: Row(
                children: [
                  Container(
                    width: 100,
                    padding: EdgeInsets.only(right: 20),
                    child: Image.asset(listPokemon[position].image),
                    // child: Image.asset("images/pokeball.png"),
                  ),
                    Text(
                      listPokemon[position].name,
                      style: TextStyle(
                          fontSize: 20
                      ),
                  ),
                ],
              ),
              onTap: (){
                print("listName ${listPokemon[position].toString()}");
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PokemonDetailView(
                        title: listPokemon[position].name,
                        image: listPokemon[position].image,
                      )
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

