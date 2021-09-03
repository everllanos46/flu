import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  const AvatarPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(  
        appBar: AppBar(
          title: Text("Page 2"),
          backgroundColor: Colors.amber,
          actions:<Widget> [
            Container(
              padding: EdgeInsets.all(3.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage('https://fiverr-res.cloudinary.com/images/q_auto,f_auto/gigs/130238819/original/d4096d4950eba421600f21c6c753c19375222eb6/draw-you-a-landscape-image-with-ms-paint.png'),
                
              ),
            ),
          ],
        ),
      
    );
  }
}