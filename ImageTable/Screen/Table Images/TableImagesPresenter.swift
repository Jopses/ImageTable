import UIKit
protocol TableImagesScreenOutput: AnyObject {}

protocol TableImagesScreenInput: AnyObject {}

class TableImagesPresenter {
    // MARK: - Properties

    weak var view: TableImagesViewInput?
    let router: TableImagesRouterInput
    weak var output: TableImagesScreenOutput?

    // MARK: - Lifecycle

    init(router: TableImagesRouterInput) {
        self.router = router
    }

    // MARK: - Private Methods

    private func generateImgeUrl() -> [ImageCellViewModel] {
        var imageUrls: [ImageCellViewModel] = []
        for index in Array(1 ... 100) {
            guard let url = URL(string: AppDefaults.imageUrl + "\(index)") else {
                continue
            }
            let model = ImageCellModel(url: url)
            imageUrls.append(ImageCellViewModel(image: model))
        }
        return imageUrls
    }
}

// MARK: - TableImagesViewOutput

extension TableImagesPresenter: TableImagesViewOutput {
    func viewDidLoad() {
        let items = generateImgeUrl()
        view?.reloadTable(items)
    }
}

// MARK: - TableImagesTableAdapterOutput

extension TableImagesPresenter: TableImagesTableAdapterOutput {}

// MARK: - TableImagesScreenInput

extension TableImagesPresenter: TableImagesScreenInput {}
