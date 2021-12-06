import Foundation

struct Course {
    let code: String
    let name: String
    let tree: CourseTree
}

extension Course: Decodable {
    enum CodingKeys: String, CodingKey {
        case code
        case name
        case tree
        case variant
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        code = try values.decode(String.self, forKey: .code)
        name = try values.decode(String.self, forKey: .name)
        if let tree = try? values.decode(DisciplineTree.self, forKey: .tree) {
            self.tree = .unique(tree)
        } else if let variants = try? values.decode([Variant].self, forKey: .variant) {
            self.tree = .variants(variants)
        } else {
            throw CourseTreeError.invalidCourseTree
        }
    }
}

private enum CourseTreeError: Error {
    case invalidCourseTree
}
