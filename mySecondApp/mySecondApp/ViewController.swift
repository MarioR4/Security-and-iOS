//
//  ViewController.swift
//  mySecondApp
//
//  Created by MARIO ISAI ROBLES LOZANO on 30/09/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var usuarioTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBAction func botonUnoClick(_ sender: UIButton) {
        let alert = UIAlertController(title: "Alerta!!", message: usuarioTextField.text, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Cerrar", style: UIAlertAction.Style.cancel))
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        usuarioTextField.text = "Segunda Aplicación"
        usuarioTextField.textColor = UIColor(red: 36/255, green: 80/255, blue: 155/255, alpha: 1.0)
    }


}

