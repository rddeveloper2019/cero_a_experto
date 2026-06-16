import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const name = 'ui_controls_screen';

  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UI Controls + Tiles'),
      ),
      body: _UIControlsView(),
    );
  }
}

class _UIControlsView extends StatefulWidget {
  const _UIControlsView({super.key});

  @override
  State<_UIControlsView> createState() => _UIControlsViewState();
}

enum Transportation { car, plane, ship, submarine }

class _UIControlsViewState extends State<_UIControlsView> {
  bool isOk = true;

  Transportation? _selectedTransport = Transportation.car;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          value: isOk,
          onChanged: (bool? value) {
            setState(() {
              isOk = value ?? false;
            });
          },
          title: const Text('SwitchListTile title'),
          subtitle: const Text('SwitchListTile subtitle'),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Switch(
              value: isOk,
              onChanged: (bool? value) {
                setState(() {
                  isOk = value ?? false;
                });
              },
            ),
            const SizedBox(width: 25),
          ],
        ),

        ExpansionTile(
          title: Text('Transports'),
          subtitle: Text(_selectedTransport.toString()),
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RadioGroup<Transportation>(
                groupValue: _selectedTransport,

                onChanged: (Transportation? newValue) {
                  setState(() {
                    _selectedTransport = newValue;
                  });
                },

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RadioListTile<Transportation>(
                      value: Transportation.car,
                      title: const Text('Автомобиль (Car)'),
                      subtitle: const Text('RadioListTile subtitle'),
                    ),

                    RadioListTile<Transportation>(
                      value: Transportation.plane,
                      title: const Text('Самолет (Plane)'),
                    ),

                    RadioListTile<Transportation>(
                      value: Transportation.ship,
                      title: const Text('Корабль (Ship)'),
                    ),

                    Row(
                      children: [
                        const Text('Подводная лодка (Submarine) '),
                        Radio<Transportation>(
                          value: Transportation.submarine,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),

        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text('Выберите транспорт (RadioGroup):', style: TextStyle(fontWeight: FontWeight.bold)),
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: RadioGroup<Transportation>(
            groupValue: _selectedTransport,

            onChanged: (Transportation? newValue) {
              setState(() {
                _selectedTransport = newValue;
              });
            },

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RadioListTile<Transportation>(
                  value: Transportation.car,
                  title: const Text('Автомобиль (Car)'),
                  subtitle: const Text('RadioListTile subtitle'),
                ),

                RadioListTile<Transportation>(
                  value: Transportation.plane,
                  title: const Text('Самолет (Plane)'),
                ),

                RadioListTile<Transportation>(
                  value: Transportation.ship,
                  title: const Text('Корабль (Ship)'),
                ),

                Row(
                  children: [
                    const Text('Подводная лодка (Submarine) '),
                    Radio<Transportation>(
                      value: Transportation.submarine,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        CheckboxListTile(
          value: true,
          onChanged: (bool? val) {},
          title: const Text('CheckboxListTile title'),
          subtitle: const Text('CheckboxListTile subtitle'),
        ),

        CheckboxListTile(
          value: false,
          onChanged: (bool? val) {},
          title: const Text('CheckboxListTile title'),
          subtitle: const Text('CheckboxListTile subtitle'),
        ),
      ],
    );
  }
}
