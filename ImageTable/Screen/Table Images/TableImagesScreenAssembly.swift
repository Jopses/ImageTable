import UIKit

class TableImagesScreenAssembly {
    func assemble(output: TableImagesScreenOutput? = nil) -> TableImagesViewController {
        let router = TableImagesRouter()
        let presenter = TableImagesPresenter(router: router)
        let tableAdapter = TableImagesTableAdapter()
        let view = TableImagesViewController(output: presenter, tableAdapter: tableAdapter)
        presenter.view = view
        presenter.output = output
        router.view = view
        tableAdapter.output = presenter

        return view
    }
}
