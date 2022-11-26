enum EnvMode { local, dev, beta, alpha }


const _kBuildEnv = String.fromEnvironment('BUILD_ENV', defaultValue: 'dev');
const _kDebugDb = String.fromEnvironment('DEBUG_DB', defaultValue: 'false');

///Set app envs with --dart-define
/// [BUILD_ENV] = [local, dev, beta, alpha]
/// [USER] = [<default user name>]
/// [PWD] = [<default user password>]
/// [DEBUG_DB] = [<Should start data browser>]
/// [HTTP_LOG] = [<print http logs>]
///ie.: flutter run --dart-define=BUILD_ENV=dev>
class AppEnv {
  static EnvMode get env {
    switch (_kBuildEnv.toLowerCase()) {
      case 'alpha':
        return EnvMode.alpha;

      case 'beta':
        return EnvMode.beta;

      case 'local':
        return EnvMode.local;

      default:
        return EnvMode.dev;
    }
  }


  static bool get debugDB => _kDebugDb == 'true';
}
