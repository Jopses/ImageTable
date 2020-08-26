import XCTest
@testable import ImageTable

class TableImagesScreenAssemblyTests: XCTestCase {

    // MARK: - Properties

    private var viewController: TableImagesViewController!

    // MARK: - Lifecycle

    override func setUp() {
        super.setUp()
        viewController = TableImagesScreenAssembly().assemble()
    }

    // MARK: - Tests

    func testViewOutput() {
        let isPresenter = viewController.output is TableImagesPresenter
        XCTAssertTrue(isPresenter, "viewController.output is not TableImagesPresenter")
    }

    func testViewInput() {
        guard let presenter = viewController.output as? TableImagesPresenter else {
            XCTFail("Cannot assign viewController.output as TableImagesPresenter")
            return
        }

        let isViewController = presenter.view is TableImagesViewController
        XCTAssertTrue(isViewController, "presenter.view is not TableImagesViewController")
    }

    func testTableAdapterOutput() {
        let isPresenter = viewController.tableAdapter.output is TableImagesPresenter
        XCTAssertTrue(isPresenter, "viewController.tableAdapter.output is not TableImagesPresenter")
    }

    func testRouterInput() {
        guard let presenter = viewController.output as? TableImagesPresenter else {
            XCTFail("Cannot assign viewController.output as TableImagesPresenter")
            return
        }

        let isRouter = presenter.router is TableImagesRouter
        XCTAssertTrue(isRouter, "presenter.router is not TableImagesRouter")
    }

    func testScreenTransitionable() {
        guard let presenter = viewController.output as? TableImagesPresenter else {
            XCTFail("Cannot assign viewController.output as TableImagesPresenter")
            return
        }
        guard let router = presenter.router as? TableImagesRouter else {
            XCTFail("Cannot assign presenter.router as TableImagesRouter")
            return
        }

        let isViewController = router.view is TableImagesViewController
        XCTAssertTrue(isViewController, "router.view is not TableImagesViewController")
    }
}
