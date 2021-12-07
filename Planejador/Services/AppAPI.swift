import Foundation

enum AppAPI {
    static var route = URL(string: "http://0.0.0.0:8080/api/")!
}

enum AppAPIError: Error {
    case invalidRoute
}
