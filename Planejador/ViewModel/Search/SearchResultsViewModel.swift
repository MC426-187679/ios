import SwiftUI

extension SearchResultsView {
    final class ViewModel: ObservableObject {
        private static let route = URL(string: "http://0.0.0.0:8080/api/busca")!

        @Published var text: String

        init(searchText: String) {
            self.text = searchText
            Search.search(query: searchText)
        }
    }
}
