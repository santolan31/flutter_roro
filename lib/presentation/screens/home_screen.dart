import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_roro/presentation/screens/login_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart';

final slides = <Slideinfo>[
  Slideinfo(
      "Welcome to Roro",
      "Bienvenido a Roro una aplicación que lo tiene todo ",
      "assets/images/corazon.riv"),
  Slideinfo(
      "Chat wit uss",
      "Envía regalos Personalizados por medio de nuestro chat",
      "assets/images/gift.riv"),
  Slideinfo(
      "Take you delivery whit us",
      "Pide tus domiciolios desde donde quieras ",
      "assets/images/delivery-bike.riv")
];

class Slideinfo {
  final String title;
  final String caption;
  final String url;

  Slideinfo(this.title, this.caption, this.url);
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const name = "home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController pageViewController = PageController();
  bool endReach = false;
  @override
  void initState() {
    super.initState();

    pageViewController.addListener(() {
      final page = pageViewController.page ?? 0;
      if (!endReach && page >= (slides.length - 1.5)) {
        setState(() {
          endReach = true;
        });
      }
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: PageView(
            scrollDirection: Axis.horizontal,
            controller: pageViewController,
            physics: const BouncingScrollPhysics(),
            children: slides
                .map((slideData) => _Slide(
                    title: slideData.title,
                    caption: slideData.caption,
                    url: slideData.url))
                .toList(),
          ),
        ),
        endReach
            ? Positioned(
                bottom: 90,
                right: 50,
                child: FadeInRight(
                  from: 15,
                  delay: const Duration(milliseconds: 400),
                  child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          elevation: 10,
                          backgroundColor: Theme.of(context).primaryColor),
                      onPressed: () => context.pushNamed(LoginScreens.name),
                      icon: const Icon(Icons.arrow_right_alt_outlined,
                          color: Colors.white),
                      label: const Text(
                        "Get Start",
                        style: TextStyle(color: Colors.white),
                      )),
                ))
            : const SizedBox()
      ],
    );
  }
}

class _Slide extends StatelessWidget {
  const _Slide({super.key, required this.title, required this.caption, required this.url});

  final String title;
  final String caption;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.symmetric(),
    child: Center(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(),
            child: Material(
              elevation: 10,
              child: Container(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 227, 82, 82)
                ),
              ),
            ),
          ),

          //* Background de la aplicación
          Padding(
            padding:const EdgeInsets.only(top: 5 ,left:6 , right: 6 , bottom: 4 ) ,
            child: Container(

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadiusDirectional.circular(10)
              ),
              
            ),
          ), 
         
         Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50,),
           child: Column(
            
                 children: [    
            const SizedBox(height: 20,),
          //*Titulo
          SizedBox(
            height: 100,
            width: 100,
            child: Image.asset("assets/images/titulo.png",fit: BoxFit.cover,), 
            
            ) ,       


           const SizedBox(
            height: 10,
            
           ), 
          //* Imagenes de el scroll horizontal
           SizedBox(
            height:120 ,
            width:120 ,
             child: RiveAnimation.asset(url,
             fit:BoxFit.fill,),
           ),
         
            const SizedBox(height: 20,),  
         
         //* subtitulo
           Text(title,maxLines: 2, style: const TextStyle(
             color: Color.fromRGBO(252, 200, 209, 1),
             fontSize: 30),),
            const SizedBox(height: 20,),
         //* texto  
             Text( caption, style: GoogleFonts.aclonica(
              fontSize: 20,
              color:Colors.white
             )
             
             
             ,) 
                 
                 
           
                 ],
                 
                 
                 ),
         )
        ],
      ),
    ),
    
    );
  }
}
