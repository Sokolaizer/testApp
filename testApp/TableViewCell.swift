
import UIKit

class TableViewCell: UITableViewCell {
  
  @IBOutlet weak var createdDateLabel: UILabel!
  @IBOutlet weak var modifiedDateLabel: UILabel!
  @IBOutlet weak var messageLabel: UILabel!
  
  func setUpCell(with entry: Entry) {
    messageLabel.text = Formatter.truncate(text: entry.body, length: 200)
    createdDateLabel.text = "Created " + Formatter.formatDateString(from: entry.dateAdded)
    guard entry.dateAdded != entry.dateModified else {return}
    modifiedDateLabel.text = "Modified " + Formatter.formatDateString(from: entry.dateModified)
    modifiedDateLabel.isHidden = false
  }
}
