import SwiftUI

struct CourseDetailView: View {
    @ObservedObject private var viewModel: ViewModel

    init(_ course: Course) {
        viewModel = ViewModel(course)
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text(viewModel.course.name)
                    .font(.appTitle)
                switch viewModel.course.tree {
                case .unique(let tree):
                    TreeView(tree: tree)
                case .variants(let variants):
                    VariantsView(variants)
                }
            }
            .padding(.horizontal)
        }
        .navigationTitle("Curso \(viewModel.course.code)")
    }
}

struct VariantsView: View {
    let variants: [Variant]
    @State var selectedVariant: Variant

    init(_ variants: [Variant]) {
        self.variants = variants
        self.selectedVariant = variants.first!
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Modalidade")
                .font(.appHeadline)

            Picker("Modalidades", selection: $selectedVariant) {
                ForEach(variants, id: \.self) { variant in
                    Text(variant.name)
                }
            }

            TreeView(tree: selectedVariant.tree)
        }
    }
}

struct TreeView: View {
    let tree: DisciplineTree

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Árvore Sugerida")
                .font(.appHeadline)

            ScrollView(.horizontal, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 8) {
                    ForEach(0 ..< tree.count) { periodIndex in
                        HStack {
                            Text("\(periodIndex + 1)")
                                .font(.appBody)
                                .frame(width: 1.5 * Font.bodyPointSize, alignment: .trailing)
                            ForEach(tree[periodIndex], id: \.self) { disciplineCode in
                                DisciplineCell(code: disciplineCode)
                            }
                        }
                    }
                }
            }
        }
    }
}

struct DisciplineCell: View {
    @ObservedObject private var viewModel: ViewModel

    init(code: String) {
        self.viewModel = ViewModel(code: code)
    }

    var body: some View {
        NavigationLink(destination: {
            if let discipline = viewModel.discipline {
                DisciplineDetailView(discipline)
            }
        }, label: {
            DisciplineCodeCell(code: viewModel.code)
        })
    }
}
