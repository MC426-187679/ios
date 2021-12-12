import SwiftUI

struct SearchResultsView: View {
    @ObservedObject private var viewModel: ViewModel
    @State private var selectedType: ContentType

    init(_ searchText: String, _ selectedType: ContentType) {
        self.viewModel = ViewModel(searchText, selectedType)
        self.selectedType = selectedType
    }

    var body: some View {
        Form {
            ForEach(viewModel.courses, id: \.self.code) { match in
                NavigationLink(destination: { CourseDetailView(match) }, label: {
                    MatchView(match)

                })
            }
            ForEach(viewModel.disciplines, id: \.self.code) { match in
                NavigationLink(destination: { DisciplineDetailView(match) }, label: {
                    MatchView(match)
                })
            }
        }
    }
}

struct MatchView: View {
    let match: Matchable

    init(_ match: Matchable) {
        self.match = match
    }

    var body: some View {
        HStack {
            Text(match.cleanCode).monospacedDigit()
            Divider()
            Text(match.name)
        }
    }
}
