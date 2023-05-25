import "package:flutter/material.dart";
import "package:src/screens/post_visu/components/tag.dart";

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(children: [
        
         Padding(
          padding: EdgeInsets.only(left: 15, right: 15, top: 100, bottom: 60),
            child: Text(
              'Machine Learning for Medicine',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "Roboto", 
                fontSize: 24,
                color: Color.fromARGB(255, 0, 42, 88)),
            ),
        ),

         Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "Roboto", 
              fontSize: 18,
              color: Color.fromARGB(255, 99, 99, 99)),
          ),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children:  [
            Tag(text: "Python"),
            Tag(text: "Automation"),
            Tag(text: "AI"),
          ]
          // children: [
          //   Padding(
          //     padding: const EdgeInsets.only(top: 70),
          //     child: SizedBox(
          //       height: 33,
          //       width: 91,
          //       child: DecoratedBox(
          //         decoration: BoxDecoration(
          //           color: const Color.fromARGB(255, 245, 246, 247),
          //           borderRadius: const BorderRadius.all(Radius.circular(20)),
          //           border: Border.all(width: 2.0, color: const Color.fromARGB(255, 49, 162, 227)),
          //           // borderColor: Color.fromARGB(255, 3, 52, 92),
          //         ),
          //         child: const Center(
          //           child: Text("Python",
          //               textAlign: TextAlign.center,
          //               style: TextStyle(
          //                   color: Color.fromARGB(255, 49, 162, 227),
          //                   fontSize: 13)),
          //         ),
          //       ),
          //     ),
          //   ),

          //   Padding(
          //     padding: const EdgeInsets.only(top: 70),
          //     child: SizedBox(
          //       height: 33,
          //       width: 91,
          //       child: DecoratedBox(
          //         decoration: BoxDecoration(
          //           color: const Color.fromARGB(255, 245, 246, 247),
          //           borderRadius: const BorderRadius.all(Radius.circular(20)),
          //           border: Border.all(width: 2.0, color: const Color.fromARGB(255, 49, 162, 227)),
          //           // borderColor: Color.fromARGB(255, 3, 52, 92),
          //         ),
          //         child: const Center(
          //           child: Text("Automation",
          //               textAlign: TextAlign.center,
          //               style: TextStyle(
          //                   color: Color.fromARGB(255, 49, 162, 227),
          //                   fontSize: 13)),
          //         ),
          //       ),
          //     ),
          //   ),

          //   Padding(
          //     padding: const EdgeInsets.only(top: 70),
          //     child: SizedBox(
          //       height: 33,
          //       width: 91,
          //       child: DecoratedBox(
          //         decoration: BoxDecoration(
          //           color: const Color.fromARGB(255, 245, 246, 247),
          //           borderRadius: const BorderRadius.all(Radius.circular(20)),
          //           // borderColor: Color.fromARGB(255, 3, 52, 92),
          //           // border: Border.all(width: 2.0, color: Color.fromARGB(255, 49, 162, 227)),
          //           border: Border.all(width: 2.0, color: const Color.fromARGB(255, 49, 162, 227)),
          //         ),
          //         child: const Center(
          //           child: Text("AI",
          //               textAlign: TextAlign.center,
          //               style: TextStyle(
          //                   color: Color.fromARGB(255, 49, 162, 227),
          //                   fontSize: 13)),
          //         ),
          //       ),
          //     ),
          //   ),

          // ],
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:  [
            Padding( 
              padding: EdgeInsets.only(left: 30, top: 100),
              child: Text(
                'Made by Sofia Pimazzoni',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily: "Roboto", 
                  fontSize: 15,
                  color: Color.fromARGB(255, 99, 99, 99)),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(right: 30, top: 100),
              child: Text(
                '03/09/2023',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily: "Roboto", 
                  fontSize: 15,
                  color: Color.fromARGB(255, 99, 99, 99)),
              ),
            ),
          ],
        )
      ],
    ));
  }
}


