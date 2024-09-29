import 'package:flutter/material.dart';
import 'package:the_zodiacs/model/data_zodiacs.dart';

class DetailPage extends StatelessWidget {
  final Zodiacs sign;

  const DetailPage({super.key, required this.sign});

  @override
  Widget build(BuildContext context) {
    return DetailMobilePage(sign: sign);
  }
}

class DetailMobilePage extends StatefulWidget {
  final Zodiacs sign;

  const DetailMobilePage({super.key, required this.sign});

  @override
  DetailMobilePageState createState() => DetailMobilePageState();
}

class DetailMobilePageState extends State<DetailMobilePage> {
  late String _mainImage;

  @override
  void initState() {
    super.initState();
    _mainImage = widget.sign.imgAsset;
  }

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
                  Container(
                    margin: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.30),
                          offset: const Offset(0, 5),
                          blurRadius: 15.0,
                          spreadRadius: 5.0,
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image(
                        image: _mainImage.contains('assets')
                            ? AssetImage(_mainImage) as ImageProvider
                            : NetworkImage(_mainImage),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 16.0,
                    left: 16.0,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 6.0,
                          vertical: 6.0,
                        ),
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.2),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 16.0,
                    left: 0.0,
                    right: 0.0,
                    child: Center(
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 6.0),
                        padding: const EdgeInsets.symmetric(
                          vertical: 4.0,
                          horizontal: 10.0,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: const Text(
                          'Detail',
                          style: TextStyle(
                            fontSize: 22.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(16.0, 20.0, 0.0, 6.0),
                child: Text(
                  widget.sign.name,
                  style: const TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              if (widget.sign.imgUrls.isNotEmpty)
                Container(
                  height: 150.0,
                  margin: const EdgeInsets.fromLTRB(8.0, 6.0, 8.0, 6.0),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.sign.imgUrls.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _mainImage = widget.sign.imgUrls[index];
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 8.0,
                          ),
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                              image: NetworkImage(widget.sign.imgUrls[index]),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              Container(
                padding: const EdgeInsets.fromLTRB(16.0, 10.0, 0.0, 6.0),
                child: Text(
                  'Tanggal: ${widget.sign.birthdate}',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16.0),
                child: SelectionContainer.disabled(
                  child: Text(
                    widget.sign.description,
                    softWrap: true,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
