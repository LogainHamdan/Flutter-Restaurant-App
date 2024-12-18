import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'login.dart';
import 'register.dart';

class JoinScreen extends StatefulWidget {
  static const String id = '/join';

  const JoinScreen({Key? key}) : super(key: key);

  @override
  State<JoinScreen> createState() => _JoinScreenState();
}

class _JoinScreenState extends State<JoinScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final ValueNotifier<int> selectedTab = ValueNotifier<int>(0); // Shared state

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      selectedTab.value = _tabController.index; // Update tab state
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // Title of your screen
      ),
      body: SingleChildScrollView(
        // This allows scrolling when content overflows
        child: Column(
          children: [
            Icon(
              Icons.fastfood_rounded,
              size: 150,
              color: Colors.deepPurple[400],
            ), // Your image here
            SizedBox(height: 60),
            // TabBar and TabBarView within a fixed-height container
            selectedTab.value != 0
                ? Container(
                    height: 400, // Adjust the height to your needs
                    child: Stack(
                      children: [
                        AnimatedContainer(
                          height: 200,
                          width: MediaQuery.sizeOf(context).width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(35),
                                  topLeft: Radius.circular(35)),
                              gradient: LinearGradient(colors: [
                                Colors.deepPurple[400]!,
                                Colors.grey[400]!
                              ])),
                          duration: const Duration(milliseconds: 500),
                        ),
                        AnimatedContainer(
                          margin: EdgeInsets.only(top: 65),
                          height: 200,
                          width: MediaQuery.sizeOf(context).width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(35),
                                topLeft: Radius.circular(35)),
                            color: Colors.white,
                          ),
                          duration: const Duration(milliseconds: 500),
                        ),
                        // TabBar with no indicator line
                        TabBar(
                          controller: _tabController,
                          indicatorColor:
                              Colors.transparent, // No indicator line
                          labelColor: Colors.white,

                          labelStyle: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20.0,
                            fontFamily: 'frank',
                          ),
                          unselectedLabelStyle: TextStyle(
                            color: Colors.grey[400]!.withOpacity(0.2),
                            fontWeight: FontWeight.w600,
                            fontFamily: 'frank',
                            fontSize: 20.0,
                          ),
                          tabs: const <Widget>[
                            Tab(text: "Login"),
                            Tab(text: "Create Account"),
                          ],
                        ),
                        // TabBarView
                        Positioned(
                          top:
                              100, // Adjust the positioning to fit under the TabBar
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: TabBarView(
                            controller: _tabController,
                            children: [
                              Login(selectedTab: selectedTab.value),
                              Register(selectedTab: selectedTab.value),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                : Container(
                    // Fixed height for TabBar and TabBarView
                    // height: 500, // Adjust the height to your needs
                    child: Stack(
                      children: [
                        AnimatedContainer(
                          height: 500,
                          width: MediaQuery.sizeOf(context).width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(35),
                                  topLeft: Radius.circular(35)),
                              color: Colors.deepPurple[400]),
                          duration: const Duration(milliseconds: 500),
                        ),
                        AnimatedContainer(
                          height: 500,
                          width: MediaQuery.sizeOf(context).width,
                          margin: EdgeInsets.only(top: 70),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(35),
                                topLeft: Radius.circular(35)),
                            color: Colors.white,
                          ),
                          duration: const Duration(milliseconds: 500),
                        ),
                        // TabBar with no indicator line
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TabBar(
                            dividerHeight: 0,
                            controller: _tabController,
                            indicator: BoxDecoration(), // No indicator line
                            labelColor: Colors.white,
                            unselectedLabelColor: Colors.grey,
                            labelStyle: const TextStyle(
                              fontSize: 20.0,
                              fontFamily: 'frank',
                            ),
                            unselectedLabelStyle: const TextStyle(
                              fontFamily: 'frank',
                              fontSize: 20.0,
                            ),
                            tabs: const <Widget>[
                              Tab(text: "Login"),
                              Tab(text: "Create Account"),
                            ],
                          ),
                        ),
                        // TabBarView
                        Positioned(
                          top:
                              100, // Adjust the positioning to fit under the TabBar
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: TabBarView(
                            controller: _tabController,
                            children: [
                              Login(selectedTab: selectedTab.value),
                              Register(selectedTab: selectedTab.value),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
