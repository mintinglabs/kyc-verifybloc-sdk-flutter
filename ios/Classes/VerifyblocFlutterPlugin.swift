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
        if let themeColor = theme.mainColor {
            VerifyBlocManager.shared.themeColor = UIColorInt32(value: UInt32(themeColor))
        }
        
        var btnBgColor, btnTextColor: UIColor?
        if let btnBgColorInt64 = theme.buttonStyle?.color {
            btnBgColor = UIColorInt32(value: UInt32(btnBgColorInt64))
        }
        if let btnTextColorInt64 = theme.buttonStyle?.textColor {
            btnTextColor = UIColorInt32(value: UInt32(btnTextColorInt64))
        }
        let bnSetting = ButtonSetting(
            bgColor: btnBgColor,
            circle: CGFloat(theme.buttonStyle?.borderRadius ?? 0),
            color: btnTextColor
        )
        VerifyBlocManager.shared.buttonSetting = bnSetting
    }
    
    private func viewControllerWithWindow(window: UIWindow?) -> UIViewController {
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
    
    /// 设置颜色与透明度
    private func UIColorInt32(value:UInt32) -> UIColor
    {
        let int = value
        let a, r, g, b: UInt32
        (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        return UIColor(
            red: CGFloat(r) / 255,
            green: CGFloat(g) / 255,
            blue: CGFloat(b) / 255,
            alpha: CGFloat(a) / 255
        )
    }
    
}
