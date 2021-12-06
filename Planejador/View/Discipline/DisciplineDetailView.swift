import SwiftUI

struct DisciplineDetailView: View {
    @ObservedObject private var viewModel: DisciplineDetailViewModel

    init(_ discipline: Discipline) {
        self.viewModel = DisciplineDetailViewModel(discipline)
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text(viewModel.discipline.name)
                    .font(.appHeadline)
                Text("Créditos: \(viewModel.discipline.credits)")
                    .font(.appBody.bold())
                Text("Ementa:")
                    .font(.appHeadline)
                Text(viewModel.discipline.syllabus)
                    .font(.body)
                if let requirements = viewModel.discipline.requirements {
                    RequirementsView(allRequirements: requirements)
                }
            }
            .padding()
        }
        .navigationTitle(viewModel.discipline.code)
    }
}

private struct RequirementsView: View {
    let allRequirements: [[Requirement]]

    var body: some View {
        ScrollView(.horizontal) {
            VStack(alignment: .leading) {
                ForEach(allRequirements, id: \.self.first!.code) { requirements in
                    HStack {
                        ForEach(requirements, id: \.self.code) { requirement in
                            RequirementCell(requirement: requirement)
                        }

                        if allRequirements.last != requirements {
                            Text("ou")
                        }
                    }
                }
            }
        }
    }
}
