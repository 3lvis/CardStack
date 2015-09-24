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

    func updateObjects(newCards: [Int]) {
        self.cards = newCards
    }

    func clearObjects() {
        cards.removeAll(keepCapacity: false)

        cards.append(CardStackController.CardState.Normal.rawValue)
        cards.append(CardStackController.CardState.Normal.rawValue)
        cards.append(CardStackController.CardState.Normal.rawValue)
        cards.append(CardStackController.CardState.Normal.rawValue)
        cards.append(CardStackController.CardState.Normal.rawValue)
    }

    // MARK: CardStackControllerDelegate

    func cardStackControllerDidSelectItemAtIndexPath(cardStackController: CardStackController, indexPath: NSIndexPath) {
        
    }
}
