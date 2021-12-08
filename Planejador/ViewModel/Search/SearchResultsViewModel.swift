import SwiftUI

extension SearchResultsView {
    final class ViewModel: ObservableObject {
        private static let route = URL(string: "http://0.0.0.0:8080/api/busca")!

        @Published var text: String
        @Published var matches: [Match]?
        @Published var content: [Matchable]?
        @Published var courses = [Course]()
        @Published var disciplines = [Discipline]()

        var selectedType: ContentType

        init(_ searchText: String, _ selectedType: ContentType) {
            self.text = searchText
            self.selectedType = selectedType

            Search.search(query: searchText) { matches in
                self.matches = matches
                self.filterMatches()
                self.filterCourses()
                self.filterDisciplines()
            }
        }

        func filterMatches() {
            matches = matches?.filter({$0.content == self.selectedType})
        }

        func filterCourses() {
            if let safeMatches = matches {
                for match in safeMatches {
                    match.lookupContent { content in
                        if let course = content as? Course {
                            self.courses.append(course)
                        }
                    }
                }
            }
        }

        func filterDisciplines() {
            if let safeMatches = matches {
                for match in safeMatches {
                    match.lookupContent { content in
                        if let discipline = content as? Discipline {
                            self.disciplines.append(discipline)
                        }
                    }
                }
            }
        }
    }
}
