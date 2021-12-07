import SwiftUI

struct AllCoursesView: View {
    @ObservedObject private var viewModel = ViewModel()

    var body: some View {
        Form {
            ForEach(viewModel.allCourses, id: \.self.code) { course in
                NavigationLink(destination: {
                    CourseDetailView(course)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
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
