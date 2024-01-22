//
//  MovieViewController.swift
//  iosApp
//
//  Created by Hmoo Myat Theingi on 14/01/2024.
//

import RealmSwift
import UIKit

class MovieViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource,UITableViewDelegate,UITableViewDataSource {
    
    var currentTablePage = 1
    var wishlistTapped = false
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var tableView: UITableView!
    
    var movies: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchMovies()
    }
    
    func fetchMovies() {
        NetworkManager.shared.getMovies(page: currentTablePage) { result in
            switch result {
            case .success(let movieResponse):
                if let fetchedMovies = movieResponse.results {
                    self.movies.append(contentsOf: fetchedMovies)
                    print("Movie count",self.movies.count)
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                        self.collectionView.reloadData()
                    }
                }
                
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    //MARK: - CollectionView
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieCollectionCell", for: indexPath) as! MyCollectionViewCell
        
        cell.movieImage.image = nil
        
        let movie = movies[indexPath.item]
        WishlistManager.shared.updateWishlistButton(button: cell.wishlistButton, for: movie)

        cell.movie = movie  // Set the movie for the cell
        
        // Set movie image
        if let posterPath = movie.posterPath,
           let url = URL(string: "https://image.tmdb.org/t/p/w500\(posterPath)") {
            cell.movieImage.load(url: url)
        } else {
            cell.movieImage.image = UIImage(named: "appleLogo")
        }
        
        // Set movie title
        cell.movieLabel.text = movie.title
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Assuming you have a ViewController named "MovieDetailViewController"
        let movieDetailVC = storyboard?.instantiateViewController(withIdentifier: "MovieDetailViewController") as! MovieDetailViewController
        
        // Pass the selected movie to the MovieDetailViewController
        movieDetailVC.selectedMovie = movies[indexPath.item]
        
        // Push the MovieDetailViewController
        navigationController?.pushViewController(movieDetailVC, animated: true)
    }
    
    //MARK: - TableView
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieTableCell", for: indexPath) as! MyTableViewCell
        
        let movie = movies[indexPath.item]
        cell.movieImage.image = nil
        // Set movie image
        if let posterPath = movie.posterPath,
           let url = URL(string: "https://image.tmdb.org/t/p/w500\(posterPath)") {
            cell.movieImage.load(url: url)
        } else {
            cell.movieImage.image = UIImage(named: "appleLogo")
        }
        
        // Set movie title
        cell.movieTitle.text = movie.title
        cell.movieOverview.text = movie.overview
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        // Check if the last cell is being displayed
        if indexPath.row == movies.count - 1{
            // Load more data for the next page
            self.currentTablePage += 1
            //  isTableLoading = true
            fetchMovies()
        }
    }
    
}
extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self?.image = image
                }
            }
        }
    }
}
class MyCollectionViewCell:UICollectionViewCell{
    
    var movie: Movie?
    @IBOutlet var movieImage: UIImageView!
    @IBOutlet var movieLabel: UILabel!
    @IBOutlet var wishlistButton: UIButton!
    
    //MARK: - Button tapped function
    
    @IBAction func wishlistButtonTapped(_ sender: UIButton) {
        guard let movie = movie else {
              return
          }
          
          WishlistManager.shared.toggleWishlistStatus(for: movie)
          
          // Update the button appearance based on the wishlist status
          WishlistManager.shared.updateWishlistButton(button: wishlistButton, for: movie)
        print(WishlistManager.shared.getWishlistMovies())

    }
    
    
    
}

class MyTableViewCell:UITableViewCell{
    
    @IBOutlet var movieImage: UIImageView!
    @IBOutlet var movieTitle: UILabel!
    @IBOutlet var movieOverview: UILabel!
    
}

