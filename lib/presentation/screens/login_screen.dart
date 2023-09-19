import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_roro/presentation/providers/counter_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:rive/rive.dart';

class LoginScreens extends ConsumerWidget {
  const LoginScreens({super.key});

  static const name = "login";
  @override
  Widget build(BuildContext context, ref) {
    final bool themeMode = ref.watch(themeapp);
    final TextEditingController phonController = TextEditingController();
    

    return Scaffold(
      body: Stack(
        children: [
           


          Padding(
            padding:
                const EdgeInsets.only(left: 4, right: 4, top: 5, bottom: 4),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(10),
                  color: const Color.fromRGBO(255, 255, 253, 1),
                  boxShadow: [
                    const BoxShadow(
                      color: Colors.red,
                      blurRadius: 25.0,
                      spreadRadius: 4
                    )
                  ]
                  
                    
                  ),
            ),
          ),
          Row(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 8),
                child: IconButton(
                    onPressed: () {
                      context.pop();
                    },
                    icon: const Icon(Icons.arrow_back)),
              ),
              const Spacer(),
              IconButton(
                  onPressed: () {},
                  icon: themeMode
                      ? const Icon(Icons.light_mode)
                      : const Icon(Icons.dark_mode)),
              const SizedBox(
                width: 20,
              )
            ],
          ),
          Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                const SizedBox(
                  height: 200,
                  width: 200,
                  child: RiveAnimation.asset(
                    "assets/images/login.riv",
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Registrate",
                  style: TextStyle(fontSize: 25),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text("Te enviaremos un codigo de autenticación"),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 360,
                  height: 60,
                  child: Padding(padding: const EdgeInsets.symmetric(vertical: 5),
                    child: TextFormField(
                      
                      controller: phonController,
                    decoration: InputDecoration(
                      filled: true,
                      hintText: "+57 Ingresa tu numero",fillColor:Colors.white38,
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(1),
                    borderSide: const BorderSide(color: Colors.black12)
                    
                    ),
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.black12)),
                    prefixIcon: Container(padding: const EdgeInsets.all(0.8),
                    child: InkWell(onTap: (){},
                   child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12 , horizontal: 12),
                     child: Image(
                       fit: BoxFit.fill,
                       image: AssetImage("assets/images/colombia.png", )),
                   )

                    
                    
                    ),
                    
                    ),
                   contentPadding:const EdgeInsets.symmetric(horizontal:10 ,vertical:-40 ), 
                     ),
                   
                    ),
                  )), 
                 const SizedBox(height: 20,),
                SizedBox(
                  width: 250,
                  child: FilledButton(
                    style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Color.fromRGBO(239, 98, 98, 1))),
                    onPressed: (){}, child:const Text("Enviame el codigo")))
                
              ],
            ),
          )
        ],
      ),
    );
  }
}
