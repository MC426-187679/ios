//
//  UserTracker.swift
//  Planejador
//
//  Created by Erick Manaroulas Felipe on 12/12/21.
//

import Foundation

/// Is the main interface for interacting with the User
/// Singleton class: use `UserTracker.shared` attribute.
class UserTracker {

    // MARK: - Static attributes and Methods for Data Persistence

    static private let documentsDirectory: URL? = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first

    static private func getFolderDataPath(_ folderName: String) -> URL {
        let folderDataPath = UserTracker.documentsDirectory!.appendingPathComponent(folderName)
        if !FileManager.default.fileExists(atPath: folderDataPath.path) {
            do {
                try FileManager.default.createDirectory(atPath: folderDataPath.path, withIntermediateDirectories: true, attributes: nil)
            } catch {
                print("Unable to create new directory to Disk: \(error.localizedDescription)")
            }
        }
        return folderDataPath
    }

    // MARK: - Properties for Data Persistence

    private let dataPlistFilePath = documentsDirectory?.appendingPathComponent("User.plist")

    private var user: User?

    // MARK: - Initializers

    /// Singleton instance.
    static var shared: UserTracker = {
        let instance = UserTracker()
        instance.loadUser()
        return instance
    }()

    // MARK: - Methods for Logging User Discipline

    func logSeenDiscipline(_ discipline: Discipline) {
        user?.seeDiscipline(discipline)
        print("Logging seen discipline: \(discipline.name) on data path \(String(describing: dataPlistFilePath))")
        saveUser()
    }

    func logToggleSavedDiscipline(_ discipline: Discipline) {
        user?.toggleSaveDiscipline(discipline)
        print("Logging saved discipline: \(discipline.name) on data path \(String(describing: dataPlistFilePath))")
        saveUser()
    }

    // MARK: - Methods for Reading User Discipline

    func fetchDisciplineHistory() -> [String] {
        return user?.fetchDisciplineHistory() ?? [String]()
    }

    func fetchSavedDisciplines() -> [String] {
        return user?.fetchSavedDisciplines() ?? []
    }

    func fetchIfDisciplineIsSaved(_ discipline: Discipline) -> Bool {
        return user?.fetchIfDisciplineIsSaved(discipline) ?? false
    }

    // MARK: - Data Persistence Methods

    private func saveUser() {
        let encoder = PropertyListEncoder()
        do {
            let data = try encoder.encode(self.user)
            try data.write(to: self.dataPlistFilePath!)
        } catch {
            print("Error encoding User \n \(error)")
        }
    }

    private func loadUser() {
        if let data = try? Data(contentsOf: dataPlistFilePath!) {
            let decoder = PropertyListDecoder()
            do {
                self.user = try decoder.decode(User.self, from: data)
            } catch {
                print("Error decoding User \n \(error)")
            }
        } else {
            self.user = createUser()
        }
    }

    // MARK: - User Creation

    private func createUser() -> User {
        let user = User()
        saveUser()
        return user
    }

    // MARK: - Methods for Editing User Profile

    func wasUserCreated() -> Bool {
        return user?.name != nil
    }

    func getUserName() -> String {
        return user?.name ?? ""
    }

}
