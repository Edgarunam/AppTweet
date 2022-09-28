//
//  WelcomeViewController.swift
//  PlatziTweet
//
//  Created by DISMOV on 26/09/22.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var loginButton:UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
}
    
    //MARK: -En este método se configuran cosas de la UI a la pantalla
    private func setupUI(){
        loginButton.layer.cornerRadius = 25
    }

}
