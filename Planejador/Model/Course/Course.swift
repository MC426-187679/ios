import Foundation

struct Course {
    let code: String
    let name: String
    let tree: CourseTree

    static func allCourses(completion: @escaping ([Course]) -> Void) {
        let urls = courseNames.compactMap { filename in
            Bundle.main.url(forResource: filename, withExtension: nil)
        }

        let courses = urls.compactMap { decode(url: $0) }
        completion(courses.sorted { Int($0.code) ?? 0 < Int($1.code) ?? 0 })
    }

    private static func decode(url: URL) -> Course? {
        if let data = try? Data(contentsOf: url) {
            return try? JSONDecoder().decode(Course.self, from: data)
        }

        return nil
    }

    static var courseNames: [String] {
        [
            "1.json", "10.json", "100.json", "101.json", "102.json", "107.json", "108.json",
            "109.json", "11.json", "110.json", "111.json", "12.json", "13.json", "14.json",
            "15.json", "16.json", "17.json", "18.json", "19.json", "2.json", "20.json",
            "200.json", "21.json", "22.json", "23.json", "25.json", "26.json", "27.json",
            "28.json", "29.json", "30.json", "34.json", "36.json", "38.json", "39.json",
            "4.json", "40.json", "41.json", "42.json", "43.json", "44.json", "45.json",
            "46.json", "47.json", "48.json", "49.json", "5.json", "50.json", "51.json",
            "53.json", "54.json", "55.json", "56.json", "57.json", "58.json", "6.json",
            "63.json", "64.json", "7.json", "75.json", "8.json", "87.json", "88.json",
            "89.json", "9.json", "94.json"
        ]
    }
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
