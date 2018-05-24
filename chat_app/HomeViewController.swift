//
//  HomeViewController.swift
//  chat_app
//
//  Created by R.M.K.CET on 22/02/18.
//  Copyright © 2018 R.M.K.C.E.T. All rights reserved.
//

import UIKit
import GoogleSignIn
import Firebase

class HomeViewController: UIViewController{

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    @IBAction func chat(_ sender: Any) {
        let vc = storyboard!.instantiateViewController(withIdentifier: "ChatViewController") as! ChatViewController
        let navigationController = UINavigationController(rootViewController: vc)
//        self.navigationItem.setHidesBackButton(false, animated:true);
        self.present(navigationController, animated: true, completion: nil)
        
    }
    @IBAction func signOut(_ sender: Any) {
        GIDSignIn.sharedInstance().signOut()
        let vc = storyboard!.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
        let navigationController = UINavigationController(rootViewController: vc)
        //        self.navigationItem.setHidesBackButton(false, animated:true);
        self.present(navigationController, animated: true, completion: nil)
    }
    var imgUrl=GIDSignIn.sharedInstance().currentUser.profile.imageURL(withDimension: 80)
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       self.name.text=GIDSignIn.sharedInstance().currentUser.profile.name
        self.email.text=GIDSignIn.sharedInstance().currentUser.profile.email
        //print(imgUrl ?? Error.self)
        
       
//         self.image.layer.cornerRadius = self.image.frame.size.width / 2;
//        self.image.layer.borderWidth = CGFloat(3.0);
        self.image.layer.cornerRadius = CGFloat(20.0);
        
        let data = NSData.init(contentsOf: imgUrl! as URL)
        if data != nil {
            image?.image = UIImage(data:data! as Data) //**Here imageView our ImageView outlet  **//
        }
      
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let backItem = UIBarButtonItem()
        backItem.title = "Back"
        navigationItem.backBarButtonItem = backItem // This will show in the next view controller being pushed
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // Implement these methods only if the GIDSignInUIDelegate is not a subclass of
    // UIViewController.
    
    // Stop the UIActivityIndicatorView animation that was started when the user
    // pressed the Sign In button
   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
}

