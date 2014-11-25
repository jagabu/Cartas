import UIKit

class ViewController: UIViewController {

    @IBOutlet var botonesCarta: [UIButton]!
    @IBOutlet weak var puntosLabel: UILabel!

    var deck: PlayingCardDeck = PlayingCardDeck()
    var cardGame: CardGame!

    override func viewDidLoad() {
        super.viewDidLoad()
        nuevoJuego()
    }

    @IBAction func pulsarCarta(botonCarta: UIButton) {
        if let index = find(botonesCarta, botonCarta) {
            cardGame.chooseCardAtIndex(UInt(index))
            actualizarUI()
        }
    }

    @IBAction func pulsarNuevo(sender: UIButton) {
        nuevoJuego()
    }

    func nuevoJuego() {
        cardGame = CardGame(cardsCount: UInt(botonesCarta.count), deck: PlayingCardDeck())
        actualizarUI()
    }
    
    func actualizarUI() {
        for botonCarta in botonesCarta {
            if let index = find(botonesCarta, botonCarta) {
                if let card = cardGame.cardAtIndex(UInt(index)) {
                    if card.isChosen() || card.isMatched() {
                        botonCarta.setTitle(card.contents, forState: UIControlState.Normal)
                        botonCarta.setBackgroundImage(UIImage(named: "cardfront"), forState: UIControlState.Normal)
                    } else {
                        botonCarta.setTitle(nil, forState: UIControlState.Normal)
                        botonCarta.setBackgroundImage(UIImage(named: "cardback"), forState: UIControlState.Normal)
                    }
                }
            }
        }
    }
}