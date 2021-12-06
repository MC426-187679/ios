import SwiftUI

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
            Text(viewModel.requirement.code)
                .font(.appBody.bold())
                .padding(8)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .foregroundColor(Color(UIColor.systemGray3))
                )
        })
        .disabled(viewModel.requirement.special)
    }
}
