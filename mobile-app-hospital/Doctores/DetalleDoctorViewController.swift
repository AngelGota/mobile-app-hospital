//
//  DetalleDoctorViewController.swift
//  mobile-app-hospital
//
//  Created by DAMII on 4/05/24.
//

import UIKit

class DetalleDoctorViewController: UIViewController {

    
    @IBOutlet weak var idDoctorLabel: UILabel!
    @IBOutlet weak var dniDoctorLabel: UILabel!
    @IBOutlet weak var nombreDoctorLabel: UILabel!
    @IBOutlet weak var userDoctorLabel: UILabel!
    @IBOutlet weak var emailDoctorLabel: UILabel!
    @IBOutlet weak var direccionDotorLabel: UILabel!
    
    
    var id: String = ""
    var dni: String = ""
    var nombre: String = ""
    var user: String = ""
    var email: String = ""
    var direccion: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        idDoctorLabel.text = id
        dniDoctorLabel.text = dni
        nombreDoctorLabel.text = nombre
        userDoctorLabel.text = user
        emailDoctorLabel.text = email
        direccionDotorLabel.text = direccion
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
