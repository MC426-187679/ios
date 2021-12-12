//
//  Match.swift
//  Planejador
//
//  Created by Erick Manaroulas Felipe on 08/12/21.
//

import Foundation
import UIKit
import SwiftUI

enum ContentType: String, Codable {
    case discipline
    case course
}

protocol Matchable {
    var cleanCode: String { get }
    var name: String { get }
}

struct Match: Codable {
    let code: String
    let content: ContentType
    let name: String

    func lookupContent(completion: @escaping (Matchable?) -> Void) {
        switch content {
        case .discipline:
            Discipline.Factory.shared.discipline(code: code, completion: { disc in
                if let safeDisc = disc {
                    completion(safeDisc)
                }
            })
        case .course:
            Course.Factory.shared.allCourses { courses in
                if let course = courses.first(where: {$0.code == self.code}) {
                    completion(course)
                }
            }
        }
    }

}
