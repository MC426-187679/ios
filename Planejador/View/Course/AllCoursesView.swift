import SwiftUI

struct AllCoursesView: View {
    @ObservedObject private var viewModel = ViewModel()

    var body: some View {
        Form {
            ForEach(viewModel.allCourses, id: \.self.code) { course in
                NavigationLink(destination: {
                    Text("Course Page View")
                }, label: {
                    Text(course.name)
                })
            }
        }
    }
}

struct AllCoursesView_Previews: PreviewProvider {
    static var previews: some View {
        AllCoursesView()
    }
}
