import 'package:flutter/material.dart';
import 'package:the_zodiacs/model/data_zodiacs.dart';
import 'package:the_zodiacs/screen/page/detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double fontSize = constraints.maxWidth > 600 ? 20 : 22;
        bool isTablet = constraints.maxWidth > 800;

        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Home Page',
              style: TextStyle(fontSize: fontSize),
            ),
            backgroundColor: const Color(0xFFCDC2A5),
            elevation: 4.0,
            toolbarHeight: 40.0,
            actions: [
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  showSearch(
                    context: context,
                    delegate: ZodiacSearchDelegate(),
                  );
                },
              ),
            ],
          ),
          body: Row(
            children: [
              if (isTablet)
                NavigationRail(
                  selectedIndex: 0,
                  onDestinationSelected: (int index) {
                    // Handle navigation rail item selection
                  },
                  labelType: NavigationRailLabelType.selected,
                  destinations: const [
                    NavigationRailDestination(
                      icon: Icon(Icons.home),
                      label: Text('Home'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.favorite),
                      label: Text('Favorites'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.settings),
                      label: Text('Settings'),
                    ),
                  ],
                ),
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: LayoutBuilder(
                        builder:
                            (BuildContext context, BoxConstraints constraints) {
                          if (constraints.maxWidth <= 600) {
                            return const TourismPlaceList();
                          } else if (constraints.maxWidth <= 1200) {
                            return TourismPlaceGrid(
                                gridCount: 4, fontSize: fontSize);
                          } else {
                            return TourismPlaceGrid(
                                gridCount: 6, fontSize: fontSize);
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ZodiacSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = zodiacsData
        .where(
            (zodiac) => zodiac.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final Zodiacs sign = results[index];
        return Card(
          child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                sign.imgAsset,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(sign.name),
            subtitle: Text(sign.birthdate),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailPage(sign: sign);
              }));
            },
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = zodiacsData
        .where(
            (zodiac) => zodiac.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final Zodiacs sign = suggestions[index];
        return ListTile(
          title: Text(sign.name),
          onTap: () {
            query = sign.name;
            showResults(context);
          },
        );
      },
    );
  }
}

class TourismPlaceGrid extends StatelessWidget {
  final int gridCount;
  final double fontSize;

  const TourismPlaceGrid(
      {super.key, required this.gridCount, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GridView.count(
        crossAxisCount: gridCount,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        children: zodiacsData.map((sign) {
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailMobilePage(sign: sign)));
            },
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(
                    sign.imgAsset,
                    fit: BoxFit.fill,
                    height: 100,
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      sign.name,
                      style: TextStyle(
                        fontSize: fontSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                    child: Text(
                      sign.birthdate,
                      style: TextStyle(
                        fontSize: fontSize * 0.8,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class TourismPlaceList extends StatelessWidget {
  const TourismPlaceList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 550.0,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final Zodiacs sign = zodiacsData[index];
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DetailPage(sign: sign);
                }));
              },
              child: Card(
                margin: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Stack(
                  children: [
                    Container(
                      width: 280.0,
                      height: 550.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        image: DecorationImage(
                            image: AssetImage(sign.imgAsset),
                            fit: BoxFit.cover,
                            scale: 1.1),
                      ),
                    ),
                    Positioned(
                      bottom: 20.0,
                      left: 20.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(6.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.black26.withOpacity(0.1),
                            ),
                            child: Text(
                              sign.birthdate,
                              style: const TextStyle(
                                fontSize: 18.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          Text(
                            sign.name,
                            style: const TextStyle(
                                fontSize: 24.0,
                                color: Color(0xFF295F98),
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
          itemCount: zodiacsData.length,
        ),
      ),
    );
  }
}
