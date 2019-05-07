
import Foundation
struct Preferences: Codable {
  let url: String
  let token: String
  let user: String
  let addEntry: String
  let getEntries: String
  let newSession: String
  let parameters: Parameter?
  
  struct Parameter: Codable {
    let a: String
    let token: String
    let body: String
    let session: String
  }
  
  static func get() -> Preferences {
    guard let path = Bundle.main.path(forResource: "Info", ofType: "plist"),
      let xml = FileManager.default.contents(atPath: path) else {return Preferences()}
    do {
      let preferences = try PropertyListDecoder().decode(Preferences.self, from: xml)
      return preferences
    } catch {
      print(error)
      return Preferences()
    }
  }
  init() {
    self.url = ""
    self.token = ""
    self.user = ""
    self.addEntry = ""
    self.getEntries = ""
    self.newSession = ""
    self.parameters = nil
  }
}
