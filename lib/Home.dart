import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<MyApp> {
  TextEditingController _textControler = TextEditingController();

var imagem = AssetImage("assets/picture.ico");
var texto  = "IMAGE";
String nomeCidade="";
var _cidades =['Spotify','Telegram','Youtube','Facebook'];
var _itemSelecionado = 'Spotify';

  void cliclou(String escolha, int valor) {
    print(escolha);
    switch (valor) {
      case 0:
        setState(() {
          this.imagem = AssetImage("assets/whatsapp.ico");
        });
        break;
      case 1:
        setState(() {
          this.imagem = AssetImage("assets/instagram.ico");
        });
        break;
      case 2:
        setState(() {
          this.imagem = AssetImage("assets/twitch.ico");
        });
        break;
    }
  }

  void _dropDownItemSelected(String novoItem){
       setState(() {
        this._itemSelecionado = novoItem;
         switch (novoItem) {
      case "Spotify":
        setState(() {
          this.imagem = AssetImage("assets/spotify.ico");
          this.texto = "Spotify";
        });
        break;
      case "Telegram":
        setState(() {
          this.imagem = AssetImage("assets/telegram.ico");
          this.texto = "Telegram";
        });
        break;
      case "Youtube":
        setState(() {
          this.imagem = AssetImage("assets/youtube.ico");
          this.texto = "youtube";
        });
        break;
        case "Facebook":
        setState(() {
          this.imagem = AssetImage("assets/facebook.ico");
          this.texto = "Facebook";
        });
    }

        
       });
   }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       
        appBar: AppBar(
          title: Text("TROCANDO IMAGENS"),
          backgroundColor: Colors.blue,
        ),
        body: Container(
          padding: EdgeInsets.all(10),

          decoration: BoxDecoration(
            border: Border.all(color: Colors.amber, width: 3),
          ),
          
          child: Column(
            
            crossAxisAlignment: CrossAxisAlignment.center,
            
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[

              Padding(
                padding: EdgeInsets.only(bottom: 5),
                child: Image(
                  image: imagem,
                  width: 150,
                  height: 150,
                  alignment: Alignment.center,
                ),
              ),
              
              Padding(
                padding: EdgeInsets.only(bottom: 7),
                child: Text(this.texto, 
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'LexendPeta',
                  color: Colors.red
                ),)),
              
              Padding(
              padding: const EdgeInsets.only(left: 40,top: 20,right: 40, bottom: 20),
              child:Text("Clike nos botões para trocar a imagens ou selecione:",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'LexendPeta'),
                ),),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  
                  RaisedButton(
                    onPressed: () {
                      setState(() {
                        this.imagem = AssetImage("assets/whatsapp.ico");
                        this.texto = "whatsapp";
                      });
                    },
                    child: Text("B1"),
                  ),
                  
                  RaisedButton(
                    onPressed: () {
                      setState(() {
                        this.imagem = AssetImage("assets/instagram.ico");
                        this.texto = "instagram";
                      });
                    },
                    child: Text("B2"),
                  ),
                  
                  RaisedButton(
                    onPressed: () {
                      setState(() {
                        this.imagem = AssetImage("assets/twitch.ico");
                        this.texto = "twitch";
                      });
                    },
                    child: Text("B3"),
                  ),

                  Padding(padding:const EdgeInsets.only(top: 50,bottom: 50,)),
                ],
              ),
              
              // GestureDetector(
              //   onTap: () => cliclou("Tap...", 0),
              //   onDoubleTap: () => cliclou("Clique no Double Tap...", 1),
              //   child: Image.asset(
              //     "assets/whatsapp.ico",
              //     width: 40,
              //   ),
              // ),

      
            DropdownButtonHideUnderline(child: ButtonTheme(
            alignedDropdown: true,
            child: 
            DropdownButton<String>(

             items : _cidades.map((String dropDownStringItem) {
               return DropdownMenuItem<String>(
                 value: dropDownStringItem,
                 child: Text(dropDownStringItem),
                );
             }).toList(),

             isExpanded: true,

             icon: Icon(Icons.arrow_downward),
             iconSize: 24,

             underline: Container(
             height: 10,
             color: Colors.deepPurpleAccent,),

             style: Theme.of(context).textTheme.title,

             onChanged: ( String novoItemSelecionado) {
               _dropDownItemSelected(novoItemSelecionado);
               setState(() {
                this._itemSelecionado =  novoItemSelecionado;
               });
             },

             value: _itemSelecionado
           ),),)
            
              
              
           //Text("A plataforma selecionada foi  \n$_itemSelecionado", style: TextStyle(fontSize: 20.0),),
              
              // TextField(
              //   //keyboardType: TextInputType.number, 
              //   decoration: InputDecoration(labelText: "Escolha uma imagem?"),
              //   // enabled: true,
              //   // maxLength: 1,
              //   // maxLengthEnforced: true,
              //   style: TextStyle(
              //     fontSize: 25,
              //     color: Colors.green,
              //   ),
              //   obscureText: false,
              //   onChanged: (String text) {
              //     print("Valor digitado = " + text);
              //   },
              //   onSubmitted: (String texto) {
              //     print("Valor submetido = " + texto);
              //     cliclou("submited", int.parse(texto));
              //   },
              //   controller: _textControler,
              // )


            ],
          ),
        ));
  }
}
