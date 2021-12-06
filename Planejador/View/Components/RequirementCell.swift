import SwiftUI

struct RequirementCell: View {
    let requirement: Requirement

    var body: some View {
        Text(requirement.code)
            .font(.appBody)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 4)
                    .foregroundColor(.gray)
            )
    }
}
