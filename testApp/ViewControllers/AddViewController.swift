
import UIKit

class AddViewController: UIViewController {
  enum Constants {
    static let defaultInset: CGFloat = 16.0
    static let cancelSegueIdentifier = "cancelSegue"
  }
  
  @IBOutlet weak var textView: UITextView! {
    didSet {
      textView.text = ""
      textView.textContainerInset = UIEdgeInsets(top: Constants.defaultInset, left: Constants.defaultInset, bottom: Constants.defaultInset, right: Constants.defaultInset)
    }
  }

  @IBAction func cancelAdding(_ sender: UIBarButtonItem) {
    performSegue(withIdentifier: Constants.cancelSegueIdentifier, sender: self)
  }
  
  @IBAction func saveEntry(_ sender: UIBarButtonItem) {
    API.addEntry(body: textView.text,
                 complition: {self.navigationController?.popToRootViewController(animated: true)}, failureComplition: {
                  // TODO:- Show errorView
//                  let errorView = ErrorView(frame: UIScreen.main.bounds)
//                  self.view.addSubview(errorView)
//                  self.view.setNeedsDisplay()
    })
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    textView.becomeFirstResponder()
  }
}
