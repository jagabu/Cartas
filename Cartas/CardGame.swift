import Foundation

class CardGame {
    var score: Int = 0
    var resultado: String = ""
    var cards: [PlayingCard] = [PlayingCard]()
    
    let MISMATCH_PENALTY = 2;
    let MATCH_BONUS = 4;
    let COST_TO_CHOOSE = 1;
    
    init(count: UInt, deck: PlayingCardDeck) {
        for i in 0..<count {
            if let card = deck.drawRandomCard() as? PlayingCard {
                cards.append(card)
            }
        }
    }
    
    func chooseCardAtIndex(index: UInt) {
        if let card = cardAtIndex(index) {
            if !card.isMatched() {
                if card.isChosen() {
                    card.chosen = false
                } else {
                    for otherCard in cards {
                        if otherCard !== card {
                            if otherCard.isChosen() && !otherCard.isMatched() {
                                var newScore: Int = card.match([otherCard])
                                if newScore != 0 {
                                    newScore = newScore * MATCH_BONUS
                                    score += newScore
                                    otherCard.matched = true
                                    card.matched = true
                                    resultado = "\(card.contents) y \(otherCard.contents) emparejan: \(newScore) puntos"
                                } else {
                                    newScore = -MISMATCH_PENALTY
                                    score += newScore
                                    otherCard.chosen = false
                                    resultado = "\(card.contents) y \(otherCard.contents) no emparejan: \(newScore) puntos"
                                }
                                break
                            }
                        }
                    }
                    score -= COST_TO_CHOOSE
                    card.chosen = true
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