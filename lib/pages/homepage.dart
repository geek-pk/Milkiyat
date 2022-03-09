import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:milkiyat/constants/consts.dart';
import 'package:milkiyat/rest/api_controller.dart';
import 'package:milkiyat/themes/colors.dart';
import 'package:milkiyat/widgets/custom_app_drawer.dart';
import 'package:milkiyat/widgets/skeletton_loader.dart';

import '../models/data_model.dart';
import '../widgets/custom_app_bar.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  DataModel _dataModel = DataModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: customAppDrawer(context),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          SingleChildScrollView(
            child: FutureBuilder(
              future: ApiController.fetchData(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.hasError) {
                  return Container(
                    height: 500,
                    alignment: Alignment.center,
                    child: SizedBox(
                      height: 100,
                      child: InkWell(
                        onTap: () => setState(() {}),
                        child: Column(
                          children: [
                            Container(
                                padding: const EdgeInsets.all(4),
                                margin: const EdgeInsets.all(16),
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle, color: colorYellow),
                                child: const Icon(
                                  Icons.refresh,
                                  size: 24,
                                  color: colorWhite,
                                )),
                            Text(
                              'Something went wrong',
                              style: textStyleSubTitle,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return skeletonLoader(context);
                }

                if (snapshot.hasData) {
                  _dataModel = snapshot.data;
                  List<Item>? _imagesSlides = _dataModel.data![0].items;
                  List<Item>? _topPicks = _dataModel.data![1].items;
                  List<Item>? _latest = _dataModel.data![2].items;
                  List<BackgroundImages>? _backgroundImages =
                      _dataModel.backgroundImages;
                  return Column(
                    children: [
                      Stack(
                        children: [
                          customSlider(_backgroundImages!, 250),
                          Column(
                            children: [
                              const SizedBox(height: 90),
                              Container(
                                margin: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: colorWhite,
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16.0),
                                        child: TextField(
                                          decoration: InputDecoration(
                                              hintText:
                                                  'Locality, Commercial, Flat',
                                              hintStyle: textStyleTitle
                                                  .copyWith(color: colorGrey),
                                              focusedBorder: InputBorder.none,
                                              border: InputBorder.none),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 16),
                                      decoration: const BoxDecoration(
                                          color: colorYellow,
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(24),
                                              bottomRight:
                                                  Radius.circular(24))),
                                      child: Text(
                                        'Search',
                                        style: getHeadlineSmall(context)!
                                            .copyWith(
                                                fontWeight: FontWeight.w400,
                                                color: colorWhite),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 24, vertical: 12),
                                    decoration: BoxDecoration(
                                        color: colorYellow,
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: Text(
                                      'FIND PROPERTY',
                                      style: textStyleSubTitle.copyWith(
                                          color: colorWhite),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 24, vertical: 12),
                                    decoration: BoxDecoration(
                                        color: colorYellow,
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: Text(
                                      'POST A PROPERTY',
                                      style: textStyleSubTitle.copyWith(
                                          color: colorWhite),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 50),
                            ],
                          ),
                        ],
                      ),
                      CarouselSlider(
                        options: CarouselOptions(height: 215.0),
                        items: _imagesSlides?.map((i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                margin: const EdgeInsets.symmetric(
                                    vertical: 16, horizontal: 8),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(i.image ?? noImageUrl),
                                  ),
                                ),
                              );
                            },
                          );
                        }).toList(),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: _imagesSlides!.map((entry) {
                          return Container(
                            alignment: Alignment.center,
                            width: 12.0,
                            height: 12.0,
                            margin: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 4.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              border: Border.all(
                                  color: colorYellow,
                                  width: 1,
                                  style: BorderStyle.solid),
                            ),
                            child: Container(
                                width: 8.0,
                                height: 8.0,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(2),
                                    shape: BoxShape.rectangle,
                                    color: colorYellow)),
                          );
                        }).toList(),
                      ),
                      listTagWidget('Top Picks'),
                      customListView(_topPicks),
                      listTagWidget('Latest'),
                      customListView(_latest),
                    ],
                  );
                } else {
                  return Text(snapshot.data.toString());
                }
              },
            ),
          ),
          customAppBar(_scaffoldKey)
        ],
      ),
      bottomNavigationBar: customBottomNavBar(),
    );
  }

  Widget customSlider(List<dynamic> backgroundImages, double height) {
    return CarouselSlider(
      options: CarouselOptions(
          height: height,
          enlargeCenterPage: false,
          autoPlay: true,
          autoPlayInterval: const Duration(milliseconds: 3000),
          viewportFraction: 1,
          aspectRatio: 1.0),
      items: backgroundImages.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return SizedBox(
              width: double.infinity,
              child: Image.network(i.image!, fit: BoxFit.cover),
            );
          },
        );
      }).toList(),
    );
  }

  Widget customListView(List<Item>? topPicks) {
    return SizedBox(
      height: 300,
      child: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return customListWidget(topPicks![index], context);
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(width: 16);
        },
      ),
    );
  }

  Widget listTagWidget(text) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Text(text,
              style: getHeadlineSmall(context)!
                  .copyWith(fontWeight: FontWeight.bold)),
          Expanded(child: Container()),
          Text('SEE ALL',
              style: getHeadlineSmall(context)!.copyWith(color: colorYellow)),
          const Icon(Icons.arrow_right, color: colorYellow)
        ],
      ),
    );
  }

  Widget customListWidget(Item item, context) {
    String? rented = item.transact?.priceUnit;
    bool isRented = item.transact?.name == "Rent";

    return SizedBox(
      width: 200,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.bottomRight,
            width: 200,
            height: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(item.thumbnail ?? noImageUrl))),
            child: Container(
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(4)),
              child: Text(
                'FOR ' + item.transact!.labelSeller!.toUpperCase(),
                style: getHeadlineSmall(context)!
                    .copyWith(color: colorWhite, fontSize: 10),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    '₹'+item.price!.toInt().toString() +
                        (isRented ? rented.toString() : ''),
                    style: getHeadlineLarge(context)),
                const Icon(
                  Icons.favorite_outline,
                  size: 20,
                ),
              ],
            ),
          ),
          Text(
            item.title ?? 'Title',
            overflow: TextOverflow.ellipsis,
            style: textStyleSubTitle,
          ),
          Row(
            children: item.attributes!
                .map((e) => widgetContainerSmall(e, context))
                .toList(),
          ),
          Row(
            children: [
              const Icon(Icons.location_pin, size: 16),
              Text(
                item.locality ?? 'None',
                style: textStyleSubTitle,
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            color: colorGrey,
            height: 0.1,
            width: 200,
          ),
        ],
      ),
    );
  }

  Widget widgetContainerSmall(Attributes attributes, context) {
    if (attributes.value != null && attributes.value!.length > 5) {
      attributes.value = attributes.value!.substring(0, 4);
    }
    if (attributes.unit != null && attributes.unit!.length > 5) {
      attributes.unit = attributes.unit!.substring(0, 4);
    }
    if (attributes.unit != null && attributes.unit == "Rent") {
      attributes.unit = '/' + attributes.unit!;
    }
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        (attributes.value ?? '') + ' ' + (attributes.unit ?? ''),
        overflow: TextOverflow.ellipsis,
        style:
            textStyleSubTitle.copyWith(fontSize: 10, color: Colors.grey[700]),
      ),
    );
  }

  Widget customBottomNavBar() {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [BoxShadow(color: colorYellow, blurRadius: 0.3)],
      ),
      child: BottomNavigationBar(
          // onTap: (index) => setState(() => selectedIndex = index),
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: colorGrey,
          selectedItemColor: colorYellow,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.explore), label: 'Explore'),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Saved'),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications), label: 'Notifications'),
          ]),
    );
  }
}
