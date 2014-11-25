import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func pulsarCarta(sender: UIButton) {
        if let contents = sender.currentTitle {
            sender.setTitle(nil, forState: UIControlState.Normal)
            sender.setBackgroundImage(UIImage(named: "cardback"), forState: UIControlState.Normal)
        } else {
            sender.setTitle("A❤️", forState: UIControlState.Normal)
            sender.setBackgroundImage(UIImage(named: "cardfront"), forState: UIControlState.Normal)
        }
    }
}