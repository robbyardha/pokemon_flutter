import 'package:flutter/material.dart';
import 'package:my_pokemon/src/pokemon_detail_view.dart';
import 'package:my_pokemon/src/pokemon_model.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

class PokemonCustomView extends StatefulWidget {
  const PokemonCustomView({Key? key}) : super(key: key);

  @override
  State<PokemonCustomView> createState() => _PokemonCustomViewState();
}

class _PokemonCustomViewState extends State<PokemonCustomView> {

  List<PokemonModel> listPokemon = [];
  List<PokemonModel> listData = [
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

  var countPokemon = 0;


  void addData(){
    if(countPokemon < 10){
      print("addData : countPokemon ${countPokemon}");
      setState(() {
        listPokemon.add(listData[countPokemon]);
        countPokemon++;
      });

    }
  }

  void loadData() {
    ProgressDialog progressDialog = ProgressDialog(context: context);
    progressDialog.show(msg: "Pokemon loading");
    Future.delayed(Duration(seconds: 3), (){
      setState((){
        listPokemon = listData;
        progressDialog.close();
      });

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Pokemon"),),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          // loadData();
          addData();
        }
      ),
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




