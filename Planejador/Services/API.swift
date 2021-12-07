import Foundation

enum API {
    static func call(url: URL, completion: @escaping (Result<Data, Error>) -> Void) {
        call(url: url, queryItems: [], completion: completion)
    }

    static func call(url: URL, queryItems: [URLQueryItem], completion: @escaping (Result<Data, Error>) -> Void) {
        do {
            let request = try createRequest(url: url, queryItems: queryItems)
            sendRequest(request, completion: completion)
        } catch {
            completion(.failure(error))
            return
        }
    }

    private static func sendRequest(_ request: URLRequest, completion: @escaping (Result<Data, Error>) -> Void) {
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            do {
                let data = try handleResponse(data: data, response: response, error: error)
                completion(.success(data))
            } catch {
                completion(.failure(error))
            }
        }

        task.resume()
    }

    private static func handleResponse(data: Data?, response: URLResponse?, error: Error?) throws -> Data {
        guard error == nil else {
            throw error!
        }

        guard let data = data else {
            throw APIError.emptyData
        }

        return data
    }

    private static func createRequest(url: URL, queryItems: [URLQueryItem]) throws -> URLRequest {
        guard var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
            throw APIError.invalidURL
        }

        urlComponents.queryItems = queryItems
        guard let url = urlComponents.url else {
            throw APIError.invalidQueryItems
        }

        return URLRequest(url: url)
    }
}

enum APIError: Error {
    case invalidURL
    case invalidQueryItems
    case emptyData
}
