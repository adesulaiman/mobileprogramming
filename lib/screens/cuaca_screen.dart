import 'package:cuaca/providers/cuaca_provider.dart';
import 'package:flutter/material.dart';
import 'package:cuaca/providers/cuaca_provider.dart';

class CuacaScreen extends StatefulWidget {
  const CuacaScreen({Key? key}) : super(key: key);

  @override
  _CuacaScreenState createState() => _CuacaScreenState();
}

class _CuacaScreenState extends State<CuacaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aplikasi Cuaca'),
      ),
      body: Consumer<CuacaProvider>(
        builder: (context, provider, _) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '${provider.cuacaModel.main?.temp ?? '-'} C',
                  style: TextStyle(
                    fontSize: 60,
                  ),
                ),
                SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.network(
                    'http://openweathermap.org/img/w/${provider.cuacaModel.weather?.first.icon ?? ''}.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  '${provider.cuacaModel.name ?? '-'}',
                  style: TextStyle(
                    fontSize: 60,
                  ),
                ),
                TextFormField(
                  controller: provider.inputcity,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Masukkan nama kota',
                  ),
                ),
                TextButton(
                  onPressed: () => provider.tampilkanDataCuaca(
                      city: provider.inputcity.text),
                  child: Text('Tampilkan Data'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
