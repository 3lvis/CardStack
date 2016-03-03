import UIKit

protocol CardStackCellDelegate: class {
    func cellDidPanAtIndexPath(cell: CardStackCell, indexPath: NSIndexPath?)
}

class CardStackCell: UICollectionViewCell {
    static let Indentifier = "CardStackCellIdentifier"
    var indexPath: NSIndexPath?
    weak var delegate: CardStackCellDelegate? = nil

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(frame: CGRect) {
        super.init(frame: CGRectMake(0.0, 0.0, frame.width, frame.height))

        let cardView = UIView(frame: CGRectMake(0.0, 0.0, frame.width, frame.height))
        cardView.backgroundColor = self.getRandomColor()
        cardView.layer.cornerRadius = 10.0
        cardView.clipsToBounds = true
        self.contentView.addSubview(cardView)

        self.layer.shadowColor = UIColor.blackColor().CGColor
        self.layer.shadowOffset = CGSize(width: 0, height: -2)
        self.layer.shadowOpacity = 0.5
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: 10.0).CGPath
        self.clipsToBounds = false

        let gestureRecognizer = UIPanGestureRecognizer(target: self, action: "panning:")
        self.addGestureRecognizer(gestureRecognizer)
    }

    func panning(recognizer: UIPanGestureRecognizer) {
        let translation = recognizer.translationInView(self)
        recognizer.view?.center = CGPoint(x: recognizer.view!.center.x, y: recognizer.view!.center.y + translation.y)
        recognizer.setTranslation(CGPoint(x: 0, y: 0), inView: self)

        if recognizer.state == .Ended {
            self.delegate?.cellDidPanAtIndexPath(self, indexPath: self.indexPath)
        }
    }

    func getRandomColor() -> UIColor{
        let randomRed:CGFloat = CGFloat(arc4random()) / CGFloat(UInt32.max)
        let randomGreen:CGFloat = CGFloat(arc4random()) / CGFloat(UInt32.max)
        let randomBlue:CGFloat = CGFloat(arc4random()) / CGFloat(UInt32.max)
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
    }
}
