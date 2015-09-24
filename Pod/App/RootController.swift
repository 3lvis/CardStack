import UIKit

class RootController: CardStackController, CardStackControllerDataSource, CardStackControllerDelegate {
    var cards = [Int]()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.dataSource = self
        self.delegate = self
        self.view.backgroundColor = UIColor.greenColor()

        cards.append(CardState.Normal.rawValue)
        cards.append(CardState.Normal.rawValue)
        cards.append(CardState.Normal.rawValue)
        cards.append(CardState.Normal.rawValue)
        cards.append(CardState.Normal.rawValue)
    }

    // MARK: CardStackControllerDataSource

    func objects() -> [Int] {
        return cards
    }

    func updateObjects(newCards: [Int]) {
        self.cards = newCards
    }

    // MARK: CardStackControllerDelegate

    func cardStackControllerDidSelectItemAtIndexPath(cardStackController: CardStackController, indexPath: NSIndexPath) {
        
    }
}
