
import Foundation
enum ResponseData {
  struct SessionResponse: Codable {
    let data: Session
    struct Session: Codable {
      let session: String
    }
  }
  struct EntriesResponse: Codable {
    let data: [[Entry]]
  }
}
