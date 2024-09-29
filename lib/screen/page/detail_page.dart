import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
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
  DetailWebPageState createState() => DetailWebPageState();
}

class DetailWebPageState extends State<DetailWebPage> {
  late String _mainImage;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _mainImage = widget.sign.imgAsset;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Zodiac Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 64,
        ),
        child: Center(
          child: SizedBox(
            width: screenWidth <= 1200
                ? 800
                : 1200, // Adjust width for large screens
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.sign.name,
                  style: const TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 24.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Container(
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
                                  child: CachedNetworkImage(
                                    imageUrl: _mainImage.contains('assets')
                                        ? _mainImage
                                        : _mainImage,
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) => Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        Center(
                                      child: Text(
                                        'Error loading image',
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          if (widget.sign.imgUrls.isNotEmpty)
                            Scrollbar(
                              controller: _scrollController,
                              child: Container(
                                height: 150.0,
                                margin:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: ListView.builder(
                                  controller: _scrollController,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: widget.sign.imgUrls.length,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _mainImage =
                                              widget.sign.imgUrls[index];
                                        });
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        width: 150.0,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          image: DecorationImage(
                                            image: CachedNetworkImageProvider(
                                                widget.sign.imgUrls[index]),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        child: CachedNetworkImage(
                                          imageUrl: widget.sign.imgUrls[index],
                                          fit: BoxFit.cover,
                                          placeholder: (context, url) => Center(
                                            child: CircularProgressIndicator(),
                                          ),
                                          errorWidget: (context, url, error) =>
                                              Center(
                                            child: Text(
                                              'Error loading image',
                                              style:
                                                  TextStyle(color: Colors.red),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 32),
                    Expanded(
                      child: Card(
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.sign.name,
                                style: const TextStyle(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'Tanggal: ${widget.sign.birthdate}',
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                              const SizedBox(height: 16),
                              SelectionContainer.disabled(
                                child: Text(
                                  widget.sign.description,
                                  softWrap: true,
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
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
