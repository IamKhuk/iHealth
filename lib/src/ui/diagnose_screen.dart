import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_tags_x/flutter_tags_x.dart';
import 'package:ihealth/src/theme/app_theme.dart';

class DiagnoseScreen extends StatefulWidget {
  final List<Item>? items;

  DiagnoseScreen({required this.items});

  @override
  _DiagnoseScreenState createState() => _DiagnoseScreenState();
}

class _DiagnoseScreenState extends State<DiagnoseScreen> {
  @override
  void initState() {
    _items = widget.items!;
    super.initState();
  }

  final GlobalKey<TagsState> _tagStateKey = GlobalKey<TagsState>();
  List _items = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.bg,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        brightness: Brightness.light,
        leadingWidth: 76,
        leading: Row(
          children: [
            SizedBox(width: 36),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: AppTheme.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/icons/left.svg',
                    color: AppTheme.red,
                  ),
                ),
              ),
            ),
          ],
        ),
        centerTitle: true,
        title: Text(
          'Your Results',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            fontFamily: AppTheme.fontFamily,
            height: 1.5,
            color: AppTheme.black,
          ),
        ),
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
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: false,
            floating: false,
            snap: false,
            backgroundColor: AppTheme.bg,
            leading: Container(),
            leadingWidth: 0,
            elevation: 0,
            centerTitle: true,
            title: Tags(
              key: _tagStateKey,
              alignment: WrapAlignment.start,
              itemCount: _items.length,
              spacing: 8,
              itemBuilder: (int index) {
                final item = _items[index];
                return ItemTags(
                  key: Key(index.toString()),
                  index: index,
                  title: item.title,
                  active: true,
                  padding: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 12,
                  ),
                  activeColor: AppTheme.red,
                  splashColor: AppTheme.red,
                  colorShowDuplicate: AppTheme.red,
                  textColor: AppTheme.white,
                  textActiveColor: AppTheme.white,
                  elevation: 0,
                  color: AppTheme.red,
                  border: Border.all(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(12),
                  customData: item.customData,
                  textStyle: TextStyle(
                    fontSize: 14,
                    fontFamily: AppTheme.fontFamily,
                    fontWeight: FontWeight.normal,
                  ),
                  combine: ItemTagsCombine.withTextBefore,
                  onPressed: (item) => print(item),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
