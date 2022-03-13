import 'package:flutter/cupertino.dart';
import 'package:ihealth/src/model/drugs_model.dart';
import 'package:ihealth/src/theme/app_theme.dart';

class DrugsContainer extends StatelessWidget {
  final DrugsModel data;

  DrugsContainer({required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 144,
      width: 112,
      margin: EdgeInsets.only(right: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 82,
            width: 112,
            decoration: BoxDecoration(
              color: AppTheme.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  data.title,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: AppTheme.fontFamily,
                    fontSize: 16,
                    color: AppTheme.black,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 80,
                width: 80,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    data.img,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 64),
            ],
          ),
        ],
      ),
    );
  }
}
