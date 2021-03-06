import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xlo_mobx/components/custom_drawer/custom_drawer.dart';
import 'package:xlo_mobx/screens/criar_anuncio/widget/categoria_field.dart';
import 'package:xlo_mobx/screens/criar_anuncio/widget/images_field.dart';
import 'package:xlo_mobx/stores/criar_anuncio_store.dart';

class CriarAnuncioScreen extends StatelessWidget {
  final CriarAnuncioStore criarAnuncioStore = CriarAnuncioStore();

  final labelStyle = TextStyle(
    fontWeight: FontWeight.w800,
    color: Colors.grey,
    fontSize: 18,
  );

  final contentPadding = const EdgeInsets.fromLTRB(16, 10, 12, 10);

  @override
  Widget build(BuildContext context) {
    print("criar_anuncio_screen build()");
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text("Criar Anúncio"),
        centerTitle: true,
      ),
      body: Card(
        clipBehavior: Clip.antiAlias, //isso aqui deixa os cantos arredondados e cortados
        margin: const EdgeInsets.symmetric(horizontal: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ImagesField(criarAnuncioStore),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Título *',
                labelStyle: labelStyle,
                contentPadding: contentPadding,
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Descrição *',
                labelStyle: labelStyle,
                contentPadding: contentPadding,
              ),
              maxLines: null,
            ),
            CategoriaField(criarAnuncioStore),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Preço *',
                labelStyle: labelStyle,
                contentPadding: contentPadding,
                prefixText: 'R\$',
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly, //só aceita passar
                RealInputFormatter(
                  centavos: true,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
