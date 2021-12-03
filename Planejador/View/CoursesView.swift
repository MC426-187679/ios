import SwiftUI

struct CoursesView: View {
    var body: some View {
        ItemsView<Course>()
    }
}

struct CoursesView_Previews: PreviewProvider {
    static var previews: some View {
        CoursesView()
    }
}
