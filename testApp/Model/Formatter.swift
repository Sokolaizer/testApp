
import Foundation
struct Formatter {
  
  static func convertDate(from string: String) -> String {
    let int = Int(string) ?? 0
    let date = Date(timeIntervalSince1970: TimeInterval(int))
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .medium
    return dateFormatter.string(from: date)
  }
  
  static func trunc(text: String, length: Int) -> String {
    let trailing = "…"
    return (text.count > length) ? text.prefix(length) + trailing : text
  }
  
}
