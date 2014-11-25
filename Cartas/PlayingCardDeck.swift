import Foundation

class PlayingCardDeck: Deck {
    override init() {
        super.init()
        for suit in PlayingCard.validSuits() {
            for rank in PlayingCard.validRanks() {
                var card = PlayingCard(rank: rank, suit: suit)
                addCard(card)
            }
        }
    }
}