import SwiftUI

struct DisciplineDetailView: View {
    @ObservedObject private var viewModel: ViewModel

    init(_ discipline: Discipline) {
        self.viewModel = ViewModel(discipline)
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text(viewModel.discipline.name)
                    .font(.appTitle)
                Text("Créditos: \(viewModel.discipline.credits)")
                    .font(.appBody.bold())
                Text("Ementa:")
                    .font(.appHeadline)
                Text(viewModel.discipline.syllabus)
                    .font(.body)
                if let requirements = viewModel.discipline.requirements {
                    Text("Pré-requisitos")
                        .font(.appHeadline)
                    RequirementsView(allRequirements: requirements)
                }
            }
            .padding(.horizontal)
        }
        .navigationTitle(viewModel.discipline.code)
    }
}

private struct RequirementsView: View {
    let allRequirements: [[Requirement]]

    var body: some View {
        ScrollView(.horizontal) {
            VStack(alignment: .leading) {
                ForEach(0 ..< allRequirements.count) { requirementsIndex in
                    HStack {
                        ForEach(allRequirements[requirementsIndex], id: \.self.code) { requirement in
                            RequirementCell(requirement: requirement)
                        }

                        if allRequirements.last != allRequirements[requirementsIndex] {
                            Text("ou")
                        }
                    }
                }
            }
        }
    }
}

struct RequirementCell: View {
    @ObservedObject private var viewModel: ViewModel

    init(requirement: Requirement) {
        self.viewModel = ViewModel(requirement: requirement)
    }

    var body: some View {
        NavigationLink(destination: {
            if let discipline = viewModel.discipline {
                DisciplineDetailView(discipline)
            }
        }, label: {
            DisciplineCodeCell(code: viewModel.requirement.code)
        })
        .disabled(viewModel.requirement.special)
    }
}
