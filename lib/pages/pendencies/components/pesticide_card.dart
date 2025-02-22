import 'package:caderneta_campo_digital/models/PesticideAplicationModel.dart';
import 'package:caderneta_campo_digital/pages/pendencies/components/pesticide_analysis.dart';
import 'package:caderneta_campo_digital/utils/utils.dart';
import 'package:flutter/material.dart';

class PesticideCard extends StatelessWidget {
  final PesticideAplicationModel pesticide;

  const PesticideCard({
    Key? key,
    required this.pesticide,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BorderRadius border = BorderRadius.circular(15);
    Size size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: border,
        ),
        elevation: 4,
        child: InkWell(
          borderRadius: border,
          onTap: () {
            showDialog<String>(
              context: context,
              builder: (BuildContext context) => PesticideAnalysisDialog(
                pesticide: pesticide,
              ),
            );
          },
          child: Container(
            margin: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Text(
                    pesticide.pesticide,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: ClipRRect(
                    borderRadius: border,
                    child: InkWell(
                      child: Image.network(
                        'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                        fit: BoxFit.cover,
                        height: size.width * 0.5,
                        width: size.width * 0.85,
                      ),
                    ),
                  ),
                ),
                //Alterar para o produtor vindo de pesticide.plantation.talhao.produtor.nome
                Text(
                  "Produtor",
                  style: Utils.estateTextStyle,
                ),
                Text(
                  pesticide.plantation,
                  style: Utils.estateTextStyle,
                ),
                Text(
                  pesticide.aplicationDate,
                  style: Utils.estateTextStyle,
                ),
                Text(
                  pesticide.dosage.toString() + " ml",
                  style: Utils.estateTextStyle,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
