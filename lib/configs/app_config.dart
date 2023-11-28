// ignore_for_file: constant_identifier_names

enum MockType { none, assets, hard }

enum EnvironmentType { PROD, DEV, UAT }

class AppConfig {
  /// Used in case environment identifier wasn't provided or incorrect
  EnvironmentType defaultEnvironment = EnvironmentType.DEV;

  /// Set of environment data sets.
  Map<EnvironmentType, EnvironmentValues> get environmentsData => {
        EnvironmentType.DEV: const EnvironmentValues(
          gatewayUrl: 'https://api.github.com',
          portalUrl: 'https://api.github.com',
          hiveBoxPrefix: 'dev_',
        ),
        EnvironmentType.PROD: const EnvironmentValues(
          gatewayUrl: 'https://api.github.com',
          portalUrl: 'https://api.github.com',
          hiveBoxPrefix: 'prod_',
        ),
        EnvironmentType.UAT: const EnvironmentValues(
          gatewayUrl: 'https://api.github.com',
          portalUrl: 'https://api.github.com',
          hiveBoxPrefix: 'uat_',
        ),
      };
}

// Object that enlists environment specific variables
class EnvironmentValues {
  const EnvironmentValues({
    required this.portalUrl,
    required this.gatewayUrl,
    required this.hiveBoxPrefix,
  });

  final String gatewayUrl;
  final String portalUrl;
  final String hiveBoxPrefix;
}
