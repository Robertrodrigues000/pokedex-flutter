import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/consts/consts_api.dart';
import 'package:pokedex/consts/consts_app.dart';

class PokeItem extends StatelessWidget {
  final String? name;
  final int? index;
  final String? num;
  final List<String>? types;

  Widget setTipos() {
    List<Widget> lista = [];
    types?.forEach((nome) {
      lista.add(
        Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromARGB(80, 255, 255, 255)),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text(
                  nome.trim(),
                  style: TextStyle(
                      fontFamily: 'Google',
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            )
          ],
        ),
      );
    });
    return Column(
      children: lista,
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }

  const PokeItem(
      {Key? key, required this.name, required this.index, required this.num, required this.types})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            //alignment: Alignment.bottomRight,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                    child: Text(
                      name ?? "",
                      style: TextStyle(
                          fontFamily: 'Google',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: setTipos(),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Opacity(
                  child: Image.asset(
                    ConstsApp.whitepokeball,
                    height: 80,
                    width: 80,
                  ),
                  opacity: 0.2,
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: CachedNetworkImage(
                  height: 80,
                  width: 80,
                  placeholder: (context, url) => new Container(
                    color: Colors.transparent,
                  ),
                  imageUrl:
                      'https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/$num.png',
                ),
              ),
            ],
          ),
        ),
        decoration: BoxDecoration(
          color: ConstsAPI.getColorType(type: types?[0]),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
      ),
    );
  }
}
