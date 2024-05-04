//
//  DoctoresViewController.swift
//  mobile-app-hospital
//
//  Created by DAMII on 13/04/24.
//

import UIKit

struct Doctor{
    var nombre: String
    var dni: Int
}

class DoctoresViewController: UIViewController, UITableViewDataSource {

    
    
    var DoctoresList:[Doctor] = []
    
    @IBOutlet weak var TableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TableView.dataSource = self
        
        DoctoresList.append(Doctor(nombre: "Alfredo Melendez", dni: 78123465))
        DoctoresList.append(Doctor(nombre: "Cesar Gallardo", dni: 32547632))
        DoctoresList.append(Doctor(nombre: "Rosa Suarez", dni: 32455423))
        DoctoresList.append(Doctor(nombre: "Carmen Vargas", dni: 67436598))
        
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DoctoresList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DoctoresCell", for: indexPath) as! DoctoresTableViewCell
        
        let doctor = DoctoresList[indexPath.row]
        cell.NombreDoctor.text = doctor.nombre
        cell.DNIDoctoro.text = String(doctor.dni)
        
        return cell
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
