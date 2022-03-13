import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ihealth/src/theme/app_theme.dart';
import 'package:ihealth/src/ui/home_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.bg,
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: SvgPicture.asset(
                          'assets/icons/red.svg',
                          height: 300,
                          color: AppTheme.red,
                        ),
                      ),
                      SizedBox(height: 50,)
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: 20),
                      Image.asset(
                        'assets/images/nurse.png',
                        height: 270,
                      ),
                      SizedBox(width: 100),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: 110),
                      Image.asset(
                        'assets/images/man_nurse.png',
                        height: 300,
                      ),
                    ],
                  ),
                  CustomPaint(
                    size: Size(MediaQuery.of(context).size.width, 90),
                    painter: RPSCustomPainter(),
                  )
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.48 + 17,
                width: MediaQuery.of(context).size.width,
                color: AppTheme.white,
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(height: 40),
              // SvgPicture.asset(
              //   'assets/images/elements.svg',
              //   color: AppTheme.red,
              // ),
              Spacer(),
              Container(
                height: MediaQuery.of(context).size.height * 0.48,
                width: MediaQuery.of(context).size.width - 32,
                margin: EdgeInsets.all(16),
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 24,
                ),
                decoration: BoxDecoration(
                  color: AppTheme.red.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(32),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 8),
                    Container(
                      height: 51,
                      width: 51,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset('assets/images/logo.png'),
                      ),
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Complete Health Solution',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontFamily: AppTheme.fontFamily,
                              fontSize: 36,
                              color: AppTheme.white,
                              height: 1.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Early protection for family health',
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontFamily: AppTheme.fontFamily,
                              fontSize: 16,
                              color: AppTheme.white.withOpacity(0.8),
                              height: 1.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).popUntil(
                              (route) => route.isFirst,
                            );
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return HomeScreen();
                                },
                              ),
                            );
                          },
                          child: Container(
                            height: 64,
                            width: 64,
                            decoration: BoxDecoration(
                              color: AppTheme.red,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: SvgPicture.asset(
                                'assets/icons/right.svg',
                                color: AppTheme.white,
                                height: 24,
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 255, 255, 255)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;

    Path path0 = Path();
    path0.moveTo(0, size.height * 0.6666667);
    path0.quadraticBezierTo(size.width * 0.0343750, size.height * 0.2525000,
        size.width * 0.0850000, size.height * 0.2733333);
    path0.cubicTo(
        size.width * 0.1459375,
        size.height * 0.3075000,
        size.width * 0.1062500,
        size.height * 0.7466667,
        size.width * 0.1787500,
        size.height * 0.6333333);
    path0.cubicTo(
        size.width * 0.1956250,
        size.height * 0.5725000,
        size.width * 0.2018750,
        size.height * 0.4841667,
        size.width * 0.2337500,
        size.height * 0.4300000);
    path0.cubicTo(
        size.width * 0.2659375,
        size.height * 0.3950000,
        size.width * 0.2750000,
        size.height * 0.4975000,
        size.width * 0.2825000,
        size.height * 0.5900000);
    path0.cubicTo(
        size.width * 0.3265625,
        size.height * 0.6408333,
        size.width * 0.3259375,
        size.height * 0.4941667,
        size.width * 0.3775000,
        size.height * 0.3833333);
    path0.cubicTo(
        size.width * 0.4153125,
        size.height * 0.3591667,
        size.width * 0.4121875,
        size.height * 0.4508333,
        size.width * 0.4387500,
        size.height * 0.5300000);
    path0.cubicTo(
        size.width * 0.4887500,
        size.height * 0.6675000,
        size.width * 0.5737500,
        size.height * 0.1358333,
        size.width * 0.6350000,
        size.height * 0.0966667);
    path0.cubicTo(
        size.width * 0.6921875,
        size.height * 0.1016667,
        size.width * 0.6584375,
        size.height * 0.4375000,
        size.width * 0.6850000,
        size.height * 0.5466667);
    path0.cubicTo(
        size.width * 0.7212500,
        size.height * 0.6733333,
        size.width * 0.7415625,
        size.height * 0.3941667,
        size.width * 0.7850000,
        size.height * 0.3600000);
    path0.cubicTo(
        size.width * 0.8178125,
        size.height * 0.3908333,
        size.width * 0.7878125,
        size.height * 0.4266667,
        size.width * 0.8237500,
        size.height * 0.4466667);
    path0.cubicTo(
        size.width * 0.8653125,
        size.height * 0.3891667,
        size.width * 0.8896875,
        size.height * 0.2350000,
        size.width * 0.9275000,
        size.height * 0.1533333);
    path0.cubicTo(
        size.width * 0.9796875,
        size.height * 0.0816667,
        size.width * 0.9803125,
        size.height * 0.4083333,
        size.width,
        size.height * 0.4000000);
    path0.quadraticBezierTo(size.width, size.height * 0.5499500, size.width,
        size.height * 0.9998000);
    path0.lineTo(0, size.height);
    path0.lineTo(0, size.height * 0.6666667);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
