import 'package:mpesa_plugin/initSTKpush.dart';

  Future<void> startCheckout({String userPhone, String amount}) async {
    dynamic transactionInit;
    try {
      transactionInit = await StkPush(
              consumerKey: '8AdWFSRt9M1D4wztHWvA9Cs3TPIwhI2r',
              consumerSecret: 'IrumASXSkoVqDR8y',
              shortCode: '174379',
              transactionType: 'CustomerPayBillOnline',
              transactionDesc: 'gclanExpress',
              accountReference: 'GamesClan',
              passkey:
                  'bfb279f9aa9bdbcf158e97dd71a467cd2e0c893059b10f78e6b72ada1ed2c919',
              phone: userPhone,
              amount: amount,
              callbackURL: Uri.parse(
                  'https://us-central1-phone-login-414b0.cloudfunctions.net//lmno/callback'),
              endpoint: Uri.parse(
                  'https://sandbox.safaricom.co.ke/mpesa/stkpush/v1/processrequest'),
              oauthEndpoint: Uri.parse(
                  'https://sandbox.safaricom.co.ke/oauth/v1/generate?grant_type=client_credentials'))
          .startCheckOut();

      var result = transactionInit;

      if (result.keys.contains('ResponseCode')) {
        String mResponseCode = result['ResponseCode'];
        print('resulting code: ' + mResponseCode);

       
      }
      print('transaction result: \n' + transactionInit.toString());

      return transactionInit;
    } catch (e) {
      print(e);
    }
  }