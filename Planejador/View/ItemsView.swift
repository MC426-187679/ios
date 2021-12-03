import SwiftUI

struct ItemsView<Content: Item>: View {
    @ObservedObject private var viewModel = ItemsViewModel<Content>()

    var body: some View {
        Form {
            ForEach(viewModel.items[0...10], id: \.self.code) { item in
                NavigationLink(destination: {
                    Text("Item Page View")
                }, label: {
                    Text(item.name)
                })
            }
        }
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ItemsView<Discipline>()
    }
}
