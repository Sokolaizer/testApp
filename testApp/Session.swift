
import Foundation
struct Session {
  enum Constants {
    static let backSegue = "backSegue"
  }
  static func start(viewController: TableViewController) {
    API.startNewSession(complition: {
      self.getEntries(viewController: viewController)
    }) { error in
      Navigation.showAlert(with: error, and: {
        start(viewController: viewController)
      }, sender: viewController)
    }
  }
  
  static func getEntries(viewController: TableViewController) {
    API.getEntries(complition: { entries in
      viewController.entries = entries[0]
      viewController.tableView.reloadData()
    }, failureComplition: { error in
      Navigation.showAlert(with: error, and: {
        self.getEntries(viewController: viewController)
      }, sender: viewController)
    })
  }
  
  static func addEntry(viewController: AddViewController) {
    API.addEntry(body: viewController.textView.text, complition: {
      viewController.performSegue(withIdentifier: Constants.backSegue, sender: viewController)
    }, failureComplition: { error in
      viewController.textView.endEditing(true)
      Navigation.showAlert(with: error, and: {
        self.addEntry(viewController: viewController)
      }, sender: viewController)
    })
  }
}
