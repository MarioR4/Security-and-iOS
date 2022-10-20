//
//  ImagenViewController.swift
//  Multimedia
//
//  Created by MARIO ISAI ROBLES LOZANO on 19/10/22.
//

import UIKit
import AVKit

class ImagenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    @IBAction func videoButton(_ sender: UIButton) {
        if let ruta = Bundle.main.path(forResource: "BorderCollie", ofType: "mp4") {
            let player = AVPlayerViewController()
            let video = AVPlayer(url: URL(filePath: ruta))
            player.player = video
            present(player, animated: true, completion: {
                video.play()
            })
        }
        else {
            let alerta = UIAlertController(title: "Error", message: "No se encontró el video", preferredStyle: UIAlertController.Style.alert)
            alerta.addAction(UIAlertAction(title: "Cerrar", style: UIAlertAction.Style.cancel))
            self.present(alerta, animated: true, completion: nil)
        }
    }
    
}
