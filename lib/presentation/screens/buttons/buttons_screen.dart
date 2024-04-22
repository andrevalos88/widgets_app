
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  static const name = 'button_screen';
  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons screen'),
      ),
      body: const _ButtonsBody(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_back_ios_new_outlined),
        onPressed: (){
          context.pop();
        }
      ),
    );
  }
}

class _ButtonsBody extends StatelessWidget {
  const _ButtonsBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
        child: Wrap(
          spacing: 10,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(onPressed: (){}, child: const Text('Elevated')),
            const ElevatedButton(onPressed: null, child: Text('Elevated disabled')),
            ElevatedButton.icon(onPressed: (){}, icon: const Icon(Icons.access_alarm_outlined), label: const Text('Elevated icon')),

            FilledButton(onPressed: (){}, child: const Text('Filled')),
            FilledButton.icon(onPressed: (){}, icon: const Icon(Icons.abc_outlined), label: const Text('Filled icon')),

            OutlinedButton(onPressed: (){}, child: const Text('Outlined')),
            OutlinedButton.icon(onPressed: (){}, icon: const Icon(Icons.accessibility_new_rounded), label: const Text('Outlined icon')),

            TextButton(onPressed: (){}, child: const Text('Text')),
            TextButton.icon(onPressed: (){}, icon: const Icon(Icons.account_tree_outlined), label: const Text('Text icon')),

            CustomButton(),
            IconButton(onPressed: (){}, icon: const Icon(Icons.app_registration_outlined)),
            IconButton(
              onPressed: (){}, 
              icon: const Icon(Icons.app_registration_outlined),
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(colors.primary),
                iconColor: const MaterialStatePropertyAll(Colors.white)
              ),
            )
          ],
        ),
      ),
    );
  }
}



class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    
    return  ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: colors.primary,
        child: InkWell(
          onTap: () {
            
          },
          child: const Padding(
            padding: EdgeInsets.all(10.0),
            child:  Text('Hola mundo',style: TextStyle(color: Colors.white),),
          ),
        ),
      ),
    );
  }
}