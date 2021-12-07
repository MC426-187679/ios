import Foundation

enum Search {
    private static let route = "busca"
    private static let limit = 30

    static func search(query: String) {
        let searchRoute = AppAPI.route.appendingPathComponent(route)
        let queryItems = [URLQueryItem(name: "query", value: query)]
        API.call(url: searchRoute, queryItems: queryItems) { result in
            switch result {
            case .success(let data):
                print(String(decoding: data, as: UTF8.self))
            case .failure(let error):
                print(error)
            }
        }
    }
}
