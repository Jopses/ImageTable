import UIKit

extension StyleWrapper where Element == UIImageView {
    static var tableImage: StyleWrapper {
        return .wrap { imageView, _ in
            imageView.contentMode = .scaleAspectFill
        }
    }
}
