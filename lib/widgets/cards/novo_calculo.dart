import 'package:flutter/material.dart';
import 'package:calc_if/views/criar_calculo.dart';
import 'package:calc_if/widgets/botao.dart';

class NovoCalculo extends StatelessWidget {
  const NovoCalculo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(17.0),
        child: Container(
          height: 535,
          width: MediaQuery.sizeOf(context).width * 0.8,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(50.0)),
            color: const Color.fromARGB(255, 190, 201, 255),
            boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.grey.shade700,
                    blurRadius: 9,
                    spreadRadius: 0.1,
                    offset: const Offset(4, 4)),
                // BoxShadow(
                //     color: Colors.white,
                //     blurRadius: 25,
                //     spreadRadius: 0.5,
                //     offset: Offset(-2, -2))
              ]),
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                const Text(
                  'Não está conseguindo calcular sua nota com as opções apresentadas?',
                  style: TextStyle(
                    fontSize: 22,
                  )
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 30.0),
                  child: Text(
                    'Crie seu próprio método de calculo criando a quantidade de campos que precisar e atribuindo pesos personalizados as notas se necessário',
                    style: TextStyle(
                      fontSize: 15,
                    )
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 65.0),
                  child: Botao(
                    texto: 'Criar', 
                    acao: () {
                      Navigator.push(
                        context, MaterialPageRoute(builder: (context) => const CriarCalculo())
                      );
                    }
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
