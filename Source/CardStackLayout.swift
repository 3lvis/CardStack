import UIKit

protocol CardStackLayoutDataSource: class {
    func cardStateAtIndexPath(indexPath: NSIndexPath) -> Int
}

class CardStackLayout: UICollectionViewLayout {
    static let BellowOffset = 45.0
    static let BellowCellHeight = 7.0
    static let ScaleFactor = 0.015

    var visibleCellHeight: Double = 0.0
    var actualCellHeight: Double = 0.0
    weak var dataSource: CardStackLayoutDataSource? = nil

    override func collectionViewContentSize() -> CGSize {
        return self.collectionView!.bounds.size
    }

    override func layoutAttributesForElementsInRect(rect: CGRect) -> [AnyObject]? {
        var attributes = [UICollectionViewLayoutAttributes]()
        let visibleIndexPaths = self.indexPathsOfItemsInRect(rect)
        for indexPath in visibleIndexPaths {
            let attribute = self.layoutAttributesForItemAtIndexPath(indexPath)
            attributes.append(attribute)
        }

        return attributes
    }

    override func layoutAttributesForItemAtIndexPath(indexPath: NSIndexPath) -> UICollectionViewLayoutAttributes! {
        let attributes = UICollectionViewLayoutAttributes(forCellWithIndexPath: indexPath)
        self.applyLayoutAttributes(attributes)

        return attributes
    }

    // MARK: Private

    func applyLayoutAttributes(attributes: UICollectionViewLayoutAttributes) {
        let cardState = self.dataSource!.cardStateAtIndexPath(attributes.indexPath)
        switch cardState {
        case 0:
            attributes.frame = self.computedFrame(attributes.indexPath, offset: attributes.indexPath.row, height: self.actualCellHeight)
        case 1:
            attributes.frame = self.computedFrame(attributes.indexPath, offset: 0, height: self.actualCellHeight)
        case 2:
            self.applyCollapsedAttributes(attributes)
        default:
            break
        }
    }

    func applyCollapsedAttributes(attributes: UICollectionViewLayoutAttributes) {
        let indexPath = attributes.indexPath
        let rowCount = Double(self.collectionView!.dataSource!.collectionView(self.collectionView!, numberOfItemsInSection: indexPath.section))
        attributes.frame = self.computedFrame(indexPath, offset: indexPath.row, height: 50.0)
        var transform = attributes.transform3D
        let yTarget = Double(self.collectionView!.bounds.height) - CardStackLayout.BellowOffset + (CardStackLayout.BellowCellHeight * Double(indexPath.row))
        let yOffset = yTarget - Double(attributes.frame.minY)
        transform = CATransform3DTranslate(transform, CGFloat(0.0), CGFloat(yOffset), CGFloat(0.0))
        let sx = 1.0 - ((rowCount - Double(indexPath.row)) * CardStackLayout.ScaleFactor)
        transform = CATransform3DScale(transform, CGFloat(sx), CGFloat(1.0), CGFloat(1.0))
        attributes.transform3D = transform

    }

    func indexPathsOfItemsInRect(rect: CGRect) -> [NSIndexPath] {
        var indexPaths = [NSIndexPath]()
        var sectionsCount = 0
        if let sections = self.collectionView?.numberOfSections() {
            sectionsCount = sections
        }

        for section in 0..<sectionsCount {
            var rowsCount = 0
            if let rows = self.collectionView?.numberOfItemsInSection(section) {
                rowsCount = rows
            }

            for row in 0..<rowsCount {
                indexPaths.append(NSIndexPath(forRow: row, inSection: section))
            }
        }

        return indexPaths
    }

    func computedFrame(indexPath: NSIndexPath, offset: Int, height: Double) ->  CGRect {
        return CGRect(x: 0.0, y: self.visibleCellHeight * Double(offset), width: Double(self.collectionView!.bounds.width), height: height)
    }
}
