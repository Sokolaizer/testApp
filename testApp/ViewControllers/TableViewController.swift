
import UIKit

class TableViewController: UITableViewController {
  enum Constants {
    static let cellIdentifier = "Cell"
    static let addSegueIdentifier = "addSegue"
    static let showSegueIdentifier = "showSegue"
  }
  
  var entries: [Entry] = []
  
  @IBAction func addRowButton(_ sender: UIBarButtonItem) {
    performSegue(withIdentifier: Constants.addSegueIdentifier, sender: self)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    Session.start(viewController: self)
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(false)
    Session.getEntries(viewController: self)
  }
  
  // MARK: - UITableViewDataSource
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return entries.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath)
    
    guard let tableViewCell = cell as? TableViewCell else {return cell}
    tableViewCell.setUpCell(with: entries[indexPath.row])
    return tableViewCell
  }
  
  // MARK: - Navigation
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    guard let identifier = segue.identifier else {return}
    switch identifier {
    case Constants.showSegueIdentifier:
      Navigation.toShowViewController(from: self, with: segue, and: entries, sender: sender)
    default: break
    }
  }
}
