import Foundation

struct Requirement: Decodable {
    let code: String
    let special: Bool
    let partial: Bool
}
