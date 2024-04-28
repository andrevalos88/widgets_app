import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class SnackBarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';

  const SnackBarScreen({super.key});

  void showCustomSnackBar(BuildContext context){
    ScaffoldMessenger.of(context).clearSnackBars();
    final snackbar = SnackBar(
        content: const Text('Hola mundo'),
        action: SnackBarAction(
          label: 'Ok!', 
          onPressed: (){

        }),
        duration: const Duration(seconds: 2),
      );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void openDialog(BuildContext context){
    showDialog(context: context, 
    barrierDismissible: false,
    builder: (context) => AlertDialog(
        title: const Text('Estas seguro?'),
        content: const Text('Irure sit reprehenderit fugiat duis labore exercitation ipsum cillum. Id tempor id elit qui veniam esse anim. Proident proident culpa tempor qui ipsum labore laborum et eu minim sunt. Commodo quis cillum pariatur quis. Reprehenderit proident ex proident sunt sit magna adipisicing ex ex deserunt nostrud mollit ullamco. Id duis ad et excepteur commodo do deserunt esse aliquip non culpa in commodo.'),
        actions: [
          TextButton(onPressed: ()=> context.pop(),
          child: const Text('Cancelar')
          ),
          FilledButton(onPressed: ()=> context.pop(),
          child: const Text('Aceptar')
          )

        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Snackbars y dialogos'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FilledButton.tonal(onPressed: (){
                  showAboutDialog(
                    context: context,
                    children: [
                      const Text('Minim laborum quis dolore incididunt commodo sint fugiat Lorem qui aliqua et ex commodo.')
                    ]
                  );
                },
                child: const Text('Licencias usadas')
              ),
               FilledButton.tonal(onPressed: () => openDialog(context),
                child: const Text('Mostrar dialogo')
              )
            ],
          ),
        ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showCustomSnackBar(context), 
        label: const Text('Mostrar snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
      ),
    );
  }
}