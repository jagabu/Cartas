import Foundation

class Deck {
    var cards: [Card] = [Card]()
    
    func addCard(card: Card, atTop: Bool = true) {
        if atTop {
            self.cards.insert(card, atIndex: 0)
        } else {
            self.cards.append(card)
        }
    }

    func drawRandomCard() -> Card? {
        var card: Card?

        if cards.count > 0 {
            var index = Int(arc4random() % UInt32(cards.count))
            card = cards[index]
            cards.removeAtIndex(index)
        }

        return card
    }
}