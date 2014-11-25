import Foundation

class PlayingCard : Card {
    let matchPoints: Int = 4
    let penaltyPoints: Int = 4

    var rank: String
    var suit: String
    
    override var contents: String {
        get {
            return "\(self.rank)\(self.suit)"
        }
        set {
            super.contents = newValue
            // TODO: Pendiente
            //            self.rank = newValue.substringWithRange(Range<String.Index>(start: 0, end: 1))
            //            self.suit = newValue.substringWithRange(Range<String.Index>(start: 1, end: 2))
        }
    }

    init(rank: String, suit: String) {
        self.rank = rank
        self.suit = suit
    }
    
    class func validRanks() -> [String] {
        return ["A", "J", "Q", "K"]
    }

    class func validSuits() -> [String] {
        return ["❤️", "♠️", "♣️", "♦️"]
    }

    class func maxRank() -> Int {
        return PlayingCard.validRanks().count - 1
    }

    func setRank(rank: String) {
        self.rank = rank
    }
    
    func setSuit(suit: String) {
        self.suit = suit
    }

    func match(otherCards: [PlayingCard]) -> Int {
        var score: Int = 0
        for card in otherCards {
            if self.isSuiteSameColour(card) && self.isRankCompatible(card) {
                score += matchPoints
            } else {
                score -= penaltyPoints
            }
        }
        return score
    }

    func isRed() -> Bool {
        return suit == "❤️" || suit == "♦️"
    }
    
    func isBlack() -> Bool {
        return suit == "♠️" || suit == "♣️"
    }

    func isSuiteSameColour(otherCard: PlayingCard) -> Bool {
        return (self.isRed() && otherCard.isRed()) || (self.isBlack() && otherCard.isBlack())
    }
    
    func isRankCompatible(otherCard: PlayingCard) -> Bool {
        return self.rank == otherCard.rank
    }

}