//
//  RegisterViewController.swift
//  PlatziTweet
//
//  Created by DISMOV on 26/09/22.
//

import UIKit
import NotificationBannerSwift
import Simple_Networking
import SVProgressHUD

class RegisterViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var registerButton:UIButton!
    @IBOutlet weak var nameTextfield:UITextField!
    @IBOutlet weak var emailTextfield:UITextField!
    @IBOutlet weak var passwordTextfield:UITextField!
    @IBOutlet weak var confirmPasswordTextfield:UITextField!
    
    //MARK: - IBactions
    @IBAction func registerButtonAction(){
        view.endEditing(true)
        performRegister()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    //MARK: - private Methods
    private func setupUI(){
        registerButton.layer.cornerRadius = 25
    }
    
    private func performRegister(){
        guard let nombre = nameTextfield.text, !nombre.isEmpty else{
            NotificationBanner(title: "Error", subtitle: "Por favor ingresa un nombre", style: .warning).show()
            return
        }
        guard let email = emailTextfield.text, !email.isEmpty else{
            NotificationBanner(title: "Error", subtitle: "Debes especificar un correo", style:.warning).show()
            return
        }
        guard let password = passwordTextfield.text, !password.isEmpty else{
            NotificationBanner(title: "Error", subtitle: "Debes ingresar una contraseña", style: .warning).show()
            return
            }
        
        //Crear request
        let request = RegisterRequest(email: email, password: password, names: nombre)
        
        SVProgressHUD.show()
        //Llamar al servicio
        SN.post(endpoint: Endpoints.register, model: request) {(response: SNResultWithEntity<LoginResponese, ErrorResponse>) in
            SVProgressHUD.dismiss()
            switch response{
            case .success(let user):
                NotificationBanner(subtitle:"Bienvenido\(user.user.names)", style: .success).show()
                self.performSegue(withIdentifier: "showHome", sender: nil)
            case .error(let error):
                return
            case .errorResult(let entity):
                return
                
            }
        }
        //performSegue(withIdentifier: "showHome", sender: nil)
        //Point Registrarnos
        
    }
    
    
    
    
}
