import Foundation

struct ImageCellModel: Equatable {
    let url: URL

    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.url == rhs.url
    }
}
