import Foundation

extension Discipline {
    final class Factory {
        static var shared = Factory()

        private init() {}

        private var cache: [Discipline]?

        func discipline(code: String, completion: @escaping (Discipline?) -> Void) {
            allDisciplines { allDisciplines in
                if let discipline = allDisciplines.first(where: { $0.code == code }) {
                    completion(discipline)
                } else {
                    completion(nil)
                }
            }
        }

        func disciplines(codes: [String], completion: @escaping ([Discipline]) -> Void) {
            allDisciplines { allDisciplines in
                let disciplines = allDisciplines.filter { codes.contains($0.code) }
                completion(disciplines)
            }
        }

        func allDisciplines(completion: @escaping ([Discipline]) -> Void) {
            if let disciplines = cache {
                completion(disciplines)
                return
            }

            let urls = disciplineNames.compactMap { filename in
                Bundle.main.url(forResource: filename, withExtension: "json")
            }

            let disciplines = urls.flatMap { decode(url: $0) ?? [] }
            cache = disciplines
            completion(disciplines)
        }

        private func decode(url: URL) -> [Discipline]? {
            if let data = try? Data(contentsOf: url) {
                return try? JSONDecoder().decode([Discipline].self, from: data)
            }

            return nil
        }

        var disciplineNames: [String] {
            [
                "AC", "AD", "AG", "AI", "AM", "AP", "AR",
                "AU", "BA", "BB", "BC", "BD", "BE", "BF",
                "BG", "BH", "BI", "BL", "BM", "BP", "BS",
                "BT", "BV", "BZ", "CE", "CG", "CP", "CS",
                "CV", "DB", "DC", "DE", "DM", "DO", "DS",
                "EA", "EB", "EC", "EE", "EF", "EG", "EL",
                "EM", "EN", "EP", "EQ", "ER", "ES", "ET",
                "EU", "EX", "FA", "FI", "FL", "FM", "FN",
                "FR", "FT", "F_", "GE", "GF", "GL", "GM",
                "GN", "GT", "HG", "HH", "HL", "HZ", "LA",
                "LE", "LG", "LT", "MA", "MC", "MD", "ME",
                "MG", "MH", "ML", "MP", "MS", "MU", "NC",
                "NT", "PF", "PG", "QA", "QF", "QG", "QI",
                "QL", "QO", "SI", "SL", "ST", "TA", "TL",
                "TT"
            ]
        }
    }
}
