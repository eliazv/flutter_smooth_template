enum AppFlavor {
  dev,
  prod,
}

class AppEnvironment {
  const AppEnvironment({required this.flavor, required this.appName});

  final AppFlavor flavor;
  final String appName;

  static AppEnvironment fromEnvironment() {
    const flavorRaw = String.fromEnvironment('APP_FLAVOR', defaultValue: 'dev');
    const appName = String.fromEnvironment(
      'APP_NAME',
      defaultValue: 'Flutter Smooth Template',
    );

    final flavor = flavorRaw == 'prod' ? AppFlavor.prod : AppFlavor.dev;
    return AppEnvironment(flavor: flavor, appName: appName);
  }

  bool get isDev => flavor == AppFlavor.dev;
  bool get isProd => flavor == AppFlavor.prod;
}
