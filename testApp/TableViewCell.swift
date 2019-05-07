
import UIKit

class TableViewCell: UITableViewCell {
  
  @IBOutlet weak var createdDateLabel: UILabel!
  @IBOutlet weak var modiefiedDateLabel: UILabel!
  @IBOutlet weak var messageLabel: UILabel!
  
  func setUpCell(with entry: Entry) {
    messageLabel.text = Formatter.trunc(text: entry.body, length: 200)
    createdDateLabel.text = "Created " + Formatter.convertDate(from: entry.da)
    guard entry.da != entry.dm else {return}
    modiefiedDateLabel.text = "Modified " + Formatter.convertDate(from: entry.dm)
  }
  
}
