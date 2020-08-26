import XCTest
@testable import ImageTable

class TableImagesPresenterTests: XCTestCase {

    // MARK: - Properties

    private var presenter: TableImagesPresenter!

    // MARK: - Lifecycle

    override func setUp() {
        super.setUp()

        let router = TableImagesRouterMock()
        let view = TableImagesViewControllerMock()
        let output = TableImagesScreenOutputMock()
        presenter = TableImagesPresenter(router: router)
        presenter.view = view
        presenter.output = output
    }

    // MARK: - Tests

}

