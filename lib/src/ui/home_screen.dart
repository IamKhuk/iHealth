import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tags_x/flutter_tags_x.dart';
import 'package:ihealth/src/defaults/advices_list.dart';
import 'package:ihealth/src/defaults/conditions_list.dart';
import 'package:ihealth/src/theme/app_theme.dart';

import 'diagnose_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    for (int i = 0; i < conditions.length; i++) {
      _items.add(
        conditions[i],
      );
    }
    super.initState();
  }

  final GlobalKey<TagsState> _tagStateKey = GlobalKey<TagsState>();
  List _items = [];

  List _selected = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.bg,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppTheme.bg,
        brightness: Brightness.light,
        leadingWidth: 76,
        leading: Row(
          children: [
            SizedBox(width: 36),
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: AppTheme.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/icons/menu.svg',
                    color: AppTheme.red,
                  ),
                ),
              ),
            ),
          ],
        ),
        title: Text(
          'Diagnose',
          style: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 18,
            fontFamily: AppTheme.fontFamily,
            height: 1.5,
            color: AppTheme.black,
          ),
        ),
        centerTitle: true,
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  // _scaffoldKey.currentState!.openEndDrawer();
                },
                child: Container(
                  height: 40,
                  width: 40,
                  padding: EdgeInsets.all(11),
                  decoration: BoxDecoration(
                    color: AppTheme.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: SvgPicture.asset(
                    'assets/icons/help.svg',
                    color: AppTheme.red,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(width: 36),
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: 130),
              Row(
                children: [
                  SizedBox(width: 24),
                  Text(
                    'What is making you worry?',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 18,
                      fontFamily: AppTheme.fontFamily,
                      height: 1.5,
                      color: AppTheme.black,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 24),
                      child: Tags(
                        key: _tagStateKey,
                        alignment: WrapAlignment.start,
                        itemCount: _items.length,
                        spacing: 8,
                        itemBuilder: (int index) {
                          final item = _items[index];
                          return GestureDetector(
                            onTap: () {
                              _tagStateKey.currentState!.getAllItem;
                              _selected.add(item);
                            },
                            child: ItemTags(
                              key: Key(index.toString()),
                              index: index,
                              title: item.title,
                              active: item.active,
                              padding: EdgeInsets.symmetric(
                                vertical: 8,
                                horizontal: 12,
                              ),
                              activeColor: AppTheme.red,
                              splashColor: AppTheme.purple,
                              colorShowDuplicate: AppTheme.purple,
                              textColor: AppTheme.red,
                              pressEnabled: true,
                              textActiveColor: AppTheme.white,
                              elevation: 0,
                              color: AppTheme.white,
                              border: Border.all(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(12),
                              customData: '',
                              textStyle: TextStyle(
                                fontSize: 14,
                                fontFamily: AppTheme.fontFamily,
                                fontWeight: FontWeight.normal,
                              ),
                              combine: ItemTagsCombine.withTextBefore,
                              onPressed: (item) {
                                print(item);
                              },
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 96),
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(height: 16),
              Container(
                height: 96,
                width: MediaQuery.of(context).size.width,
                child: CarouselSlider(
                  items: advices.map((item) {
                    return Container(
                      height: 96,
                      decoration: BoxDecoration(
                        color: AppTheme.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Stack(
                        children: [
                          Container(
                            height: 96,
                            width: MediaQuery.of(context).size.width,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.asset(
                                item.img,
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                          Container(
                            height: 96,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  AppTheme.red,
                                  AppTheme.red.withOpacity(0.7),
                                  AppTheme.red.withOpacity(0.4),
                                  AppTheme.red.withOpacity(0.1),
                                  Colors.transparent,
                                ],
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  SizedBox(width: 12),
                                  Expanded(
                                    child: Text(
                                      item.title,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 12,
                                        fontFamily: AppTheme.fontFamily,
                                        height: 1.5,
                                        color: AppTheme.white,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 12),
                                ],
                              ),
                              SizedBox(height: 8),
                            ],
                          )
                        ],
                      ),
                    );
                  }).toList(),
                  options: CarouselOptions(
                    onPageChanged: (index, reason) {},
                    autoPlay: true,
                    scrollDirection: Axis.horizontal,
                    enableInfiniteScroll: true,
                    enlargeCenterPage: true,
                    pauseAutoPlayOnTouch: true,
                    viewportFraction: 0.5,
                  ),
                ),
              ),
              Spacer(),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 56,
                      width: (MediaQuery.of(context).size.width - 72) / 3,
                      margin: EdgeInsets.only(left: 24),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: AppTheme.red,
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(5, 9),
                            blurRadius: 15,
                            spreadRadius: 0,
                            color: AppTheme.gray,
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          'SOS',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            fontFamily: AppTheme.fontFamily,
                            height: 1.5,
                            color: AppTheme.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 24),
                  GestureDetector(
                    onTap: () {
                      // for (int i = 0; i < _selectedItems.length; i++) {
                      //   for(int j = 0; j< _selectedItems.length;j++){
                      //     if(_selectedItems[i]!=_selectedItems[j]){
                      //       _selected.add(_selectedItems[i]);
                      //     }
                      //   }
                      // }

                      // _selected = _items.where((element) => element.active == true).toList();

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return DiagnoseScreen(items: _getSelectedItem());
                          },
                        ),
                      );
                      print(_getSelectedItem());
                    },
                    child: Container(
                      height: 56,
                      width: (MediaQuery.of(context).size.width - 72) / 1.5,
                      margin: EdgeInsets.only(right: 24),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: AppTheme.red,
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(5, 9),
                            blurRadius: 15,
                            spreadRadius: 0,
                            color: AppTheme.gray,
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          'Diagnose',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            fontFamily: AppTheme.fontFamily,
                            height: 1.5,
                            color: AppTheme.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
            ],
          ),
        ],
      ),
    );
  }

  List<Item>? _getSelectedItem() {
    List<Item>? selected = [];
    List<Item>? list = _tagStateKey.currentState?.getAllItem;
    if (list != null)
      list.where((a) => a.active == true).forEach((a) => print(a.title));
    selected = list!.where((element) => element.active == true).toList();
    return selected;
  }
}
