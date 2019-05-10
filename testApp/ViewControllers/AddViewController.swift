
import UIKit

class AddViewController: UIViewController {
  enum Constants {
    static let defaultInset: CGFloat = 16.0
    static let backSegue = "backSegue"
  }
  @IBOutlet weak var textView: UITextView! {
    didSet {
      textView.text = ""
      textView.textContainerInset = UIEdgeInsets(top: Constants.defaultInset,
                                                 left: Constants.defaultInset,
                                                 bottom: Constants.defaultInset,
                                                 right: Constants.defaultInset)
    }
  }

  @IBAction func cancelAddingButton(_ sender: UIBarButtonItem) {
    performSegue(withIdentifier: Constants.backSegue, sender: self)
  }
  
  @IBAction func saveEntryButton(_ sender: UIBarButtonItem) {
    Session.addEntry(viewController: self)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    textView.becomeFirstResponder()
  }
}

