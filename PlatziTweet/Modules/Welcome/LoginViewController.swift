//
//  LoginViewController.swift
//  PlatziTweet
//
//  Created by DISMOV on 26/09/22.
//

import UIKit
import NotificationBannerSwift
import Simple_Networking
import SVProgressHUD //Libreria indicadores de carga al usuario

class LoginViewController: UIViewController {
    
    //MARK: - outlets
    @IBOutlet weak var loginButton:UIButton!
    @IBOutlet weak var emailTextField:UITextField!
    @IBOutlet weak var passwordTextField:UITextField!
    
    //MARK: - IBactions
    @IBAction func loginButtonAction(){
        view.endEditing(true)
        performLogin()
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    //MARK: - Private Methods
    
    private func setupUI(){
        loginButton.layer.cornerRadius = 25
    }
    
    private func performLogin(){
        guard let email = emailTextField.text, !email.isEmpty else{
            NotificationBanner(title: "Error", subtitle: "Debes especificar un correo", style:.warning).show()
            return
        }
        guard let password = passwordTextField.text, !password.isEmpty else{
            NotificationBanner(title: "Error", subtitle: "Debes ingresar una contraseña", style: .warning).show()
            return
            }
        //Crear Request
        let request = LoginRequest(email: email, password: password)
        
        //Iniciamos la carga
        SVProgressHUD.show()
        
        //Llamar a libreria de red
        SN.post(endpoint: Endpoints.login, model: request) { (response: SNResultWithEntity<LoginResponese, ErrorResponse>) in
            
            SVProgressHUD.dismiss()
            switch response {
            case .success(let user):
                //Bueno
                NotificationBanner(subtitle:"Bienvenido\(user.user.names)", style: .success).show()
                self.performSegue(withIdentifier: "showHome", sender: nil)
            case .error(let error):
                NotificationBanner(subtitle: "Error\(error.localizedDescription)",style: .danger).show()
                self.performSegue(withIdentifier: "showHome", sender: nil)
            case .errorResult(let entity):
                //no tan malo
                return
            }
        }
       
       //performSegue(withIdentifier: "showHome", sender: nil)
        //Iniciar Sesión aqui
    }
    
}
