
import UIKit

class AddViewController: UIViewController {
  
  @IBOutlet weak var textView: UITextView!
  @IBAction func saveEntry(_ sender: UIBarButtonItem) {
    API.addEntry(body: textView.text) {
      self.navigationController?.popToRootViewController(animated: true)
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    textView.becomeFirstResponder()
  }
}
