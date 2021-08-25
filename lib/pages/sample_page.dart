
import 'package:flutter/material.dart';
import 'package:purist_state_management_sample/pages/sample_model.dart';

class SamplePage extends StatefulWidget {
  SamplePage();

  @override
  _SamplePageState createState() => _SamplePageState();
}

class _SamplePageState extends State<SamplePage> {

  _SamplePageState(){
    model = SampleModel();
  }
  late final SampleModel model;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Sample App')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ServerDataWidget(model),
              SizedBox(height: 20),
              ButtonContainer(model),
            ],
          ),
        ),
      ),
    );
  }



}

class ServerDataWidget extends StatelessWidget {
  const ServerDataWidget(this.model) : super();
  final SampleModel model;
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: model.textData,
      builder: (context, textData, child) {
        return Column(
          children: [
            const Text('** data from server **'),
            Text(
              textData,
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        );
      },
    );
  }
}

class ButtonContainer extends StatelessWidget {
  const ButtonContainer(this.model) : super();
  final SampleModel model;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Color>(
      valueListenable: model.buttonColor,
      builder: (context, buttonColor, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                model.retrieveTextData();
              },
              child: const Text('retrieve text data'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(buttonColor)
              ),
            ),
            SizedBox(width: 20),
            ElevatedButton(
              onPressed: () {
                model.retrieveButtonColor();
              },
              child: const Text('retrieve button color'),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(buttonColor)
              ),
            ),
          ],
        );
      },
    );
  }
}