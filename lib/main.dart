import 'package:flutter/material.dart';

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
          )),
    );
  }
}

class Destino {
  final String nome;
  final String localizacao;
  final String imagem;
  final String descricao;

  Destino({
    required this.nome,
    required this.localizacao,
    required this.imagem,
    required this.descricao,
  });
}

class DestinoItem extends StatelessWidget {
  final Destino destino;

  const DestinoItem({Key? key, required this.destino}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageSection(image: destino.imagem),
          TitleSection(name: destino.nome, location: destino.localizacao),
          ButtonSection(),
          TextSection(description: destino.descricao),
        ],
      ),
    );
  }
}

class DestinoItemList extends StatelessWidget {
  final List<Destino> destinos = [
    Destino(
      nome: 'Arraial d\'Ajuda',
      localizacao: 'Porto Seguro, Bahia',
      imagem: 'images/arraial.jpg',
      descricao:
          'Arraial d\'Ajuda é um distrito do município brasileiro de Porto Seguro, no litoral do estado da Bahia. De acordo com o Instituto Brasileiro de Geografia e Estatística, sua população no ano de 2010 era de 16 997 habitantes, sendo 8 543 homens e 8 454 mulheres, possuindo um total de 7 741 domicílios particulares.',
    ),
    Destino(
      nome: 'Caraíva',
      localizacao: 'Porto Seguro, Bahia',
      imagem: 'images/caraiva.jpeg',
      descricao:
          'Caraíva é uma comunidade litorânea e ribeirinha situada em Porto Seguro, na Costa do Descobrimento, no extremo sul do estado da Bahia, Nordeste do Brasil. População fixa de 1000 habitantes. Localizada dentro da APA Trancoso/Caraíva e próximo ao parque nacional de Monte Pascoal.',
    ),
        Destino(
      nome: 'Trancoso',
      localizacao: 'Porto Seguro, Bahia',
      imagem: 'images/trancoso.jpg',
      descricao:
          'Trancoso é um distrito do município brasileiro de Porto Seguro, no litoral do estado da Bahia. De acordo com o Instituto Brasileiro de Geografia e Estatística, sua população no ano de 2010 era de 11 006 habitantes, sendo 5 604 homens e 5 402 mulheres, possuindo um total de 4 816 domicílios particulares.',
    ),
        Destino(
      nome: 'Ilha Grande',
      localizacao: 'Rio de Janeiro, RJ',
      imagem: 'images/ilhagrande.jpg',
      descricao:
          'Ilha Grande é uma ilha no estado brasileiro do Rio de Janeiro rodeada de praias, coberta pela Mata Atlântica e atravessada por trilhos sinuosos. Na margem sudeste, a extensa Praia de Lopes Mendes, ladeada de palmeiras, é conhecida pelas ondas propícias ao surf. Lagoa Azul, na zona norte da ilha, possui águas protegidas e repletas de peixes.',
    ),
        Destino(
      nome: 'Búzios',
      localizacao: 'Rio de Janeiro, RJ',
      imagem: 'images/buzios.jpg',
      descricao:
          'Armação dos Búzios (ou Búzios), é uma estância brasileira situada numa península oceânica a este do Rio de Janeiro. É conhecida como um sofisticado destino de férias com inúmeras praias. Estas incluem Ferradura, numa calma baía em forma de ferradura com desportos aquáticos, e Geribá, um local de surf popular. ',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: destinos.length,
      itemBuilder: (context, index) {
        return Container(
            child: DestinoItem(destino: destinos[index]));
      },
    );
  }
}

class TitleSection extends StatelessWidget {
  const TitleSection({
    super.key,
    required this.name,
    required this.location,
  });

  final String name;
  final String location;

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
          const Text('41'),
        ],
      ),
    );
  }
}

class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

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
    super.key,
    required this.color,
    required this.icon,
    required this.label,
  });

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
    super.key,
    required this.description,
  });

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
  const ImageSection({super.key, required this.image});

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
