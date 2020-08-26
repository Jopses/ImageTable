import UIKit

protocol TableImagesViewInput: AnyObject {
    func reloadTable(_ items: [ImageCellViewModel])
}

protocol TableImagesViewOutput {
    func viewDidLoad()
}

class TableImagesViewController: UIViewController, ScreenTransitionable {
    // MARK: - Properties

    let output: TableImagesViewOutput

    let tableView = UITableView()
    let tableAdapter: TableImagesTableAdapter

    // MARK: - Lifecycle

    init(output: TableImagesViewOutput, tableAdapter: TableImagesTableAdapter) {
        self.output = output
        self.tableAdapter = tableAdapter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        prepareView()
        output.viewDidLoad()
    }

    // MARK: - Prepare View

    private func prepareView() {
        view.apply(.backgroundView)
        setTableView()
    }

    private func setTableView() {
        tableView.apply(.baseTable)
        tableView.register(ImageCell.self, forCellReuseIdentifier: ImageCell.className)
        tableView.dataSource = tableAdapter
        tableView.delegate = tableAdapter
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }

    // MARK: - Actions
}

// MARK: - TableImagesViewInput

extension TableImagesViewController: TableImagesViewInput {
    func reloadTable(_ items: [ImageCellViewModel]) {
        tableAdapter.items = items
        tableView.reloadData()
    }
}
