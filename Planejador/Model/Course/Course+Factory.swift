import Foundation

extension Course {
    final class Factory {
        static var shared = Factory()

        private init() {}

        private var cache: [Course]?

        func allCourses(completion: @escaping ([Course]) -> Void) {
            if let courses = cache {
                completion(courses)
                return
            }

            let urls = courseNames.compactMap { filename in
                Bundle.main.url(forResource: filename, withExtension: nil)
            }

            var courses = urls.compactMap { decode(url: $0) }
            courses.sort { $0.name < $1.name }
            cache = courses
            completion(courses)
        }

        func decode(url: URL) -> Course? {
            if let data = try? Data(contentsOf: url) {
                return try? JSONDecoder().decode(Course.self, from: data)
            }

            return nil
        }

        var courseNames: [String] {
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
}
