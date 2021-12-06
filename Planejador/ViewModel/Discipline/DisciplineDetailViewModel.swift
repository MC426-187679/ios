import SwiftUI

class DisciplineDetailViewModel: ObservableObject {
    @Published var discipline: Discipline

    init(_ discipline: Discipline) {
        self.discipline = discipline
    }
}
