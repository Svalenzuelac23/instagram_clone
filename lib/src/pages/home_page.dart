import 'package:flutter/material.dart';

import 'package:flutter_icons/flutter_icons.dart';
import 'package:instagram_clone/src/models/post_model.dart';
import 'package:instagram_clone/src/models/stories_model.dart';
import 'package:instagram_clone/src/prividers/posts_provider.dart';
import 'package:instagram_clone/src/prividers/stories_provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  StoriesProvider storiesProvider = new StoriesProvider();
  PostProvider postProvider = new PostProvider();   
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {  

    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),  
      appBar: _appBar(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            //Divider(color: Colors.grey, thickness: 0.5),
            _labels(),                
            _stories(),
            Divider(color: Colors.grey, thickness: 0.5 , height: 0.0),
            _posts(),
          ],
        ),          
      ),       
      bottomNavigationBar: _tapBar(),
    );
  }

  

  Widget _appBar() {
    return AppBar(
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(0.5),
        child: Container(
          color: Colors.black38,
          height: 0.75,
        ),
      ),
      elevation: 0,
      backgroundColor: Color(0xFFF9F9F9),  
      brightness: Brightness.light,
      centerTitle: true,
      title: Container(
        margin: EdgeInsets.only(top: 10.0),
        child: SizedBox(
          height: 40.0,
          child: Image.asset('assets/img/logo-instagram.png')
        ),
      ) ,     
      leading: IconButton(
        onPressed: (){},
        icon: Icon( Feather.camera, color: Colors.black, size: 30.0 ),
      ),
      actions: <Widget>[
        IconButton(
          onPressed: (){},
          icon: Icon( Feather.tv , color: Colors.black ,size: 28.0 ),
        ),
        IconButton(
          onPressed: (){},
          icon: Icon( FontAwesome.send_o, color: Colors.black, size: 28.0  ),
        ),
      ],
    );
  }

  Widget _labels() {
    return Container(
      margin: EdgeInsets.only( top: 5.0, left: 15.0, right: 15.0 ),
      //margin: EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('Stories', style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold)),
          Row(                   
            children: <Widget>[                        
              GestureDetector(
                onTap: (){},
                child: Icon(Icons.arrow_right)
              ),
              Text('Watch All', style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold)),
            ],
          )
        ],
      ),
    );
  }

  Widget _stories(){    

    return Container(      
      width: double.infinity ,
      margin: EdgeInsets.only(top: 10.0 , left: 5.0),
      // margin: EdgeInsets.symmetric(vertical: 10.0),
      height: 105.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: storiesProvider.getStories().map(( storie ) {
          return _createStorie(storie);
        }).toList()
      ),
    );

  }

  Widget _createStorie(Storie storie) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(horizontal: 8.0),              
          decoration: BoxDecoration(                 
            borderRadius: BorderRadius.circular(50.0),
            border: Border.all(
              width: 3,
              color: Color(0xFF8e44ad),
            ) 
          ),
          child: Container(
            padding: EdgeInsets.all(2.0),
            child: ClipRRect (
              borderRadius: BorderRadius.circular(50.0),
              child: Image(
                image: NetworkImage( storie.photo ),
                height: 65.0,
                width: 65.0,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(height: 6.0),
        Text( 
          storie.name,
          overflow:TextOverflow.ellipsis,
          style: TextStyle(fontSize: 13.0),
        )
      ],
    );
  }

  Widget _posts(){

    return Container(
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics() ,
        itemCount: postProvider.getPosts().length,
        itemBuilder: (context , i){
          return _createPost( postProvider.getPosts()[i] ) ;                         
        },
      ),
    );
  }

  Widget _createPost( Post post ){

    List<Widget> userLikes = [];
    userLikes.add( Text( 'Liked by ' ) );

    int count = 1;
    int qtyUserLikes = post.topsLikes.length;

    post.topsLikes.forEach(( user ) {
      Widget _temp = Text( 
        count != qtyUserLikes ? user + ", " : user,
        style: TextStyle( 
          fontWeight:  FontWeight.bold
        ),  
      );
      userLikes.add(_temp);
      count == qtyUserLikes ? userLikes.add( Text( ' and  ') ) : null ;
      count == qtyUserLikes ? userLikes.add( Text( '${post.likes} others' , style: TextStyle( fontWeight: FontWeight.bold , fontSize: 18.0))) : null ;
      count++;
    });


    return Container(
      child: Column(
        children: <Widget>[

          Container( //POST USER
            color: Colors.white,
            child: Row(              
              children: <Widget>[

                Container(
                  padding: EdgeInsets.only(top: 12.0 , left: 18.0, bottom: 12.0, right: 12.0 ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50.0),
                    child: Image(
                      image: NetworkImage( post.userPhoto ),
                      height: 45.0,
                      width: 45.0,
                    ),
                  ),
                ),

                Text( 
                  post.userName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0
                  ),
                ),

                Expanded(child: SizedBox()),

                IconButton(
                  icon: Icon( Icons.more_horiz ),
                  iconSize: 30.0,
                  onPressed: (){},
                ),                
              ],
            ),
          ),

          FadeInImage( //POST IMAGE
            image: NetworkImage( post.postPhoto ),
            placeholder: AssetImage('assets/img/loading.gif'),
          ),

          Container( //ICONS ACTIONS
            padding: EdgeInsets.only(top:5.0, left: 7.0, right: 7.0, bottom: 0.0),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[

                Row(
                  children: <Widget>[
                    IconButton(
                      icon: Image(
                        image: AssetImage('assets/img/heart.png'),
                        width: 30.0,
                      ),
                      onPressed: (){},
                    ),
                    IconButton(
                      icon: Image(
                        image: AssetImage('assets/img/comment.png'),
                        width: 28.0,
                      ),
                      onPressed: (){},
                    ),
                    IconButton(
                      icon: Image(
                        image: AssetImage('assets/img/send.png'),
                        width: 29.0,
                      ),
                      onPressed: (){},
                    )
                  ],
                ),

                IconButton(
                  icon: Image(
                    image: AssetImage('assets/img/save_o.png'),
                    width: 27.0,
                  ),
                  onPressed: (){},
                )
                               
              ],
            ),
          ),
          
          Container( // USER LIKES
            padding: EdgeInsets.only(left: 17.0, right: 17.0 , bottom: 10.0  ),
            color: Colors.white,
            child: Row(
              children:  userLikes,              
            ),          
          ),

          Container( // CAPTION            
            color: Colors.white,
            width: double.infinity,            
            padding: EdgeInsets.only(left: 17.0, right: 17.0 , bottom: 10.0  ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                RichText(                  
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "${post.userName} ",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0
                        )                  
                      ),
                      TextSpan(
                        text: "${post.caption} ",
                        style: TextStyle(
                          color: Colors.black                      
                        )                  
                      ),
                    ]
                  ),
                ),

                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.symmetric(vertical : 10.0),
                  child: Text( 
                    post.date , 
                    style: TextStyle( 
                      color: Colors.grey,
                      fontSize: 18.0
                    ),
                  )
                )
              ],
            )
            
            
            //Text( "${post.userName} ${post.caption}", maxLines: 2, overflow: TextOverflow.ellipsis, textAlign: TextAlign.justify, )           
          ),
        ],
      ),
    );

  }

  Widget _tapBar() {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.black38,
            width: 0.75
          )
        )
      ),
      child: BottomNavigationBar(
        elevation: 0.0,
        iconSize: 28.0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.black,
        backgroundColor: Color(0xFFF9F9F9),       
        currentIndex: currentPage,
        type: BottomNavigationBarType.fixed,
        onTap: (i){
          setState(() {
            currentPage = i;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon( AntDesign.home ),            
            title: Text('Home')
          ),
          BottomNavigationBarItem(
            icon: Icon ( Feather.search),
            title: Text('Search')
          ),
          BottomNavigationBarItem(
            icon: Icon ( Feather.plus_square),
            title: Text('Upload')
          ),
          BottomNavigationBarItem(
            icon: Icon ( Feather.heart),
            title: Text('Likes')
          ),
          BottomNavigationBarItem(
            icon: Icon( Feather.user ),
            title: Text('Account')
          )
        ],
      ),
    );
  }

}