import 'package:flutter/material.dart';
import 'package:s_i_h/pages/contactPage.dart';



class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePage();
}

class _homePage extends State<homePage> {
  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 3, 
      child:Scaffold(      
      appBar:AppBar(
        automaticallyImplyLeading: false,
        
        actions:
        [
          
              GestureDetector(
                onTap: (){
                 
                },
                child: CircleAvatar(radius: 20)
                ),
             SizedBox(width: 15,)
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(40),
          
          child: TabBar(
            isScrollable: true,
            indicatorWeight: 10, 
            indicatorColor: Colors.white,
            //indicatorSize: TabBarIndicatorSize.label,
            tabAlignment: TabAlignment.start,
            tabs: [
            Tab(
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  width: 100,
                  child: Text("Home",style: TextStyle(fontSize: 16),)),),
            // text: 'Events',
             // child: Text("Events",style: TextStyle(fontSize: 20),),
            ),
           
            
              Tab(
                 child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 100,
                    child: Text("Location",style: TextStyle(fontSize: 16),)),),
             //   text: 'Members',
                //child: Text("Members",style: TextStyle(fontSize: 20),),
            ),
               Tab(
                 child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 100,
                    child: Text("Camera View",style: TextStyle(fontSize: 16),)),),
             //   text: 'Members',
                //child: Text("Members",style: TextStyle(fontSize: 20),),
            ),
          ]),
        ),
      ),
      body: TabBarView(children: [
          contactPage(),
        Container(
             child:Text("")
        ),
       
        Container(
             child:Text("")
        ),
      ]),
    )
    );
  }
}

