import Foundation

class CardGame {
    var cards: [PlayingCard] = [PlayingCard]()
    
    init(cardsCount: UInt, deck: PlayingCardDeck) {
        //cards = []
        for i in 0..<cardsCount {
            if let card = deck.drawRandomCart() as? PlayingCard {
                cards.append(card)
            }
        }
    }

    func chooseCardAtIndex(index: UInt) {
        var card = cards[Int(index)]
        if !card.isMatched() {
            card.chosen = !card.chosen
            for otherCard in cards {
                if otherCard !== card && otherCard.isChosen() && !otherCard.isMatched() {
//                    var score = card.match(otherCards:
                }
            }
        }
    }

    func cardAtIndex(index: UInt) -> PlayingCard? {
        if Int(index) < cards.count {
            return cards[Int(index)]
        } else {
            return nil
        }
    }
}