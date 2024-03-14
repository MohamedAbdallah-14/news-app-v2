bool get liveEnvironment => AppFlavor.instance.flavor == Flavor.production;
bool get devEnvironment => AppFlavor.instance.flavor == Flavor.dev;
bool get mockEnvironment => AppFlavor.instance.flavor == Flavor.mock;

enum Flavor { dev, production, mock }

class AppFlavor {
  AppFlavor._();
  static final _instance = AppFlavor._();
  static AppFlavor get instance => _instance;

  Flavor flavor = Flavor.dev;

  String get baseUrl {
    switch (flavor) {
      case Flavor.production:
        return 'https://mocki.io/v1/';
      case Flavor.dev:
        return 'https://mocki.io/v1/';
      case Flavor.mock:
        return 'http://localhost/';
    }
  }
}
