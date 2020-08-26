import UIKit

public protocol ThemeAppDelegate: UIApplicationDelegate {
    var theme: Theme.Type { get }
}
