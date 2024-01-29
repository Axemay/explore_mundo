import 'package:flutter/material.dart';
import 'imagem.dart';
import 'botoes.dart';
import 'texto.dart';
import 'titulo.dart';
import 'dart:math';

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
        centerTitle: true,
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
  final Color backgroundColor;

  const DestinoItem({Key? key, required this.destino, required this.backgroundColor,}) : super(key: key);
  

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
        decoration: BoxDecoration(
          color: widget.backgroundColor, 
          borderRadius: BorderRadius.circular(10.0), 
        ),
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
        
        Color backgroundColor = index % 2 == 0 ? Colors.blue[100]! : Colors.blue[200]!;
        
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: DestinoItem(destino: destinos[index], backgroundColor: backgroundColor),
        );
      },
    );
  }
}

int gerarNumeroRandomico() {
  Random random = Random();
  int numeroRandomico = random.nextInt(10) + 1; 
  return numeroRandomico;
}

List<Destino> destinos = [
  Destino(
    nome: 'Arraial d\'Ajuda',
    localizacao: 'Porto Seguro, Bahia',
    imagem: 'images/arraial.jpg',
    numeroEstrelas: gerarNumeroRandomico(),
    descricao:
        'Arraial d\'Ajuda é um distrito do município brasileiro de Porto Seguro, no litoral do estado da Bahia. De acordo com o Instituto Brasileiro de Geografia e Estatística, sua população no ano de 2010 era de 16 997 habitantes, sendo 8 543 homens e 8 454 mulheres, possuindo um total de 7 741 domicílios particulares.',
  ),
  Destino(
    nome: 'Caraíva',
    localizacao: 'Porto Seguro, Bahia',
    imagem: 'images/caraiva.jpeg',
    numeroEstrelas: gerarNumeroRandomico(),
    descricao:
        'Caraíva é uma comunidade litorânea e ribeirinha situada em Porto Seguro, na Costa do Descobrimento, no extremo sul do estado da Bahia, Nordeste do Brasil. População fixa de 1000 habitantes. Localizada dentro da APA Trancoso/Caraíva e próximo ao parque nacional de Monte Pascoal.',
  ),
  Destino(
    nome: 'Trancoso',
    localizacao: 'Porto Seguro, Bahia',
    imagem: 'images/trancoso.jpg',
    numeroEstrelas: gerarNumeroRandomico(),
    descricao:
        'Trancoso é um distrito do município brasileiro de Porto Seguro, no litoral do estado da Bahia. De acordo com o Instituto Brasileiro de Geografia e Estatística, sua população no ano de 2010 era de 11 006 habitantes, sendo 5 604 homens e 5 402 mulheres, possuindo um total de 4 816 domicílios particulares.',
  ),
  Destino(
    nome: 'Ilha Grande',
    localizacao: 'Rio de Janeiro, RJ',
    imagem: 'images/ilhagrande.jpg',
    numeroEstrelas: gerarNumeroRandomico(),
    descricao:
        'Ilha Grande é uma ilha no estado brasileiro do Rio de Janeiro rodeada de praias, coberta pela Mata Atlântica e atravessada por trilhos sinuosos. Na margem sudeste, a extensa Praia de Lopes Mendes, ladeada de palmeiras, é conhecida pelas ondas propícias ao surf. Lagoa Azul, na zona norte da ilha, possui águas protegidas e repletas de peixes.',
  ),
  Destino(
    nome: 'Búzios',
    localizacao: 'Rio de Janeiro, RJ',
    imagem: 'images/buzios.jpg',
    numeroEstrelas: gerarNumeroRandomico(),
    descricao:
        'Armação dos Búzios (ou Búzios), é uma estância brasileira situada numa península oceânica a este do Rio de Janeiro. É conhecida como um sofisticado destino de férias com inúmeras praias. Estas incluem Ferradura, numa calma baía em forma de ferradura com desportos aquáticos, e Geribá, um local de surf popular. ',
  ),
];