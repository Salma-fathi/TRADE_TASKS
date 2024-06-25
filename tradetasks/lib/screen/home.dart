import 'package:flutter/material.dart';
import 'package:tradetasks/Compont/colors.dart';

class TradeTasks extends StatefulWidget {
  const TradeTasks({Key? key}) : super(key: key);

  @override
  State<TradeTasks> createState() => _TradeTasksState();
}

class _TradeTasksState extends State<TradeTasks> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF2DABAB),
                    Color(0xFF00757E),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                children: [
                  Image(
                      image: AssetImage('lib/images/path.png'),
                      height: 70,
                      width: 70),
                  SizedBox(height: 20),
                  Text('BALANCE TASK',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 12)),
                ],
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [_buildHeader(), _buildGridMenu(), _buildSettingsButton()],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(50),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.dashboard, color: Colors.white),
                onPressed: () {
                  _scaffoldKey.currentState?.openDrawer();
                },
              ),
              const Text(
                'Dashboard',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 48),
            ],
          ),
          const SizedBox(height: 20),
          const Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('lib/images/image.png'),
              ),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Good Morning',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  Text(
                    'Mr. David Johns',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildGridMenu() {
    return Expanded(
      child: GridView.count(
        padding: const EdgeInsets.all(16),
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        children: [
          _buildMenuItem(
              const AssetImage('lib/images/schedule.png'), 'Schedule'),
          _buildMenuItem(
              const AssetImage('lib/images/book job.png'), 'Book a job'),
          _buildMenuItem(const AssetImage('lib/images/account_manger.png'),
              'Account Manager'),
          _buildMenuItem(const AssetImage('lib/images/social.png'),
              'Social Media Manager'),
          _buildMenuItem(
              const AssetImage('lib/images/card.png'), 'Send Business Card'),
          _buildMenuItem(const AssetImage('lib/images/update_profile.png'),
              'Update My Profile'),
        ],
      ),
    );
  }

  Widget _buildMenuItem(ImageProvider image, String label) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: image,
            width: 50,
            height: 50,
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsButton() {
    return CustomPaint(
      size: const Size(350.28, 150.5),
      painter: MyCurvePainter(),
      child: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
            fixedSize: const Size(80, 30),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            padding: EdgeInsets.zero,
            textStyle: const TextStyle(fontSize: 12),
          ),
          onPressed: () {},
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.settings,
                color: AppColors.lightCyan,
                size: 12,
              ),
              SizedBox(width: 4),
              Text(
                'Settings',
                style: TextStyle(
                  color: AppColors.lightCyan,
                  fontSize: 10,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



class MyCurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.primaryColor
      ..style = PaintingStyle.fill
      ..strokeWidth = 5.0
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..strokeMiterLimit = 100.0;

    // Create a Path object
    final path = Path();

    // Start at the top-left corner
    path.moveTo(size.width, size.height);

    // Draw a quadratic Bezier curve
    path.quadraticBezierTo((size.width ) / 2,0.0,0.0, size.height);

    // Draw the path on the canvas
    canvas.drawPath(path, paint);
    paint.color = AppColors.lightCyan;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

