import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    @State private var selectedType: ContentType = .discipline

    var body: some View {
        VStack {
            Picker("Flavor", selection: $selectedType) {
                Text("Disciplina").tag(ContentType.discipline)
                Text("Curso").tag(ContentType.course)
            }
            SearchContent(searchText: $searchText, selectedType: selectedType)
                .searchable(text: $searchText)
        }.pickerStyle(.segmented)
    }
}

private struct SearchContent: View {
    @Binding var searchText: String
    let selectedType: ContentType

    var body: some View {
        if searchText.isEmpty {
            EmptyContentView(searchText: $searchText)
        } else {
            SearchResultsView(searchText, selectedType)
        }
    }
}

private struct EmptyContentView: View {
    @Binding var searchText: String
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: "questionmark.folder.fill")
                .font(.system(size: 100, weight: .regular))
                .opacity(0.8)
            if searchText.isEmpty {
                Text("Digite algo na caixa de pesquisa para pesquisar")
            } else {
                Text("Nenhum resultado encontrado")
            }
            Spacer()
        }.font(.caption2)
            .foregroundColor(.secondary)

    }
}
