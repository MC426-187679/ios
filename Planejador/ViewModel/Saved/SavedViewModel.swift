//
//  SavedViewModel.swift
//  Planejador
//
//  Created by Erick Manaroulas Felipe on 12/12/21.
//

import SwiftUI

extension SavedDisciplinesView {
    final class ViewModel: ObservableObject {
        @Published var history: [Discipline]
        @Published var savedDisciplines: [Discipline]

        init() {
            self.history = []
            self.savedDisciplines = []
            updateData()
        }

        func updateData() {
            let historyCodes = UserTracker.shared.fetchDisciplineHistory()
            Discipline.Factory.shared.disciplines(codes: historyCodes) { discs in
                self.history = discs
            }


            let savedCodes = UserTracker.shared.fetchSavedDisciplines()
            Discipline.Factory.shared.disciplines(codes: savedCodes) { discs in
                self.savedDisciplines = discs
            }
        }
    }
}
