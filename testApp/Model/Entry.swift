
import Foundation
struct Entry: Codable {
  let body: String
  let dateAdded: String
  let dateModified: String
  
  enum CodingKeys: String, CodingKey {
    case body
    case dateAdded = "da"
    case dateModified = "dm"
  }
}
