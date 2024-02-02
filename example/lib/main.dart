import 'package:flutter/material.dart';
import 'package:layout_utils/layout_utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TestHome(),
    );
  }
}

class TestHome extends StatelessWidget {
  const TestHome({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, constraints, padding){
      return ResponsiveFrame(
        enableDefaultNavigationBar: true,
        defaultNavigationBarDecoration: const BoxDecoration(
            color: Colors.white
        ),
        defaultNavigationBarLeading: IconButton(onPressed: (){}, icon: const Icon(Icons.menu)),
        defaultNavigationBarTitle: const Text('Responsive Menu Bar', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.black),),
        defaultNavigationBarMenus: [
          Text('Home', style: TextStyle(fontSize: 16),),
          const SizedBox(width: 10,),
          Text('About Us',  style: TextStyle(fontSize: 16)),
          const SizedBox(width: 10,),
          Text('Contact Us',  style: TextStyle(fontSize: 16)),
        ],

        desktopLayout: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: constraints.maxWidth * 0.5,
                width: constraints.maxWidth,
                color: const Color(0xff3b0f4dff),

                child: Padding(padding: EdgeInsets.symmetric(horizontal: padding), child: Row(
                  children: [
                    Expanded( flex: 2, child: Text('Hello World!', style: Theme.of(context).textTheme.titleLarge,)),

                    Expanded( flex: 4, child: Container(color: Colors.red,))
                  ],
                ),),
              ),

              Container(
                height: constraints.maxWidth * 0.5,
                width: constraints.maxWidth,
                color: Colors.grey,
              ),
            ],
          ),
        ),
        tabletLayout: Container(
          color: Colors.green,
        ),
        mobileLayout: Container(
          color: Colors.blue,
        ), constraints: constraints,
      );
    });
  }
}
