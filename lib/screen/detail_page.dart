import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:the_zodiacs/model/data_zodiacs.dart';

class DetailPage extends StatelessWidget {
  final Zodiacs sign;

  const DetailPage({super.key, required this.sign});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth > 800) {
        return DetailWebPage(sign: sign);
      } else {
        return DetailMobilePage(sign: sign);
      }
    });
  }
}

class DetailWebPage extends StatefulWidget {
  final Zodiacs sign;

  const DetailWebPage({super.key, required this.sign});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

class DetailMobilePage extends StatelessWidget {
  final Zodiacs sign;

  const DetailMobilePage({super.key, required this.sign});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                children: [
                  ExpandableCarousel(
                    options: ExpandableCarouselOptions(
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 2),
                    ),
                    items: [1, 2, 3, 4, 5].map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: BoxDecoration(color: Colors.amber),
                              child: Text(
                                'text $i',
                                style: TextStyle(fontSize: 16.0),
                              ));
                        },
                      );
                    }).toList(),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
