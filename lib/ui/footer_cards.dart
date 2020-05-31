import 'package:flutter/material.dart';
import 'package:adad_app/blocs/floating_cards_bloc.dart';
import 'package:adad_app/ui/footer_card_item.dart';
import 'package:provider/provider.dart';

class FooterCards extends StatefulWidget {
  @override
  _FooterCardsState createState() => _FooterCardsState();
}

class _FooterCardsState extends State<FooterCards> {
  List<FooterCardItem> _items = [
    FooterCardItem(
      icon: Icons.assignment,
      text: "Plano de aulas",
    ),
    FooterCardItem(
      icon: Icons.class_,
      text: "Diário",
    ),
    FooterCardItem(
      icon: Icons.face,
      text: "Alunos",
    ),
    FooterCardItem(
      icon: Icons.assignment_ind,
      text: "Lideres",
    ),
    FooterCardItem(
      icon: Icons.school,
      text: "Disciplinas",
    )
  ];

  @override
  Widget build(BuildContext context) {
    FloatingCardsBloc floatingCardBloc =
        Provider.of<FloatingCardsBloc>(context);

    return StreamBuilder(
      stream: floatingCardBloc.topPercentage.stream,
      initialData: floatingCardBloc.topPercentage.value,
      builder: (_, AsyncSnapshot<double> snapshot) {
        return Opacity(
          opacity: floatingCardBloc.topPercentageToOpacity,
          child: Column(
            children: <Widget>[
              Container(
                height: 95,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  itemCount: _items.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      width: 95,
                      child: _items[index],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      width: 10,
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
