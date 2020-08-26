import UIKit

class TIImageView: UIImageView {
    // MARK: - Properties

    override var image: UIImage? {
        didSet {
            if image != nil {
                activityIndicator.removeFromSuperview()
            }
        }
    }

    let activityIndicator = UIActivityIndicatorView(style: .medium)

    // MARK: - Lifecycle

    override init(image: UIImage?) {
        super.init(image: image)
        setActivityIndicator()
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Prepare View

    private func setActivityIndicator() {
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        addSubview(activityIndicator)
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }

    // MARK: - Public method

    func setImage(url: URL) {
        getData(from: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                self?.activityIndicator.removeFromSuperview()
                return
            }
            DispatchQueue.main.async {
                self?.image = UIImage(data: data)
            }
        }
    }

    // MARK: - Private method

    private func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
}

