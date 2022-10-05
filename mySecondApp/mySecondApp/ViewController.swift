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
    @IBOutlet var numeroSuperior: UITextField!
    @IBOutlet var numeroInferior: UITextField!
    
    @IBAction func Suma(_ sender: UIButton) {
        let num1 = Double(numeroSuperior.text ?? "0")
        let num2 = Double(numeroInferior.text ?? "0")
        var mensaje = "poner ambas"
        
        // Control de Variables
        if (num1 != nil && num2 != nil) {
            let resultado = (num1!) + (num2!)
            mensaje = String(resultado)
        }
        
        let alert = UIAlertController(title: "Alerta!!", message: mensaje, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Cerrar", style: UIAlertAction.Style.cancel))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func Resta(_ sender: UIButton) {
        let num1 = Double(numeroSuperior.text ?? "0")
        let num2 = Double(numeroInferior.text ?? "0")
        var mensaje = "poner ambas"
        
        // Control de Variables
        if (num1 != nil && num2 != nil) {
            let resultado = (num1!) - (num2!)
            mensaje = String(resultado)
        }
        
        let alert = UIAlertController(title: "Alerta!!", message: mensaje, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Cerrar", style: UIAlertAction.Style.cancel))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func Multiplicacion(_ sender: UIButton) {
        let num1 = Double(numeroSuperior.text ?? "0")
        let num2 = Double(numeroInferior.text ?? "0")
        var mensaje = "poner ambas"
        
        // Control de Variables
        if (num1 != nil && num2 != nil) {
            let resultado = (num1!) * (num2!)
            mensaje = String(resultado)
        }
        
        let alert = UIAlertController(title: "Alerta!!", message: mensaje, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Cerrar", style: UIAlertAction.Style.cancel))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func division(_ sender: UIButton) {
        let dividendo = Double(numeroSuperior.text ?? "0")
        let divisor = Double(numeroInferior.text ?? "0")
        var mensaje = "poner ambas"
        
        // Control de Variables
        //if (dividendo != nil && divisor != nil) {
          //  let resultado = (dividendo!) / (divisor!)
            //mensaje = String(resultado)
        //}
        // Control de excepciones
        
        let alert = UIAlertController(title: "Alerta!!", message: mensaje, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Cerrar", style: UIAlertAction.Style.cancel))
        self.present(alert, animated: true, completion: nil)
    }
    
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

