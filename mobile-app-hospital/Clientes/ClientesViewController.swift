//
//  ClientesViewController.swift
//  mobile-app-hospital
//
//  Created by DAMII on 13/04/24.
//

import UIKit

struct Cliente{
    var nombre: String
    var dni: Int
    var tipoSangre: String
}


class ClientesViewController: UIViewController, UITableViewDataSource {

    var ClientesList:[Cliente] = []
    @IBOutlet weak var TableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TableView.dataSource = self
        
        ClientesList.append(Cliente(nombre: "Alfredo Melendez", dni: 89235478, tipoSangre: "O postivo"))
        ClientesList.append(Cliente(nombre: "Alfredo Melendez", dni: 89235478, tipoSangre: "A postivo"))
        ClientesList.append(Cliente(nombre: "Alfredo Melendez", dni: 89235478, tipoSangre: "O negativo"))
        ClientesList.append(Cliente(nombre: "Alfredo Melendez", dni: 89235478, tipoSangre: "O postivo"))
        ClientesList.append(Cliente(nombre: "Alfredo Melendez", dni: 89235478, tipoSangre: "A negativo"))

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ClientesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ClienteCell", for: indexPath) as! ClienteTableViewCell
        
        let cliente = ClientesList[indexPath.row]
        cell.nombreCliente.text = cliente.nombre
        cell.dniCliente.text = String(cliente.dni)
        cell.tipoSangre.text = cliente.tipoSangre
        
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
