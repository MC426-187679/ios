import SwiftUI

struct DisciplineCodeCell: View {
    let code: String

    var body: some View {
        Text(code)
            .font(.appBody.bold())
            .padding(8)
            .frame(width: 6 * Font.bodyPointSize)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .foregroundColor(Color(UIColor.systemGray6))
            )
    }
}

struct DisciplineCodeCell_Previews: PreviewProvider {
    static var previews: some View {
        DisciplineCodeCell(code: "MC102")
    }
}
