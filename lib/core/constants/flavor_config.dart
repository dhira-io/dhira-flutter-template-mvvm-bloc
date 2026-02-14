enum AppFlavor { dev, qa, prod }

class AppConfig {
  final String baseUrl;
  final String environmentName;
  final AppFlavor flavor;

  AppConfig({
    required this.baseUrl,
    required this.environmentName,
    required this.flavor,
  });

  factory AppConfig.dev() => AppConfig(
    baseUrl: 'https://dummyjson.com',
    environmentName: 'Development',
    flavor: AppFlavor.dev,
  );

  factory AppConfig.qa() => AppConfig(
    baseUrl: 'https://qa-api.dhira.io/api/v1',
    environmentName: 'QA',
    flavor: AppFlavor.qa,
  );

  factory AppConfig.prod() => AppConfig(
    baseUrl: 'https://api.dhira.io/api/v1',
    environmentName: 'Production',
    flavor: AppFlavor.prod,
  );
}

class FlavorConfig {
  static AppConfig? _instance;

  static AppConfig get instance => _instance ??= detectFromEnvironment();

  static set instance(AppConfig config) => _instance = config;

  static AppConfig detectFromEnvironment() {
    const flavorStr = String.fromEnvironment('FLAVOR');
    switch (flavorStr.toLowerCase()) {
      case 'prod':
      case 'production':
        return AppConfig.prod();
      case 'qa':
        return AppConfig.qa();
      case 'dev':
      case 'development':
      default:
        return AppConfig.dev();
    }
  }

  static bool get isDev => instance.flavor == AppFlavor.dev;
  static bool get isQA => instance.flavor == AppFlavor.qa;
  static bool get isProd => instance.flavor == AppFlavor.prod;
}
