import SwiftUI

struct SearchView: View {
    @State private var searchText = ""

    var body: some View {
        SearchContent(searchText: $searchText)
            .searchable(text: $searchText)
    }
}

private struct SearchContent: View {
    @Binding var searchText: String

    var body: some View {
        if searchText.isEmpty {
            Color.red
        } else {
            SearchResultsView(searchText)
        }
    }
}
