//
//  UserActivity.swift
//  Planejador
//
//  Created by Erick Manaroulas Felipe on 12/12/21.
//

import Foundation

class UserActivity: Codable {

    // MARK: - Properties

    private var savedDisciplines = [String]()
    private var disciplineHistory = [String]()

    // MARK: - Setters

    /// Add activity to the history.
    func seeDiscipline(_ discipline: Discipline) {
        if let index = disciplineHistory.firstIndex(where: { $0 == discipline.code }) {
            disciplineHistory.remove(at: index)
        }

        disciplineHistory.append(discipline.code)
    }

    /// Look for activity in saved. Remove if present and add otherwise.
    func toggleSaveDiscipline(_ discipline: Discipline) {
        if let index = savedDisciplines.firstIndex(where: { $0 == discipline.code }) {
            savedDisciplines.remove(at: index)
            return
        }

        savedDisciplines.append(discipline.code)
    }

    // MARK: - Getters

    func fetchDisciplineHistory() -> [String] {
        return disciplineHistory.reversed()
    }

    func fetchSavedDisciplines() -> [String] {
        return savedDisciplines.reversed()
    }

    func fetchIfDisciplineIsSaved(_ discipline: Discipline) -> Bool {
        if savedDisciplines.firstIndex(where: { $0 == discipline.code }) != nil {
            return true
        }

        return false
    }
}

