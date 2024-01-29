import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Explore o Mundo';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(appTitle),
          backgroundColor: Colors.blue[400],
        ),
        body: SafeArea(
          child: DestinoItemList(),
        ),
      ),
    );
  }
}

class Destino {
  final String nome;
  final String localizacao;
  final String imagem;
  final String descricao;
  final int numeroEstrelas;

  Destino({
    required this.nome,
    required this.localizacao,
    required this.imagem,
    required this.descricao,
    required this.numeroEstrelas,
  });
}

class DestinoDetailScreen extends StatelessWidget {
  final Destino destino;

  const DestinoDetailScreen({Key? key, required this.destino}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(destino.nome),
        backgroundColor: Colors.blue[400],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageSection(image: destino.imagem),
          SizedBox(height: 8),
          TitleSection(
            name: destino.nome,
            location: destino.localizacao,
            numeroEstrelas: destino.numeroEstrelas,
          ),
          TextSection(description: destino.descricao), 
          ButtonSection(),
        ],
      ),
    );
  }
}


class DestinoItem extends StatefulWidget {
  final Destino destino;

  const DestinoItem({Key? key, required this.destino}) : super(key: key);

  @override
  _DestinoItemState createState() => _DestinoItemState();
}

class _DestinoItemState extends State<DestinoItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DestinoDetailScreen(destino: widget.destino),
          ),
        );
      },
      child: Container(
        width: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageSection(image: widget.destino.imagem),
            SizedBox(height: 8),
            TitleSection(
              name: widget.destino.nome,
              location: widget.destino.localizacao,
              numeroEstrelas: widget.destino.numeroEstrelas,
            ),
          ],
        ),
      ),
    );
  }
}

class DestinoItemList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: destinos.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: DestinoItem(destino: destinos[index]),
        );
      },
    );
  }
}


class TitleSection extends StatelessWidget {
  const TitleSection({
    Key? key,
    required this.name,
    required this.location,
    required this.numeroEstrelas,
  }) : super(key: key);

  final String name;
  final String location;
  final int numeroEstrelas;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  location,
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.star,
            color: Color.fromARGB(255, 238, 183, 4),
          ),
          Text(numeroEstrelas.toString()),
        ],
      ),
    );
  }
}

class ButtonSection extends StatelessWidget {
  const ButtonSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color color = Colors.blue[600]!;
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ButtonWithText(
            color: color,
            icon: Icons.call,
            label: 'Ligar',
          ),
          ButtonWithText(
            color: color,
            icon: Icons.near_me,
            label: 'Rota',
          ),
          ButtonWithText(
            color: color,
            icon: Icons.share,
            label: 'Compartilhar',
          ),
        ],
      ),
    );
  }
}

class ButtonWithText extends StatelessWidget {
  const ButtonWithText({
    Key? key,
    required this.color,
    required this.icon,
    required this.label,
  }) : super(key: key);

  final Color color;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}

class TextSection extends StatelessWidget {
  const TextSection({
    Key? key,
    required this.description,
  }) : super(key: key);

  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Text(
        description,
        softWrap: true,
      ),
    );
  }
}

class ImageSection extends StatelessWidget {
  const ImageSection({Key? key, required this.image}) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      width: 600,
      height: 240,
      fit: BoxFit.cover,
    );
  }
}


List<Destino> destinos = [
  Destino(
    nome: 'Arraial d\'Ajuda',
    localizacao: 'Porto Seguro, Bahia',
    imagem: 'images/arraial.jpg',
    numeroEstrelas: Random().nextInt(5) + 1,
    descricao:
        'Arraial d\'Ajuda é um distrito do município brasileiro de Porto Seguro, no litoral do estado da Bahia. De acordo com o Instituto Brasileiro de Geografia e Estatística, sua população no ano de 2010 era de 16 997 habitantes, sendo 8 543 homens e 8 454 mulheres, possuindo um total de 7 741 domicílios particulares.',
  ),
  Destino(
    nome: 'Caraíva',
    localizacao: 'Porto Seguro, Bahia',
    imagem: 'images/caraiva.jpeg',
    numeroEstrelas: Random().nextInt(5) + 1,
    descricao:
        'Caraíva é uma comunidade litorânea e ribeirinha situada em Porto Seguro, na Costa do Descobrimento, no extremo sul do estado da Bahia, Nordeste do Brasil. População fixa de 1000 habitantes. Localizada dentro da APA Trancoso/Caraíva e próximo ao parque nacional de Monte Pascoal.',
  ),
  Destino(
    nome: 'Trancoso',
    localizacao: 'Porto Seguro, Bahia',
    imagem: 'images/trancoso.jpg',
    numeroEstrelas: Random().nextInt(5) + 1,
    descricao:
        'Trancoso é um distrito do município brasileiro de Porto Seguro, no litoral do estado da Bahia. De acordo com o Instituto Brasileiro de Geografia e Estatística, sua população no ano de 2010 era de 11 006 habitantes, sendo 5 604 homens e 5 402 mulheres, possuindo um total de 4 816 domicílios particulares.',
  ),
  Destino(
    nome: 'Ilha Grande',
    localizacao: 'Rio de Janeiro, RJ',
    imagem: 'images/ilhagrande.jpg',
    numeroEstrelas: Random().nextInt(5) + 1,
    descricao:
        'Ilha Grande é uma ilha no estado brasileiro do Rio de Janeiro rodeada de praias, coberta pela Mata Atlântica e atravessada por trilhos sinuosos. Na margem sudeste, a extensa Praia de Lopes Mendes, ladeada de palmeiras, é conhecida pelas ondas propícias ao surf. Lagoa Azul, na zona norte da ilha, possui águas protegidas e repletas de peixes.',
  ),
  Destino(
    nome: 'Búzios',
    localizacao: 'Rio de Janeiro, RJ',
    imagem: 'images/buzios.jpg',
    numeroEstrelas: Random().nextInt(5) + 1,
    descricao:
        'Armação dos Búzios (ou Búzios), é uma estância brasileira situada numa península oceânica a este do Rio de Janeiro. É conhecida como um sofisticado destino de férias com inúmeras praias. Estas incluem Ferradura, numa calma baía em forma de ferradura com desportos aquáticos, e Geribá, um local de surf popular. ',
  ),
];
