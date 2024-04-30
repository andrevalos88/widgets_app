import 'package:flutter/material.dart' show IconData, Icons;

class MenuItem{
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

 const MenuItem({
    required this.title, 
    required this.subTitle, 
    required this.link, 
    required this.icon
    });
}


const appMenuItems = <MenuItem>[
MenuItem(title: 'Botones', subTitle: 'Varios botones en flutter', link: '/buttons', icon: Icons.smart_button_outlined),
MenuItem(title: 'Tarjetas', subTitle: 'Un contenedor estilizado', link: '/cards', icon: Icons.credit_card),
MenuItem(title: 'Progress Indicators', subTitle: 'Generales y constrolados', link: '/progress', icon: Icons.refresh_rounded),
MenuItem(title: 'Snackbars y dialogos', subTitle: 'Indicadores de pantalla', link: '/snackbars', icon: Icons.info_outline),
MenuItem(title: 'Animated container', subTitle: 'Stateful dget animado', link: '/animated', icon: Icons.check_box_outline_blank_rounded),
MenuItem(title: 'UI controls + tiles', subTitle: 'Una serie de controles de Flutter', link: '/ui-controls', icon: Icons.car_rental_outlined),
MenuItem(title: 'Introduccion a la aplicacion', subTitle: 'pequeño tutorial', link: '/tutorial', icon: Icons.access_alarm_rounded),
MenuItem(title: 'Infinite Scroll and pull refresh', subTitle: 'Listas infinitas y pull para refresh', link: '/infinite', icon: Icons.list_alt_rounded),
];