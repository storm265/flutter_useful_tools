import 'package:flutter/material.dart';
import 'package:flutter_useful_tools/tools/file_picker_provider.dart';
import 'package:flutter_useful_tools/tools/message_service.dart';
import 'package:flutter_useful_tools/tools/system_schome_service.dart';
import 'package:flutter_useful_tools/tools/unfocus_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChromeService.setSystemChrome();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _fileProvider = FilePickerProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            OutlinedButton(
              onPressed: () async {
                final avatar = await _fileProvider.pickAvatar();
                debugPrint('avatar ${avatar.name}');
              },
              child: const Text('Pick avatar'),
            ),
            OutlinedButton(
              onPressed: () async {
                final file = await _fileProvider.pickFile();
                debugPrint('file ${file.name}');
              },
              child: const Text('Pick file'),
            ),
            OutlinedButton(
              onPressed: () async {
                MessageService.displaySnackbar(
                  context: context,
                  message:
                      'Hello world Hello worldHello worldHello worldHello worldHello world',
                );
              },
              child: const Text('Show message'),
            ),
            const Text(
              'You have pushed the button this many times:',
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(),
            ),
            UnfocusWidget(
              child: Text(
                'Unfocus me',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: const FloatingActionButton(
        onPressed: null,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
