import Foundation

class Card {
    var contents: String = ""
    var chosen: Bool = false
    var matched: Bool = false

    func isChosen() -> Bool {
        return self.chosen
    }
    
    func isMatched() -> Bool {
        return self.matched
    }
    
    func match(otherCards: [Card]) -> Int {
        var score: Int = 0
        for card in otherCards {
            if contents == card.contents {
                score += 1
            } else {
                score -= 1
            }
        }
        return score
    }
}