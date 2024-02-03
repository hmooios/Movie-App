//
//  VideoViewController.swift
//  iosApp
//
//  Created by Hmoo Myat Theingi on 11/01/2024.
//

import UIKit
import PinterestLayout
import AVFoundation

class VideoViewController: UIViewController, UICollectionViewDataSource {
    var collectionView: UICollectionView!
    let fruitsArray = ["fruit1", "Rectangle307","Rectangle308","Rectangle313","Rectangle317","fruit2", "fruit3", "fruit4", "fruit5"]

    let profilesArray = [
    "user1","user2"
    ]

    //MARK: - Top View

    let topView:UIView={
        let view=UIView()
      //  view.backgroundColor = .green
        view.translatesAutoresizingMaskIntoConstraints=false
        return view
    }()
    
    let friendsView:UIView={
        let view=UIView()
     //   view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints=false
        return view
    }()
    
    let groupsView:UIView={
        let view=UIView()
      //  view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints=false
        return view
    }()
    let forYouView:UIView={
        let view=UIView()
      //  view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints=false
        return view
    }()
    
    
    let friendsLabel: UILabel = {
        let label = UILabel()
        label.text = "Friends"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let friendsUnderline: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 102/255.0, green: 55/255.0, blue: 245/255.0, alpha: 1.0)
        view.layer.cornerRadius = 2
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let groupsLabel: UILabel = {
        let label = UILabel()
        label.text = "Groups"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let groupsUnderline: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 102/255.0, green: 55/255.0, blue: 245/255.0, alpha: 1.0)
        view.layer.cornerRadius = 2
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let forYouLabel: UILabel = {
        let label = UILabel()
        label.text = "For You"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let forYouUnderline: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 102/255.0, green: 55/255.0, blue: 245/255.0, alpha: 1.0)
        view.layer.cornerRadius = 2
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: - Middle Collection View
    
    //MARK: - Bottom View
  
    
    //MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        let layout = PinterestLayout()
        layout.delegate = self
        layout.cellPadding = 5
        layout.numberOfColumns = 2
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topView.bottomAnchor,constant: 0),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        collectionView.dataSource = self
        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: "cell")
        

        
    }
    
    private func setupUI(){
        view.backgroundColor = .black
        
    //MARK: - Top View Constraint
        
        view.addSubview(topView)
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            topView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            topView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 50),
            topView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1)
        ])
        
        topView.addSubview(friendsView)
        topView.addSubview(groupsView)
        topView.addSubview(forYouView)

        NSLayoutConstraint.activate([
            // Constraints for friendsView
            friendsView.topAnchor.constraint(equalTo: topView.topAnchor, constant: 20),
            friendsView.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 10),
            friendsView.widthAnchor.constraint(equalTo: topView.widthAnchor, multiplier: 1.0/4.0),
            friendsView.heightAnchor.constraint(equalTo: topView.heightAnchor, multiplier: 1.0/2.0),

            groupsView.topAnchor.constraint(equalTo: topView.topAnchor, constant: 20),
            groupsView.leadingAnchor.constraint(equalTo: friendsView.trailingAnchor, constant: 20),
            groupsView.widthAnchor.constraint(equalTo: topView.widthAnchor, multiplier: 1.0/4.0),
            groupsView.heightAnchor.constraint(equalTo: topView.heightAnchor, multiplier: 1.0/2.0),

            forYouView.topAnchor.constraint(equalTo: topView.topAnchor, constant: 20),
            forYouView.leadingAnchor.constraint(equalTo: groupsView.trailingAnchor, constant: 20),
            
            forYouView.widthAnchor.constraint(equalTo: topView.widthAnchor, multiplier: 1.0/4.0),
            forYouView.heightAnchor.constraint(equalTo: topView.heightAnchor, multiplier: 1.0/2.0)
        ])
        
        friendsView.addSubview(friendsLabel)
        friendsView.addSubview(friendsUnderline)
        NSLayoutConstraint.activate([
            friendsLabel.topAnchor.constraint(equalTo: friendsView.topAnchor, constant: 10),
            friendsLabel.bottomAnchor.constraint(equalTo: friendsView.bottomAnchor, constant: -15),
            friendsLabel.leadingAnchor.constraint(equalTo: friendsView.leadingAnchor, constant: 25),
            friendsLabel.trailingAnchor.constraint(equalTo: friendsView.trailingAnchor, constant: 0),
            friendsLabel.widthAnchor.constraint(equalToConstant: 50),

            friendsUnderline.topAnchor.constraint(equalTo: friendsLabel.bottomAnchor, constant: 20),
            friendsUnderline.bottomAnchor.constraint(equalTo: friendsView.bottomAnchor, constant: -5),
            friendsUnderline.leadingAnchor.constraint(equalTo: friendsView.leadingAnchor, constant: 30),
            friendsUnderline.trailingAnchor.constraint(equalTo: friendsView.trailingAnchor, constant: 20),
            friendsUnderline.widthAnchor.constraint(equalTo: friendsView.widthAnchor, multiplier: 1.0/2.0),
            friendsUnderline.heightAnchor.constraint(equalToConstant: 4)
            ])
        
        groupsView.addSubview(groupsLabel)
    //    groupsView.addSubview(groupsUnderline)
        NSLayoutConstraint.activate([
            groupsLabel.topAnchor.constraint(equalTo: groupsView.topAnchor, constant: 10),
            groupsLabel.bottomAnchor.constraint(equalTo: groupsView.bottomAnchor, constant: -15),
            groupsLabel.leadingAnchor.constraint(equalTo: groupsView.leadingAnchor, constant: 25),
            groupsLabel.trailingAnchor.constraint(equalTo: groupsView.trailingAnchor, constant: 0),
            groupsLabel.widthAnchor.constraint(equalToConstant: 50),

//            groupsUnderline.topAnchor.constraint(equalTo: groupsLabel.bottomAnchor, constant: 20),
//            groupsUnderline.bottomAnchor.constraint(equalTo: groupsView.bottomAnchor, constant: -5),
//            groupsUnderline.leadingAnchor.constraint(equalTo: groupsView.leadingAnchor, constant: 30),
//            groupsUnderline.trailingAnchor.constraint(equalTo: groupsView.trailingAnchor, constant: 20),
//            groupsUnderline.widthAnchor.constraint(equalTo: groupsView.widthAnchor, multiplier: 1.0/2.0),
//            groupsUnderline.heightAnchor.constraint(equalToConstant: 4)
            ])
        
        forYouView.addSubview(forYouLabel)
       // forYouView.addSubview(forYouUnderline)
        NSLayoutConstraint.activate([
            forYouLabel.topAnchor.constraint(equalTo: forYouView.topAnchor, constant: 10),
            forYouLabel.bottomAnchor.constraint(equalTo: forYouView.bottomAnchor, constant: -15),
            forYouLabel.leadingAnchor.constraint(equalTo: forYouView.leadingAnchor, constant: 25),
            forYouLabel.trailingAnchor.constraint(equalTo: forYouView.trailingAnchor, constant: 0),
            forYouLabel.widthAnchor.constraint(equalToConstant: 50),

//            forYouUnderline.topAnchor.constraint(equalTo: forYouLabel.bottomAnchor, constant: 20),
//            forYouUnderline.bottomAnchor.constraint(equalTo: forYouView.bottomAnchor, constant: -5),
//            forYouUnderline.leadingAnchor.constraint(equalTo: forYouView.leadingAnchor, constant: 30),
//            forYouUnderline.trailingAnchor.constraint(equalTo: forYouView.trailingAnchor, constant: 20),
//            forYouUnderline.widthAnchor.constraint(equalTo: forYouView.widthAnchor, multiplier: 1.0/2.0),
//            forYouUnderline.heightAnchor.constraint(equalToConstant: 4)
        
        ])

    }
 
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fruitsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCell
        cell.fruitImageView.image = UIImage(named: fruitsArray[indexPath.item])
        return cell
    }
    

}

