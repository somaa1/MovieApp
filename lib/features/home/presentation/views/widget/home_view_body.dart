
 import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_styles.dart';

class HomeViewBody extends StatelessWidget {
   const HomeViewBody({super.key});

   @override
   Widget build(BuildContext context) {
     return Center(
       child: Column(
       children: [
         SizedBox(height: 140,),
         Text('home',style: TextStyle(fontSize: 26),),

       ],
       ),
     );
   }

 }

