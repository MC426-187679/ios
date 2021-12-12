import Foundation

struct Discipline {
    let code: String
    let name: String
    let credits: Int
    let syllabus: String
    let requirements: [[Requirement]]?
    let requiredBy: [String]?
}

extension Discipline: Decodable {
    enum CodingKeys: String, CodingKey {
        case code
        case name
        case credits
        case syllabus
        case reqs
        case reqBy
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        code = try values.decode(String.self, forKey: .code)
        name = try values.decode(String.self, forKey: .name)
        credits = try values.decode(Int.self, forKey: .credits)
        syllabus = try values.decode(String.self, forKey: .syllabus)
        requirements = try? values.decode([[Requirement]].self, forKey: .reqs)
        requiredBy = try? values.decode([String].self, forKey: .reqBy)
    }
}

extension Discipline: Matchable {
    var cleanCode: String {
        return code
    }
}
