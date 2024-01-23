//
//  WishlistViewController.swift
//  iosApp
//
//  Created by Hmoo Myat Theingi on 22/01/2024.
//

import UIKit
import RealmSwift

class WishlistViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
  
    @IBOutlet var tableView: UITableView!
    var movies: Results<WishlistMovie>!
    private let refreshControl = UIRefreshControl()

    @IBAction func removeButton(_ sender: Any) {
        showDeleteAllAlert()
    }
    
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
//        movies = WishlistManager.shared.getWishlistMovies()
//        tableView.reloadData()
        fetchMovieData()
        tableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refreshMovieData(_:)), for: .valueChanged)
        

        // Do any additional setup after loading the view.
    }
    
    private func showDeleteAllAlert() {
            let alertController = UIAlertController(
                title: "Delete All Wishlist Movies",
                message: "Are you sure you want to delete all wishlist movies?",
                preferredStyle: .alert
            )

            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alertController.addAction(cancelAction)

            let deleteAction = UIAlertAction(title: "Delete All", style: .destructive) { [weak self] _ in
                self?.deleteAllWishlistMovies()
            }
            alertController.addAction(deleteAction)

            present(alertController, animated: true, completion: nil)
        }
    
    private func deleteAllWishlistMovies() {
            // Implement the logic to delete all wishlist movies
            let wishlistManager = WishlistManager.shared
            let allWishlistMovies = wishlistManager.getWishlistMovies()

            try! wishlistManager.realm.write {
                wishlistManager.realm.delete(allWishlistMovies)
            }

            // Reload table view after deletion
            fetchMovieData()
        }
    
    
    override func viewWillAppear(_ animated: Bool) {
        fetchMovieData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! WishlistTableViewCell

            let wishlistMovie = movies[indexPath.row]

            // Set movie image
            if let url = URL(string: "https://image.tmdb.org/t/p/w500\(wishlistMovie.posterPath)") {
                cell.movieImage.load(url: url)
            } else {
                cell.movieImage.image = UIImage(named: "appleLogo")
            }
        cell.movieTitle.text = wishlistMovie.title
        cell.movieOverview.text = wishlistMovie.overview

            return cell
    }
    @objc private func refreshMovieData(_ sender: Any) {
        // Fetch Weather Data
        fetchMovieData()
    }
    
    func fetchMovieData(){
        movies = WishlistManager.shared.getWishlistMovies()
               self.refreshControl.endRefreshing()
               tableView.reloadData()

               // Update UI based on the count of wishlist movies
               if movies.isEmpty {
                   // Show "No wishlist movies" message
                   let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: tableView.bounds.size.height))
                   messageLabel.text = "No wishlist movies"
                   messageLabel.textColor = .gray
                   messageLabel.textAlignment = .center
                   tableView.backgroundView = messageLabel
               } else {
                   // Remove the background view
                   tableView.backgroundView = nil
               }
    }
}

class WishlistTableViewCell:UITableViewCell{
    
    @IBOutlet var movieImage: UIImageView!
    
    @IBOutlet var movieTitle: UILabel!
    
    @IBOutlet var movieOverview: UILabel!
    
    
    
    
}
