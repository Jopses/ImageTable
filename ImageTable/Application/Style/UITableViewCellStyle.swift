import UIKit

extension StyleWrapper where Element == UITableViewCell {
    static var imageCell: StyleWrapper {
        return .wrap { cell, _ in
            cell.contentView.clipsToBounds = true
            cell.selectionStyle = .none
        }
    }
}
