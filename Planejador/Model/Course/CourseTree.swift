import Foundation

typealias DisciplineTree = [[String]]

enum CourseTree {
    case unique(DisciplineTree)
    case variants([Variant])
}
