
import UIKit

class AddViewController: UIViewController {
  enum Constants {
    static let defaultInset: CGFloat = 16.0
    static let backSegue = "backSegue"
  }
  @IBOutlet weak var textView: UITextView! {
    didSet {
      textView.text = ""
      textView.textContainerInset = UIEdgeInsets(top: Constants.defaultInset, left: Constants.defaultInset, bottom: Constants.defaultInset, right: Constants.defaultInset)
    }
  }

  @IBAction func cancelAddingButton(_ sender: UIBarButtonItem) {
    performSegue(withIdentifier: Constants.backSegue, sender: self)
  }
  
  @IBAction func saveEntryButton(_ sender: UIBarButtonItem) {
    addEntry()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    textView.becomeFirstResponder()
  }
  
  func addEntry() {
    API.addEntry(body: textView.text,
                 complition: {
                  self.performSegue(withIdentifier: Constants.backSegue, sender: self)
    }, failureComplition: { error in
      self.textView.endEditing(true)
      Navigation.showAlert(with: error, and: {
        self.addEntry()
      }, sender: self)
    })
  }
}

