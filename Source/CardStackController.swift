import UIKit

protocol CardStackControllerDataSource: class {
    func objects() -> [Int]
    func updateObjects(newCards: [Int])
}

protocol CardStackControllerDelegate: class {
    func cardStackControllerDidSelectItemAtIndexPath(cardStackController: CardStackController, indexPath: NSIndexPath)
}

class CardStackController: UICollectionViewController, CardStackCellDelegate, CardStackLayoutDataSource {
    enum CardState: Int {
        case Normal = 0
        case Selected = 1
        case Collapsed = 2
    }

    weak var dataSource: CardStackControllerDataSource? = nil
    weak var delegate: CardStackControllerDelegate? = nil

    init(layout: CardStackLayout) {
        super.init(collectionViewLayout: layout)
        layout.dataSource = self
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView?.registerClass(CardStackCell.self, forCellWithReuseIdentifier: CardStackCell.Indentifier)
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let objects = self.dataSource?.objects() {
            return objects.count
        }

        return 0
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(CardStackCell.Indentifier, forIndexPath: indexPath) as! CardStackCell
        cell.delegate = self
        cell.indexPath = indexPath

        return cell
    }

    // MARK: CardStackCellDelegate

    func expandRows() {
        let count = self.dataSource!.objects().count
        var cards = self.dataSource?.objects()

        for index in 0..<count {
            cards?.removeAtIndex(index)
            cards?.insert(CardStackController.CardState.Normal.rawValue, atIndex: index)
        }

        self.dataSource?.updateObjects(cards!)
    }

    func collapseRows(selectedRow: Int) {
        let count = self.dataSource!.objects().count
        var cards = self.dataSource?.objects()

        for index in 0..<count {
            cards?.removeAtIndex(index)

            if index == selectedRow {
                cards?.insert(CardStackController.CardState.Selected.rawValue, atIndex: index)
            } else {
                cards?.insert(CardStackController.CardState.Collapsed.rawValue, atIndex: index)
            }
        }

        self.dataSource?.updateObjects(cards!)
    }

    func cellDidPanAtIndexPath(cell: CardStackCell, indexPath: NSIndexPath?) {
        self.animateSelectionAtIndexPath(indexPath!)
    }

    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        self.animateSelectionAtIndexPath(indexPath)

        self.delegate?.cardStackControllerDidSelectItemAtIndexPath(self, indexPath: indexPath)
    }

    func animateSelectionAtIndexPath(indexPath: NSIndexPath) {
        self.collectionView?.performBatchUpdates({ () -> Void in
            self.selectCardAtIndexPath(indexPath)
            }, completion: { finished in
                let layout = self.collectionView?.collectionViewLayout
                layout?.invalidateLayout()
        })
    }

    func selectCardAtIndexPath(indexPath: NSIndexPath) {
        let state = self.cardStateAtIndexPath(indexPath)
        switch state {
        case 0:
            self.collapseRows(indexPath.row)
        case 1, 2:
            self.expandRows()
        default: break
        }
    }

    // MARK: CardStackLayoutDataSource

    func cardStateAtIndexPath(indexPath: NSIndexPath) -> Int {
        let cards  = self.dataSource?.objects()
        let state = cards![indexPath.row]
        return state
    }
}

