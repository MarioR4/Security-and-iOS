//
//  ViewController.swift
//  Calculadora
//
//  Created by MARIO ISAI ROBLES LOZANO on 12/10/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var number1TextField: UITextField!
    @IBOutlet var number2TextField: UITextField!
    
    func mostrarAlerta(mensaje: String) {
        let alert = UIAlertController(title: "Alerta!!", message: mensaje, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Cerrar", style: UIAlertAction.Style.cancel))
        self.present(alert, animated: true, completion: nil)
        }
    
    @IBAction func alertButton(_ sender: UIButton) {
        let mensaje: String = usernameTextField.text!
                mostrarAlerta(mensaje: mensaje)
    }
    
    @IBAction func sumButton(_ sender: UIButton) {
        let num1 = Double(number1TextField.text ?? "0")
        let num2 = Double(number2TextField.text ?? "0")
        var mensaje: String = "poner ambas"
        
        // Control de Variables
        if (num1 != nil && num2 != nil) {
            let resultado = (num1!) + (num2!)
            mensaje = String(resultado)
        }
        
        mostrarAlerta(mensaje: mensaje)
    }
    
    @IBAction func subsButton(_ sender: UIButton) {
        let num1 = Double(number1TextField.text ?? "0")
        let num2 = Double(number2TextField.text ?? "0")
        var mensaje: String = "poner ambas"
        
        // Control de Variables
        if (num1 != nil && num2 != nil) {
            let resultado = (num1!) - (num2!)
            mensaje = String(resultado)
        }
        
        mostrarAlerta(mensaje: mensaje)
    }
    
    @IBAction func multButton(_ sender: UIButton) {
        let num1 = Double(number1TextField.text ?? "0")
        let num2 = Double(number2TextField.text ?? "0")
        var mensaje: String = "poner ambas"
        
        // Control de Variables
        if (num1 != nil && num2 != nil) {
            let resultado = (num1!) * (num2!)
            mensaje = String(resultado)
        }
        
        mostrarAlerta(mensaje: mensaje)
    }
    
    @IBAction func divButton(_ sender: UIButton) {
        let num1 = Double(number1TextField.text ?? "0")
        let num2 = Double(number2TextField.text ?? "0")
        var mensaje: String = "poner ambas"
        
        // Control de Variables
        if (num1 != nil && num2 != nil) {
            let resultado = (num1!) / (num2!)
            mensaje = String(resultado)
        }
        
        mostrarAlerta(mensaje: mensaje)
    }
    
    @IBAction func navegateImage(_ sender: UIButton) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let imagenViewController = storyBoard.instantiateViewController(withIdentifier: "imagenViewController")
        self.present(imagenViewController, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        usernameTextField.text = "Segunda Aplicación"
        usernameTextField.textColor = UIColor(red: 36/255, green: 80/255, blue: 155/255, alpha: 1.0)
    }


}

