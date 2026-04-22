enum AdsProvider {
  disabled,
  admob,
  unityMediation,
  hybrid,
}

class AdsProviderConfig {
  const AdsProviderConfig({required this.provider});

  final AdsProvider provider;

  factory AdsProviderConfig.fromEnvironment() {
    const raw = String.fromEnvironment('ADS_PROVIDER', defaultValue: 'admob');

    switch (raw) {
      case 'disabled':
        return const AdsProviderConfig(provider: AdsProvider.disabled);
      case 'unity_mediation':
        return const AdsProviderConfig(provider: AdsProvider.unityMediation);
      case 'hybrid':
        return const AdsProviderConfig(provider: AdsProvider.hybrid);
      case 'admob':
      default:
        return const AdsProviderConfig(provider: AdsProvider.admob);
    }
  }
}