class CustomCell: UICollectionViewCell {
    
    let profilesArray = [
        "user1"
    ]
    let fruitImageView = UIImageView()
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let usernameLabel: UILabel = {
        let label = UILabel()
        label.text = "Nina Greer"
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(fruitImageView)
           fruitImageView.translatesAutoresizingMaskIntoConstraints = false
           NSLayoutConstraint.activate([
               fruitImageView.topAnchor.constraint(equalTo: topAnchor),
               fruitImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
               fruitImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
               fruitImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
           ])
        
        addSubview(profileImageView)
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            profileImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            profileImageView.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -10),
            profileImageView.widthAnchor.constraint(equalToConstant: 40),
            profileImageView.heightAnchor.constraint(equalToConstant: 40),
        ])
        
        addSubview(usernameLabel)
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            usernameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 10),
            usernameLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            usernameLabel.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -20),
        ])
        
        // Set corner radius for the profile image view to make it round
        profileImageView.layer.cornerRadius = 20
        profileImageView.image = UIImage(named: profilesArray[0])

      
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

public extension UIImage {
    /**
     Calculates the best height of the image for available width.
     */
    public func height(forWidth width: CGFloat) -> CGFloat {
        let boundingRect = CGRect(
            x: 0,
            y: 0,
            width: width,
            height: CGFloat(MAXFLOAT)
        )
        let rect = AVMakeRect(
            aspectRatio: size,
            insideRect: boundingRect
        )
        return rect.size.height
    }
}
//MARK: - extension ViewController
extension VideoViewController:PinterestLayoutDelegate{

    
       func collectionView(collectionView: UICollectionView,
                           heightForImageAtIndexPath indexPath: IndexPath,
                           withWidth: CGFloat) -> CGFloat {
           let image = UIImage(named: fruitsArray[indexPath.item])
           
           return image?.height(forWidth: withWidth) ?? 0.0
       }
       
       func collectionView(collectionView: UICollectionView,
                           heightForAnnotationAtIndexPath indexPath: IndexPath,
                           withWidth: CGFloat) -> CGFloat {
           return 0
       }
    
    
}
