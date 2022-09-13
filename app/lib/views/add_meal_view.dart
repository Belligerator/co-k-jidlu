import 'package:cojekjidlu/locator.dart';
import 'package:cojekjidlu/models/meal.dart';
import 'package:cojekjidlu/models/responses/api_response.dart';
import 'package:cojekjidlu/services/api_service.dart';
import 'package:cojekjidlu/services/modal_service.dart';
import 'package:cojekjidlu/shared/ui_helpers.dart';
import 'package:cojekjidlu/theme.dart';
import 'package:cojekjidlu/validators.dart';
import 'package:cojekjidlu/widgets/buttons/button_primary.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';

class AddMealView extends StatefulWidget {
  @override
  State<AddMealView> createState() => _AddMealViewState();
}

class _AddMealViewState extends State<AddMealView> {
  final _modalService = locator.get<ModalService>();
  final _apiService = locator.get<ApiService>();
  final _mealNameCtrl = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  Meal? _meal;
  bool _submitted = false;

  _onSubmitClick(BuildContext context) async {
    _meal = null;
    setState(() {
      _submitted = true;
    });
    if (!_formKey.currentState!.validate()) {
      return;
    }

    context.loaderOverlay.show();

    APIResponse response = await _apiService.addMeal(Meal(_mealNameCtrl.text));
    if (response.runtimeType == SuccessState) {
      setState(() {
        _mealNameCtrl.clear();
        _meal = (response as SuccessState).value;
        _submitted = false;
      });
    } else {
      _modalService.showAlert(context, (response as ErrorState).msg);
    }
    context.loaderOverlay.hide();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Přidat jídlo'), centerTitle: true),
      body: Column(
        children: [
          Form(
            key: _formKey,
            autovalidateMode: _submitted ? AutovalidateMode.always : null,
            child: Column(
              children: [
                UIHelper.verticalSpaceSmall(),
                TextFormField(
                  controller: _mealNameCtrl,
                  decoration: inputDecoration.copyWith(labelText: 'Název pokrmu'),
                  textInputAction: TextInputAction.done,
                  validator: emptyValidator('Zadejte název pokrmu'),
                ),
                UIHelper.verticalSpaceSmall(),
                ButtonPrimary(
                  text: 'Uložit',
                  onPressed: () => _onSubmitClick(context),
                ),
              ],
            ),
          ),
          UIHelper.verticalSpaceMedium(),
          if (_meal != null)
            Column(
              children: [
                Text('Jídlo přidáno', style: header4TextStyle),
                ListTile(
                  leading: Text('${_meal!.id}'),
                  title: Text(_meal!.name),
                )
              ],
            )
        ],
      ),
    );
  }
}
