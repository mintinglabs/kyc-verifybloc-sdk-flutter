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
        VerifyBlocManager.config(appId: appId, parterId: partnerId, secret: privateKey)
    }
    
    func startVerification(userId: String, identityType: Int64) throws {
        let controller = viewControllerWithWindow(window: nil)
        VerifyBlocManager.verify(
            userId: userId,
            verityType: VerifyBlocIdentityType(rawValue: identityType) ?? .person,
            presentingController: controller
        ) { [weak self] flowId, status in
            //            self?.dealBlock(flowId: flowId, status)
        }
    }
    
    func setEnv(env: Int64) throws {
        VerifyBlocManager.setEnv(env: VerifyBlocEnv.allCases[Int(env)])
    }
    
    func setAppLocale(locale: String) throws {
        VerifyBlocManager.language(code: locale)
    }
    
    func setTheme(theme: VerifyblocTheme) throws {
        VerifyBlocManager.changeStyle(ThemeUI(rawValue: theme.style.rawValue) ?? .light)
        
//        if let mainColor = UIColor( theme.mainColor) {
//            VerifyBlocManager.shared.themeColor = mainColor
//        }
//        let bnSetting = ButtonSetting(bgColor: bgColor, circle: CGFloat(corner), color: titleColor)
//        VerifyBlocManager.shared.buttonSetting = bnSetting
    }
    
    func viewControllerWithWindow(window: UIWindow?) -> UIViewController {
        var windowToUse = window
        if (windowToUse == nil) {
            for window in UIApplication.shared.windows {
                if (window.isKeyWindow) {
                    windowToUse = window
                }
            }
        }
        var topController = windowToUse?.rootViewController
        while let controller = topController?.presentedViewController {
            topController = controller
        }
        return topController!
    }
    
}
