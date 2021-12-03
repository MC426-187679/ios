import SwiftUI

class ItemsViewModel<Content: Item>: ObservableObject {
    @Published var items = [Content]()

    init() {
        Content.allItems { self.items.append(contentsOf: $0) }
    }
}
