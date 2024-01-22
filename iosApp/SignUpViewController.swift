//
//  ViewController.swift
//  SignUpViewControllerTest
//
//  Created by Hmoo Myat Theingi on 16/01/2024.
//

import UIKit

class SignUpViewController: UIViewController {

    // MARK: - UI Elements
    private var isPhoneSignInMode = true
    private var showPhoneUnderline = true
    private var showEmailUnderline = false
    
    
    let topBlackBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let bottomLightDarkBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 47/255.0, green: 45/255.0, blue: 53/255.0, alpha: 1.0)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let lightDarkBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 47/255.0, green: 45/255.0, blue: 53/255.0, alpha: 1.0) // Light dark color hex code
        view.layer.cornerRadius = 60 // Set your desired corner radius value
        view.layer.maskedCorners = [.layerMaxXMaxYCorner]
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let blackBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.layer.cornerRadius = 60 // Set your desired corner radius value
        view.layer.maskedCorners = [.layerMinXMinYCorner]
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()


    let signInLabel: UILabel = {
        let label = UILabel()
        label.text = "Sign In"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let accountInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "Don't have an account? "
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign Up", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(UIColor(red: 102/255.0, green: 55/255.0, blue: 245/255.0, alpha: 1.0)
, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //Phone View
    let phoneView:UIView={
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let phoneLabel: UILabel = {
        let label = UILabel()
        label.text = "Phone"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let phoneUnderline: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 102/255.0, green: 55/255.0, blue: 245/255.0, alpha: 1.0)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    //Email View
    let emailView:UIView={
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "Email/User ID"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let emailUnderline: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 102/255.0, green: 55/255.0, blue: 245/255.0, alpha: 1.0)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    
    // simple Text Field
    
    let userTextField: UITextField = {
    let textField = UITextField()
    textField.backgroundColor = UIColor(red: 47/255.0, green: 45/255.0, blue: 53/255.0, alpha: 1.0)
    textField.placeholder = "Phone Number"
    textField.font = UIFont.systemFont(ofSize: 16)
    textField.textColor = .white
    
    // Set the cornerRadius to make it capsule-shaped
    textField.layer.cornerRadius = 30 // Adjust this value as needed
    textField.clipsToBounds = true // Required to round the corners

   
    // Add left padding
    let leftPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: textField.frame.height))
    textField.leftView = leftPaddingView
    textField.leftViewMode = .always

    textField.translatesAutoresizingMaskIntoConstraints = false
    return textField
    }()

    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor(red: 47/255.0, green: 45/255.0, blue: 53/255.0, alpha: 1.0)
        textField.placeholder = "Password"
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.textColor = .white
        
        // Set the cornerRadius to make it capsule-shaped
        textField.layer.cornerRadius = 30 // Adjust this value as needed
        textField.clipsToBounds = true // Required to round the corners

       
        // Add left padding
        let leftPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: textField.frame.height))
        textField.leftView = leftPaddingView
        textField.leftViewMode = .always

        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    
    let forgotPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Forget your password?", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
  
    
    let leftLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 47/255.0, green: 45/255.0, blue: 53/255.0, alpha: 1.0)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let rightLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 47/255.0, green: 45/255.0, blue: 53/255.0, alpha: 1.0)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let signInButton: GradientButton = {
        let gradientButton = GradientButton(type: .system)
        gradientButton.backgroundColor = .systemBlue
        gradientButton.setTitle("Sign In", for: .normal)
        gradientButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        gradientButton.setTitleColor(.white, for: .normal) // Set text color to white or another contrasting color
        gradientButton.layer.cornerRadius = 30 // Add corner radius for a rounded appearance
        gradientButton.translatesAutoresizingMaskIntoConstraints = false
        return gradientButton
    }()
    
    let signInWithLabel: UILabel = {
        let label = UILabel()
        label.text = "Or sign In with"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let underlineView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBlue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let googleSignInButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.layer.cornerRadius = 25
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let appleSignInButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.layer.cornerRadius = 25
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    


    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupGestures()
        updateUnderlines()
        updateFadeLabel()
    }
    
    
    private func setupGestures() {
           let emailLabelTapGesture = UITapGestureRecognizer(target: self, action: #selector(emailLabelTapped))
           emailLabel.isUserInteractionEnabled = true
           emailLabel.addGestureRecognizer(emailLabelTapGesture)

           let phoneLabelTapGesture = UITapGestureRecognizer(target: self, action: #selector(phoneLabelTapped))
           phoneLabel.isUserInteractionEnabled = true
           phoneLabel.addGestureRecognizer(phoneLabelTapGesture)
       }
    
    // Function to handle tap on phone label
       @objc private func phoneLabelTapped() {
           isPhoneSignInMode = true
           showPhoneUnderline = true
           showEmailUnderline = false
           updateUI()
       }

       // Function to handle tap on email label
       @objc private func emailLabelTapped() {
           isPhoneSignInMode = false
           showPhoneUnderline = false
           showEmailUnderline = true
           updateUI()
       }
    private func updateUI() {
            updatePlaceholders()
            updateUnderlines()
            updateFadeLabel()
        }

        private func updatePlaceholders() {
            if isPhoneSignInMode {
                userTextField.placeholder = "Phone Number"
            } else {
                userTextField.placeholder = "Enter Email"
            }
        }

        private func updateUnderlines() {
            phoneUnderline.isHidden = !showPhoneUnderline
            emailUnderline.isHidden = !showEmailUnderline
        }
    
    private func updateFadeLabel() {
        UIView.animate(withDuration: 0.3) {
            if self.isPhoneSignInMode {
                self.phoneLabel.alpha = 1.0
                self.emailLabel.alpha = 0.7
            } else {
                self.phoneLabel.alpha = 0.5
                self.emailLabel.alpha = 1.0
            }
        }
    }


    @objc func signupPressed(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let VC = storyboard.instantiateViewController(withIdentifier: "tabbar") as! tabbarViewController
        VC.modalPresentationStyle = .fullScreen
    //    UserStandards.isLogin = true
        self.present(VC, animated: true)
        
        
    }
    // MARK: - UI Setup
    
    

    private func setupUI() {
        view.backgroundColor = .black
        
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
        ])
        
        
        // Add light dark background view to one third of the screen
        contentView.addSubview(topBlackBackgroundView)
        contentView.addSubview(lightDarkBackgroundView)
        NSLayoutConstraint.activate([
            topBlackBackgroundView.topAnchor.constraint(equalTo: contentView.topAnchor),
            topBlackBackgroundView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            topBlackBackgroundView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            topBlackBackgroundView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 1/3),
            lightDarkBackgroundView.topAnchor.constraint(equalTo: contentView.topAnchor),
            lightDarkBackgroundView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            lightDarkBackgroundView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            lightDarkBackgroundView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 1/3)
        ])
        
        // Add black background view to cover the remaining two-thirds of the screen
        contentView.addSubview(bottomLightDarkBackgroundView)
        contentView.addSubview(blackBackgroundView)
        NSLayoutConstraint.activate([
            bottomLightDarkBackgroundView.topAnchor.constraint(equalTo: lightDarkBackgroundView.bottomAnchor),
            bottomLightDarkBackgroundView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            bottomLightDarkBackgroundView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            bottomLightDarkBackgroundView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            blackBackgroundView.topAnchor.constraint(equalTo: lightDarkBackgroundView.bottomAnchor),
            blackBackgroundView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            blackBackgroundView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            blackBackgroundView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        // Add sign-in label to the light dark background view
        lightDarkBackgroundView.addSubview(signInLabel)
        NSLayoutConstraint.activate([
            signInLabel.topAnchor.constraint(equalTo: lightDarkBackgroundView.bottomAnchor, constant: -80),
            signInLabel.leadingAnchor.constraint(equalTo: lightDarkBackgroundView.leadingAnchor, constant: 20)
        ])
        
        // Add account info label and sign-up button below the sign-in label
        lightDarkBackgroundView.addSubview(accountInfoLabel)
        lightDarkBackgroundView.addSubview(signUpButton)
        NSLayoutConstraint.activate([
            accountInfoLabel.bottomAnchor.constraint(equalTo: lightDarkBackgroundView.bottomAnchor, constant: -20),
            accountInfoLabel.leadingAnchor.constraint(equalTo: lightDarkBackgroundView.leadingAnchor, constant: 20),
            
            signUpButton.centerYAnchor.constraint(equalTo: accountInfoLabel.centerYAnchor),
            signUpButton.leadingAnchor.constraint(equalTo: accountInfoLabel.trailingAnchor, constant: 8)
        ])
        
        signUpButton.addTarget(self, action: #selector(signupPressed), for: .touchUpInside)
        
        blackBackgroundView.addSubview(phoneView)
        blackBackgroundView.addSubview(emailView)
        NSLayoutConstraint.activate([
            phoneView.topAnchor.constraint(equalTo: blackBackgroundView.topAnchor, constant: 20),
            phoneView.leadingAnchor.constraint(equalTo: blackBackgroundView.leadingAnchor, constant: 20),
            phoneView.trailingAnchor.constraint(equalTo: blackBackgroundView.trailingAnchor, constant: -200),
            phoneView.heightAnchor.constraint(equalToConstant: 50),
            phoneView.widthAnchor.constraint(equalToConstant: 170),
            
            emailView.topAnchor.constraint(equalTo: blackBackgroundView.topAnchor, constant: 20),
            emailView.leadingAnchor.constraint(equalTo: phoneView.trailingAnchor, constant: 20),
            emailView.heightAnchor.constraint(equalToConstant: 50),
            emailView.widthAnchor.constraint(equalToConstant: 170)
        ])
        
        
        phoneView.addSubview(phoneLabel)
        phoneView.addSubview(phoneUnderline)
        NSLayoutConstraint.activate([
            phoneLabel.topAnchor.constraint(equalTo: phoneView.topAnchor, constant: 10),
            phoneLabel.bottomAnchor.constraint(equalTo: phoneView.bottomAnchor, constant: -15),
            phoneLabel.leadingAnchor.constraint(equalTo: phoneView.leadingAnchor, constant: 50),
            phoneLabel.trailingAnchor.constraint(equalTo: phoneView.trailingAnchor, constant: 0),
            phoneLabel.widthAnchor.constraint(equalToConstant: 50),
            
            //   phoneUnderline.topAnchor.constraint(equalTo: phoneLabel.bottomAnchor, constant: 20),
            phoneUnderline.bottomAnchor.constraint(equalTo: phoneView.bottomAnchor, constant: -10),
            phoneUnderline.widthAnchor.constraint(equalTo: phoneView.widthAnchor),
            phoneUnderline.heightAnchor.constraint(equalToConstant: 4)
            
        ])
        emailView.addSubview(emailLabel)
        emailView.addSubview(emailUnderline)
        NSLayoutConstraint.activate([
            emailLabel.topAnchor.constraint(equalTo: emailView.topAnchor, constant: 10),
            emailLabel.bottomAnchor.constraint(equalTo: emailView.bottomAnchor, constant: -15),
            emailLabel.leadingAnchor.constraint(equalTo: emailView.leadingAnchor, constant: 25),
            emailLabel.trailingAnchor.constraint(equalTo: emailView.trailingAnchor, constant: 0),
            emailLabel.widthAnchor.constraint(equalToConstant: 50),
            
            //   phoneUnderline.topAnchor.constraint(equalTo: phoneLabel.bottomAnchor, constant: 20),
            emailUnderline.bottomAnchor.constraint(equalTo: phoneView.bottomAnchor, constant: -10),
            emailUnderline.widthAnchor.constraint(equalTo: phoneView.widthAnchor),
            emailUnderline.heightAnchor.constraint(equalToConstant: 4)
            
        ])
        
        
        blackBackgroundView.addSubview(userTextField)
        NSLayoutConstraint.activate([
            userTextField.topAnchor.constraint(equalTo: phoneView.bottomAnchor, constant: 30),
            userTextField.leadingAnchor.constraint(equalTo: blackBackgroundView.leadingAnchor, constant: 20),
            userTextField.trailingAnchor.constraint(equalTo: blackBackgroundView.trailingAnchor, constant: -20),
            userTextField.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        blackBackgroundView.addSubview(passwordTextField)
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: userTextField.bottomAnchor, constant: 20),
            passwordTextField.leadingAnchor.constraint(equalTo: blackBackgroundView.leadingAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: blackBackgroundView.trailingAnchor, constant: -20),
            passwordTextField.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        
        
        
        
        
        blackBackgroundView.addSubview(forgotPasswordButton)
        NSLayoutConstraint.activate([
            
            forgotPasswordButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 0),
            
            
            forgotPasswordButton.trailingAnchor.constraint(equalTo: blackBackgroundView.trailingAnchor, constant: -20)
        ])
        
        
        forgotPasswordButton.addTarget(self, action: #selector(forgotPasswordButtonTapped), for: .touchUpInside)
        
        // Add signInButton to blackBackgroundView
        blackBackgroundView.addSubview(signInButton)
        
        
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 40),
            signInButton.leadingAnchor.constraint(equalTo: blackBackgroundView.leadingAnchor, constant: 20),
            signInButton.trailingAnchor.constraint(equalTo: blackBackgroundView.trailingAnchor, constant: -20),
            signInButton.heightAnchor.constraint(equalToConstant: 60)
        ])
        signInButton.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
        
        blackBackgroundView.addSubview(signInWithLabel)
        NSLayoutConstraint.activate([
            signInWithLabel.topAnchor.constraint(equalTo: signInButton.topAnchor, constant: 100),
            //    signInWithLabel.bottomAnchor.constraint(equalTo: signInButton.topAnchor, constant: -10),
            signInWithLabel.leadingAnchor.constraint(equalTo: blackBackgroundView.leadingAnchor, constant: 150)
        ])
        
        blackBackgroundView.addSubview(leftLineView)
        NSLayoutConstraint.activate([
            leftLineView.centerYAnchor.constraint(equalTo: signInWithLabel.centerYAnchor),
            leftLineView.leadingAnchor.constraint(equalTo: blackBackgroundView.leadingAnchor, constant: 10),
            leftLineView.trailingAnchor.constraint(equalTo: signInWithLabel.leadingAnchor, constant: -10),
            leftLineView.widthAnchor.constraint(equalToConstant: 50),
            leftLineView.heightAnchor.constraint(equalToConstant: 3)
        ])
        
        
        // Add a thin straight line on the right side of the "Sign In with" label
        blackBackgroundView.addSubview(rightLineView)
        NSLayoutConstraint.activate([
            rightLineView.centerYAnchor.constraint(equalTo: signInWithLabel.centerYAnchor),
            rightLineView.leadingAnchor.constraint(equalTo: signInWithLabel.trailingAnchor, constant: 10),
            rightLineView.trailingAnchor.constraint(equalTo: signInWithLabel.trailingAnchor, constant: 120),
            rightLineView.widthAnchor.constraint(equalToConstant: 50),
            rightLineView.heightAnchor.constraint(equalToConstant: 3)
        ])
        
        blackBackgroundView.addSubview(googleSignInButton)
        googleSignInButton.setImage(UIImage(named: "googleLogo")?.withRenderingMode(.alwaysOriginal), for: .normal)
        googleSignInButton.imageView?.contentMode = .scaleAspectFit
        NSLayoutConstraint.activate([
            googleSignInButton.topAnchor.constraint(equalTo: signInWithLabel.bottomAnchor, constant: 20),
            googleSignInButton.centerXAnchor.constraint(equalTo: blackBackgroundView.centerXAnchor, constant: -20),
            googleSignInButton.widthAnchor.constraint(equalToConstant: 50),
            googleSignInButton.heightAnchor.constraint(equalToConstant: 50),
            googleSignInButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            
        ])
        
        // Add Apple sign-in button next to the Google round button
        blackBackgroundView.addSubview(appleSignInButton)
        appleSignInButton.setImage(UIImage(named: "appleLogo")?.withRenderingMode(.alwaysOriginal), for: .normal)
        appleSignInButton.imageView?.contentMode = .scaleAspectFit
        //    appleSignInButton.tintColor = .black  // Adjust tint color if needed
        NSLayoutConstraint.activate([
            appleSignInButton.topAnchor.constraint(equalTo: googleSignInButton.topAnchor),
            appleSignInButton.leadingAnchor.constraint(equalTo: googleSignInButton.trailingAnchor, constant: 20),
            appleSignInButton.widthAnchor.constraint(equalToConstant: 50),
            appleSignInButton.heightAnchor.constraint(equalToConstant: 50),
            appleSignInButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            
        ])
    }
        
    @objc private func forgotPasswordButtonTapped() {
        // Implement the action for the "Forget your password?" button
        print("Forgot your password? button tapped!")
        // Add your logic for handling forgotten passwords, such as showing a reset password screen
    }


    private func updateUnderlineViewPosition(for label: UILabel) {
        UIView.animate(withDuration: 0.3) {
            self.underlineView.frame.origin.x = label.frame.origin.x
            self.underlineView.frame.size.width = label.frame.size.width
        }
    }

    @objc private func signUpButtonTapped() {
        print("Sign Up button tapped!")
    }
    @objc private func signInButtonTapped() {
        print("Sign In button tapped!")
    }
    


}
class tabbarViewController:UITabBarController{
    override func viewDidLoad() {
        self.selectedIndex = 2
    }
}
class GradientButton: UIButton {

    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }

    private lazy var gradientLayer: CAGradientLayer = {
        let l = CAGradientLayer()
        l.frame = self.bounds
        let colorTop = UIColor(red: 102.0 / 255.0, green: 55.0 / 255.0, blue: 245.0 / 255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 149.0 / 255.0, green: 84.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0).cgColor

        l.colors = [colorTop, colorBottom]
        l.startPoint = CGPoint(x: 0, y: 0.5)
        l.endPoint = CGPoint(x: 1, y: 0.5)
        l.cornerRadius = 30
        layer.insertSublayer(l, at: 0)
        return l
    }()
}
