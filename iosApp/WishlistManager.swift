//
//  WishlistManager.swift
//  iosApp
//
//  Created by Hmoo Myat Theingi on 18/01/2024.
//

import RealmSwift

class WishlistManager {
    
    static let shared = WishlistManager()
     let realm = try! Realm()
    
    //MARK: - Add Wishlist Movie to Realm
    
    func addMovieToWishlist(id:Int,title: String, overview: String, posterPath:String){
        let newMovie = WishlistMovie(id: id, title: title, overview: overview, posterPath: posterPath)
        try! realm.write {
            realm.add(newMovie,update: .modified)
        }
        print("Added to wishlist \(newMovie.id)")
    }
    
    //MARK: - Remove Wishlist Movie from Realm

    func removeItemFromWishlist(movie: WishlistMovie) {
        if !movie.isInvalidated  {
            try! realm.write {
                realm.delete(movie)
            }
        }
    }

    //MARK: - Retrieve all movies in the realm

    func getWishlistMovies() -> Results<WishlistMovie> {
        let wishlistMovies = realm.objects(WishlistMovie.self)
        return wishlistMovies
    }
    
    //MARK: - Check movie is whether in the wishlist or not
    func isMovieInWishlist(movie: Movie) -> Bool {
        return realm.objects(WishlistMovie.self).filter("id == %@", movie.id ?? 0).first?.isInvalidated == false
    }
    
    //MARK: - Remove Wishlist Movie from Realm after checking isMovieInWishlist

    func toggleWishlistStatus(for movie: Movie) {
           if isMovieInWishlist(movie: movie) {
               // Movie is in the wishlist, remove it
               if let wishlistMovie = realm.objects(WishlistMovie.self).filter("id == %@", movie.id ?? 0).first {
                   if !wishlistMovie.isInvalidated  {
                       try! realm.write {
                           realm.delete(wishlistMovie)
                       }
                   }
//                   removeItemFromWishlist(movie: wishlistMovie)
//                   print("Removed from wishlist \(wishlistMovie.id)")
               }
           } else {
               // Movie is not in the wishlist, add it
               addMovieToWishlist(id: movie.id ?? 0, title: movie.title ?? "", overview: movie.overview ?? "", posterPath: movie.posterPath ?? "")
           }
       }
  //MARK: - Change wishlist button from heart to heart.filled
    
    func updateWishlistButton(button: UIButton, for movie: Movie) {
        let isMovieInWishlist = isMovieInWishlist(movie: movie)

           if isMovieInWishlist{
               // Movie is in the wishlist
               button.setImage(UIImage(systemName: "heart.fill"), for: .normal)
               print("button heart.fill")
           } else {
               // Movie is not in the wishlist
               button.setImage(UIImage(systemName: "heart"), for: .normal)
               print("button heart")

           }
       }

}
 
