import Alamofire
import ObjectMapper

class NetworkManager {
    static let shared = NetworkManager()

    private init() {}

    func getMovies(page: Int, completion: @escaping (Result<MovieResponse, Error>) -> Void) {
        let url = Constant.movieURL // Replace with your actual API endpoint

        // Add the "page" parameter to the request
        let parameters: [String: Any] = ["page": page]

        AF.request(url, parameters: parameters).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                if let json = value as? [String: Any], let movieResponse = Mapper<MovieResponse>().map(JSON: json) {
                    completion(.success(movieResponse))
                } else {
                    completion(.failure(NSError(domain: "Mapping error", code: 0, userInfo: nil)))
                }

            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
