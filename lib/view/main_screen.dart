import 'package:flutter/material.dart';
import 'package:meme_app/Controller/fetch_meme.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String imageUrl="";
  int memeCount=0;
  bool isLoading=true;
  bool isTarget = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSingleMeme();
  }

  void getSingleMeme()async {
    memeCount=memeCount+1;
    String getImgUrl = await FetchMeme().getMeme();
    setState(() {
      imageUrl = getImgUrl;
      isLoading=false;
    });
    if(memeCount==100){
      Future.delayed(Duration(seconds: 10));
      isTarget = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:isLoading || imageUrl=="" || imageUrl==null ?
      Container(
        width: 200,
        height:200,
        child: CircularProgressIndicator(),
    ) :
      Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xFFC9FFBF),
              Color(0xffffafbd)
            ]
          ),
        ),
        child: Center(
          child:isTarget ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Congratulation",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.orange),),
              Container(height: 10,),
              Text("Target Is Completed", style:TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: ElevatedButton(onPressed: (){
                  isTarget=false;
                  getSingleMeme();
                  },
                    child: Text("Continue")),
              ),
            ],
          ) :
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 150,),
              // Todo:Meme Count
              Padding(
                padding:EdgeInsets.only(bottom: 10),
                child: Text("MEME ${memeCount}",style: TextStyle(fontSize:40,color:Colors.red,fontWeight: FontWeight.bold),),
              ),
              // Todo:Target Meme Number
              Padding(
                padding: EdgeInsets.only(bottom: 40),
                child: Text("Target 100 MEME",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
              ),
              // Todo: Image box
              imageUrl==null ? Container(
                width: 200,
                height:200,
                child: CircularProgressIndicator(),
              ):Image.network(height:350,fit: BoxFit.fitHeight,imageUrl),
              // Todo:Button using inkwell
              Padding(
                padding: EdgeInsets.only(top: 40),
                child: InkWell(
                  onTap: (){
                    getSingleMeme();
                  },
                  child: Container(
                    width: 160,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.red.shade500,
                      border: Border.all(
                        color: Colors.red,
                        width: 2,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.red,
                          blurRadius: 5,
                        )
                      ],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(child: Text("Get Meme",
                      style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),)),
                  ),
                ),
              ),
              Spacer(),
              // Todo:Footer
              Container(
                margin: EdgeInsets.only(top: 100),
                child: Text("Meme App Created By",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
              ),
              Text("Ayush Garg",style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),),
              SizedBox(height: 30,),
            ],
        
          )
        ),
      ),
    );
  }
}
