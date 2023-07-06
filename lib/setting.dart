import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

final List<String> textList = [
  '입주를 환영한다는 의원의 현수막은 훗날 자기가 힘써서 인구가 늘었다는 정치적 활동으로 사용하려는 의도다.',
  '오염수 방수에 대해 갑자기 시끄러운 이유는 실상 우리에게 피해가 가기 보단, 현 정권의 무능함을 드라마틱하게 보이기 위한 수단이다.',
  '지금 눈앞에 일어나는 정치 이야기, 쉽게 속지 않도록 길잡이가 되주는 쉬운 정치 진짜 정치를 많이 이용해주세요.',
];

void main() => runApp(const Main());

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MainState();
  }
}

class _MainState extends State<Main> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // for (var imageUrl in images) {
      //   precacheImage(NetworkImage(imageUrl), context);
      // }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text('쉬운 정치, 진짜 정치'),
      ), //오만가지를 다 골라주는 오다골
      body: Builder(builder: (context) {
        final double height = MediaQuery.of(context).size.height - 100;
        return CarouselSlider.builder(
          itemCount: 10,
          options: CarouselOptions(
            autoPlayInterval: const Duration(seconds: 10),
            height: height,
            scrollDirection: Axis.vertical,
            autoPlay: true,
            // enlargeCenterPage: true,
          ),
          itemBuilder: (context, index, realIdx) => Card(
            text: textList[index],
          ),
        );
      }),
    ));
  }
}

class Card extends StatelessWidget {
  final String text;
  const Card({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(50),
        height: 100,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 1.0,
              // spreadRadius: 0.0,
            ),
          ],
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
