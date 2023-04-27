import Flutter
import UIKit
import VerifyBloc

public class VerifyblocFlutterPlugin: NSObject, FlutterPlugin, VerifyblocFlutterApi {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let messenger : FlutterBinaryMessenger = registrar.messenger()
        let api : VerifyblocFlutterApi & NSObjectProtocol = VerifyblocFlutterPlugin.init()
        VerifyblocFlutterApiSetup.setUp(binaryMessenger: messenger, api: api)
    }
    
    func initialize(partnerId: String, appId: String, privateKey: String) throws {
        
    }
    
    func startVerification(userId: String, identityType: Int64) throws {
        
    }
    
    func setEnv(env: Int64) throws {
        
    }
    
    func setAppLocale(locale: String) throws {

    }
    
    func setTheme(theme: VerifyblocTheme) throws {
        
    }
}
