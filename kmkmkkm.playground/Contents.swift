import UIKit
import PlaygroundSupport

class SeventhTaskViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        DispatchQueue.global().async {
            DispatchQueue.global().sync {
                print(5)
            }
        }
    }
}

let vc = SeventhTaskViewController()
let view = vc.view



// 1, 2, 6, 7, 3, 4, 5

// 1, 2, 6, 3, 4, 7, 5
