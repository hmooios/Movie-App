//
//  ProfileViewController.swift
//  iosApp
//
//  Created by Hmoo Myat Theingi on 02/02/2024.
//

import UIKit
import GoogleSignIn

class ProfileViewController: UIViewController {
    
      var emailText: String?
      var usernameText: String?
      var profileImageUrl: URL?
    
    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var username: UILabel!
    
    @IBOutlet var email: UILabel!
    
    @IBAction func signoutButtonTapped(_ sender: UIButton) {
        GIDSignIn.sharedInstance.signOut()
        UserDefaults.standard.removeObject(forKey: "userAuthToken")

                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let VC = storyboard.instantiateViewController(withIdentifier: "signup") as! SignUpViewController
                    VC.modalPresentationStyle = .fullScreen
                //    UserStandards.isLogin = true
                    self.present(VC, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Retrieve user information from UserDefaults
              let defaults = UserDefaults.standard
              emailText = defaults.string(forKey: "userEmail")
              usernameText = defaults.string(forKey: "userFullName")
              let profileImageUrlString = defaults.string(forKey: "userProfilePicUrl")
              if let imageUrlString = profileImageUrlString, let imageUrl = URL(string: imageUrlString) {
                  profileImageUrl = imageUrl
              }

              // Update the UI with retrieved user information
              email.text = emailText
              username.text = usernameText
        if let imageUrl = profileImageUrl {
            // Load the profile image asynchronously (you may want to use a library like SDWebImage)
            // Here, we're using a simple example to load an image from a URL
            DispatchQueue.global().async {
                if let imageData = try? Data(contentsOf: imageUrl) {
                    DispatchQueue.main.async {
                        self.profileImage.image = UIImage(data: imageData)
                    }
                }
            }
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        
    }


}
