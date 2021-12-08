import Foundation

enum Search {
    private static let route = "busca"
    private static let limit = 30

    static func search(query: String, completion: @escaping ([Match]?) -> Void) {
        let searchRoute = AppAPI.route.appendingPathComponent(route)
        let queryItems = [URLQueryItem(name: "query", value: query), URLQueryItem(name: "limit", value: String(limit))]
        API.call(url: searchRoute, queryItems: queryItems) { result in
            switch result {
            case .success(let data):
                let decoder = JSONDecoder()
                do {
                    let matches: [Match] = try decoder.decode([Match].self, from: data)
                    completion(matches)
                } catch {
                    print(error)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
