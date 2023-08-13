import 'package:flutter/material.dart';
import 'package:calc_if/widgets/box_transparent.dart';

class BoxRedesSociais extends StatelessWidget {
  final String nomeDaRedeSocial;
  final String logoDaRedeSocial;
  final String fotoDePerfil;
  final String username;

  const BoxRedesSociais({
    super.key,
    required this.nomeDaRedeSocial,
    required this.logoDaRedeSocial,
    required this.fotoDePerfil,
    required this.username,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 30.0
      ),
      child: BoxTransparent(
        conteudo: SizedBox(
          width: MediaQuery.sizeOf(context).width <= 385
              ? MediaQuery.sizeOf(context).width * 0.93
              : MediaQuery.sizeOf(context).width <= 460 
                      ? MediaQuery.sizeOf(context).width * 0.9
                      : MediaQuery.sizeOf(context).width * 0.85,
          child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: CircleAvatar(
                            child: ClipOval(
                              child: Image.asset(
                                logoDaRedeSocial,
                              ),
                            ),
                            radius: 18.5,
                          ),
                        ),
                        Text(
                          nomeDaRedeSocial,
                          style: const TextStyle(
                            fontSize: 21,
                          )
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 20.0, 
                        bottom: 7.0, 
                        left: 2.0, 
                        right: 2.0,
                      ),
                      child: BoxTransparent(
                        conteudo: Padding(
                          padding: const EdgeInsets.all(7.5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                child: ClipOval(
                                  child: Image.asset(
                                    fotoDePerfil,
                                  ),
                                ),
                                radius: 30,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  '@$username',
                                  style: const TextStyle(fontSize: 17),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ),
        ),
    );
  }
}
