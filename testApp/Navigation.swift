
import UIKit
struct Navigation {
  
  static func toShowViewController(from viewContoller: UITableViewController, with segue: UIStoryboardSegue, and entries: [Entry], sender: Any?) {
    guard let cell = sender as? TableViewCell else {return}
    let indexPath = viewContoller.tableView.indexPath(for: cell)
    let destination = segue.destination as? ShowViewController
    guard let index = indexPath?.row else {return}
    destination?.text = entries[index].body
  }
  
  static func showAlert(with error: Error, and actionFunc: @escaping () -> (), sender: UIViewController) {
    let action = UIAlertAction(title: "Retry", style: .default) {(action: UIAlertAction) in actionFunc()}
    let alertController = UIAlertController(title: "Alert", message: error.localizedDescription, preferredStyle: .alert)
    alertController.addAction(action)
    sender.present(alertController, animated: true, completion: nil)
  }
}
