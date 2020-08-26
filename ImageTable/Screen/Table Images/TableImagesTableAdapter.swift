import UIKit

protocol TableImagesTableAdapterOutput: AnyObject {}

class TableImagesTableAdapter: NSObject {
    // MARK: - Properties
    
    var items: [PreparableViewModel] = []
    weak var output: TableImagesTableAdapterOutput?
    private let rHeight: CGFloat = 150.0
    
    // MARK: - Private Method

    private func downloadImage(withURL url: URL, forCell cell: UITableViewCell) {
        let tableImage = TIImageView(image: nil)
        tableImage.setImage(url: url)
        (tableImage as UIImageView).apply(.tableImage)
        cell.apply(.imageCell)
        cell.contentView.addSubview(tableImage)
        tableImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableImage.topAnchor.constraint(equalTo: cell.contentView.topAnchor),
            tableImage.bottomAnchor.constraint(equalTo: cell.contentView.bottomAnchor),
            tableImage.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor),
            tableImage.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor)
        ])
    }
}

// MARK: - UITableViewDataSource

extension TableImagesTableAdapter: UITableViewDataSource {

    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: viewModel.cellId, for: indexPath)
        if let url = (viewModel as? ImageCellViewModel)?.image.url {
            downloadImage(withURL: url, forCell: cell)
        }
//        if let reusableCell = cell as? PreparableTableCell {
//            reusableCell.prepare(withViewModel: viewModel)
//        }
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
        return rHeight
    }
}

// MARK: - UITableViewDelegate

extension TableImagesTableAdapter: UITableViewDelegate {}
