import Foundation

protocol Item {
    var code: String { get }
    var name: String { get }
    static func allItems(completion: @escaping ([Self]) -> Void)
}
