import UIKit

protocol CardStackControllerDataSource: class {
    func objects() -> [Int]
    func updateObjects(newCards: [Int])
}

protocol CardStackControllerDelegate: class {
    func cardStackControllerDidSelectItemAtIndexPath(cardStackController: CardStackController, indexPath: NSIndexPath)
}

enum CardState: Int {
    case Normal = 0
    case Selected = 1
    case Collapsed = 2
}

class CardStackController: UICollectionViewController, CardStackCellDelegate, CardStackLayoutDataSource {
    weak var dataSource: CardStackControllerDataSource? = nil
    weak var delegate: CardStackControllerDelegate? = nil

    init(layout: CardStackLayout) {
        super.init(collectionViewLayout: layout)

        layout.dataSource = self
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("Storyboards is not supported in this version, please feel free to contribute if this is something you need.")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView?.registerClass(CardStackCell.self, forCellWithReuseIdentifier: CardStackCell.Indentifier)
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataSource?.objects().count ?? 0
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
        var cards = [Int]()

        for index in 0..<count {
            cards.insert(CardState.Normal.rawValue, atIndex: index)
        }

        self.dataSource!.updateObjects(cards)
    }

    func collapseRows(selectedRow: Int) {
        let count = self.dataSource!.objects().count
        var cards = [Int]()

        for index in 0..<count {
            if index == selectedRow {
                cards.insert(CardState.Selected.rawValue, atIndex: index)
            } else {
                cards.insert(CardState.Collapsed.rawValue, atIndex: index)
            }
        }

        self.dataSource!.updateObjects(cards)
    }

    func cellDidPanAtIndexPath(cell: CardStackCell, indexPath: NSIndexPath?) {
        self.animateSelectionAtIndexPath(indexPath!)
    }

    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        self.animateSelectionAtIndexPath(indexPath)

        self.delegate?.cardStackControllerDidSelectItemAtIndexPath(self, indexPath: indexPath)
    }

    func animateSelectionAtIndexPath(indexPath: NSIndexPath) {
        self.collectionView?.performBatchUpdates({
            self.selectCardAtIndexPath(indexPath)
            }, completion: { finished in
                let layout = self.collectionView?.collectionViewLayout
                layout?.invalidateLayout()
        })
    }

    func selectCardAtIndexPath(indexPath: NSIndexPath) {
        let state = self.cardStateAtIndexPath(indexPath)
        switch state {
        case CardState.Normal.rawValue:
            self.collapseRows(indexPath.row)
        case CardState.Selected.rawValue, CardState.Collapsed.rawValue:
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

