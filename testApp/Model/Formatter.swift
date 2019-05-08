
import Foundation
struct Formatter {
  
  static func formatDateString(from timestampString: String) -> String {
    let int = Int(timestampString) ?? 0
    let date = Date(timeIntervalSince1970: TimeInterval(int))
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .medium
    return dateFormatter.string(from: date)
  }
  
  static func truncate(text: String, length: Int) -> String {
    let trailing = "…"
    return (text.count > length) ? text.prefix(length) + trailing : text
  }
  
}
