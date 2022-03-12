import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_tags_x/flutter_tags_x.dart';
import 'package:ihealth/src/model/diseases_probability.dart';
import 'package:ihealth/src/theme/app_theme.dart';
import 'package:ihealth/src/utils/percentages_function.dart';
import 'package:ihealth/src/widgets/percentage_rich_text.dart';

class DiagnoseScreen extends StatefulWidget {
  final List<Item>? items;
  final List<int?> ids;

  DiagnoseScreen({
    required this.items,
    required this.ids,
  });

  @override
  _DiagnoseScreenState createState() => _DiagnoseScreenState();
}

class _DiagnoseScreenState extends State<DiagnoseScreen> {
  @override
  void initState() {
    _items = widget.items!;
    _list = percentages(widget.ids);
    super.initState();
  }

  final GlobalKey<TagsState> _tagStateKey = GlobalKey<TagsState>();
  List _items = [];
  late List<DiseaseProbability> _list;

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
      body: ListView(
        children: [
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 24),
              Text(
                'Selected conditions',
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
          SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Tags(
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
                  active: item.active,
                  padding: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 12,
                  ),
                  activeColor: AppTheme.red,
                  splashColor: AppTheme.purple,
                  colorShowDuplicate: AppTheme.purple,
                  textColor: AppTheme.red,
                  pressEnabled: false,
                  textActiveColor: AppTheme.white,
                  elevation: 0,
                  color: AppTheme.white,
                  border: Border.all(color: AppTheme.red),
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
                );
              },
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 24),
              Text(
                'Disease Probability',
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
          SizedBox(height: 12),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 24),
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: _list.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    PercentageText(data: _list[index]),
                    index == _list.length - 1
                        ? SizedBox(height: 0)
                        : SizedBox(height: 8),
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
