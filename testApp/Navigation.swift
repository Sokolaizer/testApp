
import UIKit
struct Navigation {

  
  static func toShowViewController(from viewContoller: UITableViewController, with segue: UIStoryboardSegue, and entries: [Entry], sender: Any?) {
    guard let cell = sender as? TableViewCell else {return}
    let indexPath = viewContoller.tableView.indexPath(for: cell)
    let destination = segue.destination as? ShowViewController
    guard let index = indexPath?.row else {return}
    destination?.text = entries[index].body
  }
}
