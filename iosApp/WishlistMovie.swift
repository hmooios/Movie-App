//
//  WishlistMovie.swift
//  realmTest
//
//  Created by Hmoo Myat Theingi on 19/01/2024.
//

import Foundation
import RealmSwift

class WishlistMovie: Object {
    @Persisted(primaryKey: true) var id: Int
    @Persisted var title: String
    @Persisted var overview: String
    @Persisted var posterPath: String


    convenience init(id: Int, title: String, overview: String, posterPath: String) {
        self.init()
        self.id = id
        self.title = title
        self.overview = overview
        self.posterPath = posterPath
    }
}


