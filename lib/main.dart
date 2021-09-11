import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('TabBar using flutter_hooks'),
        ),
        body: TabBarViewWidget(),
      ),
    );
  }
}

class TabBarViewWidget extends HookWidget {
  TabBarViewWidget({Key? key}) : super(key: key);

  /// list of tab bar
  final List<Widget> tabList = [
    const Tab(child: Text('Tab 1')),
    const Tab(child: Text('Tab 2')),
    const Tab(child: Text('Tab 3')),
  ];

  @override
  Widget build(BuildContext context) {
    final _controller = useTabController(initialLength: tabList.length);
    return Column(
      children: [
        /// tabbarを表示
        TabBar(
          controller: _controller,
          tabs: tabList,
          labelColor: Theme.of(context).primaryColor,
        ),
        Expanded(
          child: TabBarView(
            controller: _controller,

            /// body of tab
            children: const [
              Center(child: Text('Tab 1 View')),
              Center(child: Text('Tab 2 View')),
              Center(child: Text('Tab 3 View')),
            ],
          ),
        )
      ],
    );
  }
}
