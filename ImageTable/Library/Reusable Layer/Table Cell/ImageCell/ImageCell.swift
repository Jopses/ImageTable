import UIKit

class ImageCell: PreparableTableCell {
    // MARK: - Properties

    private let tableImage = TIImageView(image: nil)

    var viewModel: ImageCellViewModel? {
        didSet {
            guard let imageUrl = viewModel?.image else { return }
            tableImage.setImage(url: imageUrl.url)
            reloadInputViews()
        }
    }

    // MARK: - Lifecycle

    override func prepareForReuse() {
        super.prepareForReuse()
        accessoryType = .none
    }

    override func prepare(withViewModel viewModel: PreparableViewModel?) {
        prepareView()
        self.viewModel = viewModel as? ImageCellViewModel
    }

    // MARK: - Prepare View

    private func prepareView() {
        (self as UITableViewCell).apply(.imageCell)
        setPhotoImageView()
    }

    private func setPhotoImageView() {
        (tableImage as UIImageView).apply(.tableImage)
        contentView.addSubview(tableImage)
        tableImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            tableImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            tableImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            tableImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
}
