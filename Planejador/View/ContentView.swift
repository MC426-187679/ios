import SwiftUI

struct ContentView: View {
    private let disciplinesViewTitle = "Disciplinas"
    private let coursesViewTitle = "Cursos"
    private let navigationStyle = StackNavigationViewStyle()

    var body: some View {
        TabView {
            NavigationView {
                DisciplinesView()
                    .navigationBarTitle(disciplinesViewTitle)
            }
            .navigationViewStyle(navigationStyle)
            .tabItem {
                Label(disciplinesViewTitle, systemImage: "star")
            }

            NavigationView {
                CoursesView()
                    .navigationBarTitle(coursesViewTitle)
            }
            .navigationViewStyle(navigationStyle)
            .tabItem {
                Label(coursesViewTitle, systemImage: "star")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
