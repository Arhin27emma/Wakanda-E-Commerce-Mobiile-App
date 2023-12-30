// ignore_for_file: file_names

class CreditCardModel {
  final String cardNumber;
  final String expiryDate;
  final String cardHolderName;
  final String cvvCode;
  final bool showBackView;

  CreditCardModel(
    {
      required this.cardNumber,
      required this.expiryDate,
      required this.cardHolderName,
      required this.cvvCode,
      required this.showBackView,
    }
  );
}

List<CreditCardModel> listData = [
  CreditCardModel(
    cardNumber: '5242424242424242', 
    expiryDate: '01-02-03', 
    cardHolderName: 'Emmanuel Arhinful', 
    cvvCode: '124', 
    showBackView: true
  ),
];
