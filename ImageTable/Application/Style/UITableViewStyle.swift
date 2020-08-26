import UIKit

extension StyleWrapper where Element == UITableView {
    static var baseTable: StyleWrapper {
        return .wrap { tableView, _ in
            tableView.separatorStyle = .none
            tableView.tableFooterView = UIView()
        }
    }
}
