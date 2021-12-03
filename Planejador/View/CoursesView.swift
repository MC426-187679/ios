import SwiftUI

struct CoursesView: View {
    @ObservedObject private var viewModel = CoursesViewModel()

    var body: some View {
        Form {
            ForEach(viewModel.allCourses, id: \.self.code) { course in
                NavigationLink(destination: {
                    Text("Item Page View")
                }, label: {
                    Text(course.code)
                })
            }
        }
    }
}

struct CoursesView_Previews: PreviewProvider {
    static var previews: some View {
        CoursesView()
    }
}
