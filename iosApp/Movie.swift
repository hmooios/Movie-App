import Foundation
import ObjectMapper

struct MovieResponse: Mappable {
    var results: [Movie]?

    init?(map: Map) {}

    mutating func mapping(map: Map) {
        results <- map["results"]
    }
}

struct Movie: Mappable {
    var id: Int?
    var title: String?
    var overview: String?
    var posterPath: String?

    init?(map: Map) {}

    mutating func mapping(map: Map) {
        id <- map["id"]
        title <- map["title"]
        overview <- map["overview"]
        posterPath <- map["poster_path"]
    }
}

