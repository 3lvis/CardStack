import UIKit

class RootController: CardStackController, CardStackControllerDataSource, CardStackControllerDelegate {
    var cards = [Int]()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.dataSource = self
        self.delegate = self
        self.view.backgroundColor = UIColor.greenColor()

        cards.append(CardStackController.CardState.Normal.rawValue)
        cards.append(CardStackController.CardState.Normal.rawValue)
        cards.append(CardStackController.CardState.Normal.rawValue)
        cards.append(CardStackController.CardState.Normal.rawValue)
        cards.append(CardStackController.CardState.Normal.rawValue)
    }


    // MARK: CardStackControllerDataSource

    func objects() -> [Int] {
        return cards
    }

    func clearObjects() {
        cards.removeAll(keepCapacity: false)
    }

    // MARK: CardStackControllerDelegate

    func cardStackControllerDidSelectItemAtIndexPath(cardStackController: CardStackController, indexPath: NSIndexPath) {
        
    }
}
