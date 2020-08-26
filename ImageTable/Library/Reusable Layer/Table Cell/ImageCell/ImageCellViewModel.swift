class ImageCellViewModel: PreparableViewModel {
    let cellId: String = ImageCell.className
    let image: ImageCellModel

    init(image: ImageCellModel) {
        self.image = image
    }
}
