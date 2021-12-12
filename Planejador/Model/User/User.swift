//
//  User.swift
//  Planejador
//
//  Created by Erick Manaroulas Felipe on 12/12/21.
//

import Foundation

class User: Codable {

    // MARK: - Properties

    private var id = UUID()
    var name: String?
    private var profilePicture: String = "none"
    private var creationDate = Date()
    private var activity = UserActivity()

    // MARK: - Discipline Delegation Methods

    func seeDiscipline(_ discipline: Discipline) {
        self.activity.seeDiscipline(discipline)
    }

    func toggleSaveDiscipline(_ discipline: Discipline) {
        self.activity.toggleSaveDiscipline(discipline)
    }

    func fetchDisciplineHistory() -> [String] {
        return activity.fetchDisciplineHistory()
    }

    func fetchSavedDisciplines() -> [String] {
        return activity.fetchSavedDisciplines()
    }

    func fetchIfDisciplineIsSaved(_ discipline: Discipline) -> Bool {
        return self.activity.fetchIfDisciplineIsSaved(discipline)
    }
}

