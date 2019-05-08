
import UIKit

class ShowViewController: UIViewController {
  enum Constants {
    static let defaultInset: CGFloat = 16.0
  }
  var text = ""
  
  override func viewDidLoad() {
    super.viewDidLoad()
    textView.text = text
  }
  @IBOutlet weak var textView: UITextView! {
    didSet {
      textView.textContainerInset = UIEdgeInsets(top: Constants.defaultInset, left: Constants.defaultInset, bottom: Constants.defaultInset, right: Constants.defaultInset)
    }
  }
}
