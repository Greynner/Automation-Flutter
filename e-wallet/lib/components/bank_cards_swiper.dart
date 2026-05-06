import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:my_vault/components/bank_account_card.dart';

class BankCardsSwiper extends StatelessWidget {
  const BankCardsSwiper({
    Key? key,
    required this.cards,
  }) : super(key: key);

  final List<Map> cards;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.all(8),
      height: size.height * 0.3,
      child: Swiper(
        itemCount: cards.length,
        itemBuilder: (context, index) => BankAccountCard(
          cardType: cards[index]['type'],
          cardNumber: '**** **** **** 2321',
          color: cards[index]['color'],
          assetName: cards[index]['image'],
        ),
        itemWidth: size.width * 0.9,
        layout: SwiperLayout.STACK,
        loop: true,
        onIndexChanged: (i) => print(i),
      ),
    );
  }
}
