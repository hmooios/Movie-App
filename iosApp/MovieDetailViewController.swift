
import UIKit

class MovieDetailViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
  
    
    var selectedMovie: Movie?

    @IBOutlet var movieImageView: UIImageView!
    @IBOutlet var movieTitleLabel: UILabel!
    @IBOutlet var movieOverviewLabel: UILabel!
    @IBOutlet var movieOverviewHeight: NSLayoutConstraint!
    @IBOutlet var seeMoreButton: UIButton!
    private var isExpanded = false
    var movies: [Movie] = []

    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set up the UI with the selected movie data
        if let selectedMovie = selectedMovie,
           let posterPath = selectedMovie.posterPath,
           let url = URL(string: "https://image.tmdb.org/t/p/w500\(posterPath)") {
            // Load the actual image asynchronously
            movieImageView.load(url: url)
            movieTitleLabel.text = selectedMovie.title
            movieOverviewLabel.text = selectedMovie.overview

            // Set initial state based on the number of lines you want to show initially
            let numberOfLinesToShowInitially = 3
            updateOverviewLabel(isExpanded: isExpanded, numberOfLines: numberOfLinesToShowInitially)

            // Set up the seeMoreButton
            seeMoreButton.setTitle(isExpanded ? "See Less" : "See More", for: .normal)
            seeMoreButton.addTarget(self, action: #selector(seeMoreButtonTapped), for: .touchUpInside)
        } else {
            // Set a placeholder image if the poster path is nil or invalid
            movieImageView.image = UIImage(named: "appleLogo")
        }
        
        fetchMovies()
    }
    func fetchMovies() {

        // Fetch movies for the table view
        NetworkManager.shared.getMovies(page: 1) { result in
            switch result {
            case .success(let movieResponse):
                if let fetchedMovies = movieResponse.results {
                    // Append the new movies to the existing array
                    self.movies.append(contentsOf: fetchedMovies)
                    print("Movie count",self.movies.count)
                 //   self.isTableLoading = false

                    DispatchQueue.main.async {
                        self.collectionView.reloadData()

                    }
                }

            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MovieCell
        cell.movieImage.image = nil

        let movie = movies[indexPath.item]

        // Set movie image
        if let posterPath = movie.posterPath,
           let url = URL(string: "https://image.tmdb.org/t/p/w500\(posterPath)") {
            cell.movieImage.load(url: url) // Assuming you have an extension to load images from URL
        } else {
            // Set a placeholder image if the poster path is nil or invalid
            cell.movieImage.image = UIImage(named: "appleLogo")
        }


        return cell
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize
 {

     return CGSizeMake((self.view.frame.size.width/4), 190)
 }
    
   


    @objc private func seeMoreButtonTapped() {
        isExpanded.toggle()

        UIView.animate(withDuration: 0.3) { [weak self] in
            guard let self = self else { return }

            // Set the number of lines based on the current state
            let numberOfLinesToShow = self.isExpanded ? movieOverviewLabel.maxNumberOfLines : 3
            self.updateOverviewLabel(isExpanded: self.isExpanded, numberOfLines: numberOfLinesToShow)

            // Update the height constraint to reflect the new height
            self.movieOverviewHeight.constant = self.calculateLabelHeight(numberOfLines: numberOfLinesToShow)
            self.movieTitleLabel.text = selectedMovie?.title
            self.view.layoutIfNeeded()

            // Update the button title based on the current state
            self.seeMoreButton.setTitle(self.isExpanded ? "See Less" : "See More", for: .normal)
        }
    }

    private func calculateLabelHeight(numberOfLines: Int) -> CGFloat {
        let lineHeight: CGFloat = 20.0 // Adjust this based on your label font and size
        return CGFloat(numberOfLines) * lineHeight
    }

    private func updateOverviewLabel(isExpanded: Bool, numberOfLines: Int) {
        movieOverviewLabel.numberOfLines = numberOfLines
        movieOverviewLabel.sizeToFit()
    }
}

extension UILabel {
    var maxNumberOfLines: Int {
        let maxSize = CGSize(width: frame.size.width, height: CGFloat(MAXFLOAT))
        let text = (self.text ?? "") as NSString
        let textHeight = text.boundingRect(with: maxSize, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil).height
        let lineHeight = font.lineHeight
        return Int(ceil(textHeight / lineHeight))
    }
}

class MovieCell:UICollectionViewCell{

    @IBOutlet var movieImage: UIImageView!
    
    
}



