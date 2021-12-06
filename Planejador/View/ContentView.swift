import SwiftUI

struct ContentView: View {
    private let disciplinesViewTitle = "Disciplinas"
    private let coursesViewTitle = "Cursos"
    private let navigationStyle = StackNavigationViewStyle()

    var body: some View {
        TabView {
            NavigationView {
                AllDisciplinesView()
                    .navigationTitle(disciplinesViewTitle)
            }
            .navigationViewStyle(navigationStyle)
            .tabItem {
                Label(disciplinesViewTitle, systemImage: "book")
            }

            NavigationView {
                CoursesView()
                    .navigationTitle(coursesViewTitle)
            }
            .navigationViewStyle(navigationStyle)
            .tabItem {
                Label(coursesViewTitle, systemImage: "books.vertical")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
