import SwiftUI

struct ContentView: View {
    private let searchViewTitle = "Buscar"
    private let disciplinesViewTitle = "Disciplinas"
    private let coursesViewTitle = "Cursos"
    private let savedDisciplinesViewTitle = "Minhas Disciplinas"
    private let navigationStyle = StackNavigationViewStyle()

    var body: some View {
        TabView {
            NavigationView {
                SearchView()
                    .navigationTitle(searchViewTitle)
            }
            .navigationViewStyle(navigationStyle)
            .tabItem {
                Label(searchViewTitle, systemImage: "magnifyingglass")
            }

            NavigationView {
                AllDisciplinesView()
                    .navigationTitle(disciplinesViewTitle)
            }
            .navigationViewStyle(navigationStyle)
            .tabItem {
                Label(disciplinesViewTitle, systemImage: "book")
            }

            NavigationView {
                AllCoursesView()
                    .navigationTitle(coursesViewTitle)
            }
            .navigationViewStyle(navigationStyle)
            .tabItem {
                Label(coursesViewTitle, systemImage: "books.vertical")
            }
            NavigationView {
                SavedDisciplinesView()
                    .navigationTitle(savedDisciplinesViewTitle)
            }
            .navigationViewStyle(navigationStyle)
            .tabItem {
                Label(savedDisciplinesViewTitle, systemImage: "bookmark.fill")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
