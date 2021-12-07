import SwiftUI

struct SearchResultsView: View {
    @ObservedObject private var viewModel: ViewModel

    init(_ searchText: String) {
        viewModel = ViewModel(searchText: searchText)
    }

    var body: some View {
        Text(viewModel.text)
    }
}
