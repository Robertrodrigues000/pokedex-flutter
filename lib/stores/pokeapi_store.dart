import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:pokedex/consts/consts_api.dart';
import 'package:pokedex/models/pokeapi.dart';
import 'package:http/http.dart' as http;
part 'pokeapi_store.g.dart';

class PokeApiStore = _PokeApiStoreBase with _$PokeApiStore;

abstract class _PokeApiStoreBase with Store {
  @observable
  PokeAPI? pokeAPI;

  @action
  fetchPokemonList() async {
    pokeAPI = null;
    await loadPokeAPI().then((pokeList) => {
      pokeAPI = pokeList
    });
  }

  Future<PokeAPI?> loadPokeAPI() async {
    try {
      final response = await http.get(Uri.parse(ConstsAPI.pokeApiUrl));
      var decodeJson = jsonDecode(response.body);
      dynamic result = PokeAPI.fromJson(decodeJson);
      return result;
    } catch (error) {
      print("Erro ao carregar lista");
      return null;
    }
  }


  Pokemon? getPokemon({int? index}){
    return pokeAPI?.pokemons?[index!] ;
  }
}
