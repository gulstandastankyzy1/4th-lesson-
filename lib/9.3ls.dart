import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyPage(),
    ),
  );
}

// 1. InheritedWidget
class CounterInherited extends InheritedWidget {
  final int count;
  final VoidCallback plus;
  final VoidCallback minus;

  const CounterInherited({
    required this.count,
    required this.plus,
    required this.minus,
    required super.child,
  });

  static CounterInherited of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CounterInherited>()!;
  }

  @override
  bool updateShouldNotify(CounterInherited oldWidget) {
    return count != oldWidget.count;
  }
}

// 2. Родитель, который хранит count
class MyPage extends StatefulWidget {
  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  int count = 0;

  void plus() {
    setState(() {
      count++;
    });
  }

  void minus() {
    setState(() {
      count--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inherited Widget'),
      ),

      body: CounterInherited(
        count: count,
        plus: plus,
        minus: minus,

        child: Column(
          children: [
            SizedBox(height: 30),

            Text(
              'Root Widget',
              style: TextStyle(fontSize: 30),
            ),

            Text(
              '$count',
              style: TextStyle(fontSize: 40),
            ),

            SizedBox(height: 50),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ChildWidget(),
                ChildWidget(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// 3. Child Widget
class ChildWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counter = CounterInherited.of(context);

    return Container(
      width: 150,
      height: 180,
      color: Colors.yellow,

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Child Widget',
            style: TextStyle(fontSize: 18),
          ),

          Text(
            '${counter.count}',
            style: TextStyle(fontSize: 35),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: counter.minus,
                icon: Icon(Icons.remove),
              ),

              IconButton(
                onPressed: counter.plus,
                icon: Icon(Icons.add),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// void main() {
//   runApp(MaterialApp(home: MyPage()));
// }

// class Inherited extends InheritedWidget {
//   final int count;
//   final VoidCallback plus;
//   final VoidCallback minus;

//   const Inherited({
//     required this.count,
//     required this.plus,
//     required this.minus,
//     required super.child,
//   });
//   static Inherited of(BuildContext context) {
//     return context.dependOnInheritedWidgetOfExactType<Inherited>()!;
//   }

//   @override
//   bool updateShouldNotify(covariant Inherited oldWidget) {
//     return count != oldWidget.count;
//   }
// }

// class MyPage extends StatefulWidget {
//   @override
//   State<MyPage> createState() => _MyPage();
// }

// class _MyPage extends State<MyPage> {
//   int count = 0;

//   void plus() {
//     setState(() {
//       count++;
//     });
//   }

//   void minus() {
//     setState(() {
//       count--;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Inherited Widget')),

//       body: Inherited(
//         count: count,
//         plus: plus,
//         minus: minus,
//         child: Column(
//           children: [
//             SizedBox(height: 30),

//             Text('Root Widget', style: TextStyle(fontSize: 30)),

//             Text('$count', style: TextStyle(fontSize: 40)),

//             SizedBox(height: 40),

//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [ChildWidget(), ChildWidget()],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class ChildWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final counter = Inherited.of(context);
//     return Container(
//       width: 150,
//       height: 180,
//       color: Colors.yellow,

//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text('Child Widget', style: TextStyle(fontSize: 30)),

//           Text('${counter.count}', style: TextStyle(fontSize: 20)),

//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,

//             children: [
//               IconButton(onPressed: counter.minus, icon: Icon(Icons.remove)),

//               IconButton(onPressed: counter.plus, icon: Icon(Icons.add)),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
