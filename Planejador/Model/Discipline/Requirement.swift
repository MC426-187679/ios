import Foundation

struct Requirement {
    let code: String
    let special: Bool
    let partial: Bool
}

extension Requirement: Decodable {
    enum CodingKeys: String, CodingKey {
        case code
        case special
        case partial
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        code = try values.decode(String.self, forKey: .code)
        special = (try? values.decode(Bool.self, forKey: .special)) ?? false
        partial = (try? values.decode(Bool.self, forKey: .partial)) ?? false
    }
}

extension Requirement: Equatable {
    static func == (lhs: Requirement, rhs: Requirement) -> Bool {
        return lhs.code == rhs.code
    }
}
