

import UIKit

class ErrorView: UIView {

  @IBAction func retryButton(_ sender: Any) {
  }
  
  @IBOutlet weak var messageView: UIView!{
    didSet {
      messageView.layer.cornerRadius = 8.0
    }
  }
  @IBOutlet weak var errorLabel: UILabel!
}

protocol ErrorDelegate {
  var errorText: String {get set}
  func retry()
}
