import 'package:flutter/material.dart';

import 'Home.dart';
import 'Onboard.dart';

void main() {
  runApp(new MaterialApp(home: OnboardScreen()));
}

class OnboardContent extends StatelessWidget {
  const OnboardContent(
      {required this.image, required this.title, required this.description});

  final String? image, title, description;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Mafia"),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Column(
            children: [
              Spacer(),
              Image.asset(this.image!),
              Spacer(),
              Text(
                title!,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 16),
              Text(
                description!,
                textAlign: TextAlign.center,
              ),
              Spacer()
            ],
          ),
        ));
  }
}

final List<Onboard> data = [
  Onboard(
    image: "image/mafia.jpg",
    title: "AAAAAAAA aldkjldjjlajdsfkljlasfladjj",
    description: "Here la;dkjkjakfj",
  ),
  Onboard(
    image: "image/mafia.jpg",
    title: "BBBBBBBB aldkjldjjlajdsfkljlasfladjj",
    description: "Here la;dkjkjakfj",
  ),
  Onboard(
    image: "image/mafia.jpg",
    title: "CCCCCCCC aldkjldjjlajdsfkljlasfladjj",
    description: "Here la;dkjkjakfj",
  ),
  Onboard(
    image: "image/mafia.jpg",
    title: "DDDDDDDDD aldkjldjjlajdsfkljlasfladjj",
    description: "Here la;dkjkjakfj",
  ),
];

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  late PageController _pageController;

  int _pageIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 179, 162, 101),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(children: [
              Expanded(
                  child: PageView.builder(
                      controller: _pageController,
                      itemCount: data.length,
                      onPageChanged: (index) {
                        setState(() {
                          _pageIndex = index;
                        });
                      },
                      itemBuilder: ((context, index) => OnboardContent(
                            image: data[index].image,
                            title: data[index].title,
                            description: data[index].description,
                          )))),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ...List.generate(
                      data.length,
                      (index) => Padding(
                          padding: EdgeInsets.only(right: 4),
                          child: DotIndicator(isActive: index == _pageIndex))),
                  Spacer(),
                  SizedBox(
                    height: 60,
                    width: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        _pageIndex == data.length - 1
                            ? (Navigator.of(context).push(new MaterialPageRoute(
                                builder: ((context) => new MyApp()))))
                            : (_pageController.nextPage(
                                curve: Curves.ease,
                                duration: Duration(milliseconds: 300)));
                      },
                      child: Icon(_pageIndex == data.length - 1
                          ? Icons.play_arrow
                          : Icons.east_sharp),
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                      ),
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ));
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({Key? key, this.isActive = false}) : super(key: key);

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: Duration(milliseconds: 300),
        height: isActive ? 12 : 4,
        width: 14,
        decoration: BoxDecoration(
            color: isActive ? Colors.blue : Colors.blue.withOpacity(0.4),
            borderRadius: BorderRadius.all(Radius.circular(12))));
  }
}
