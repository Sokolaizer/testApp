
import UIKit

class ShowViewController: UIViewController {
  
  var text = ""
  
  override func viewDidLoad() {
    super.viewDidLoad()
    textView.text = text
  }
  @IBOutlet weak var textView: UITextView!
}
