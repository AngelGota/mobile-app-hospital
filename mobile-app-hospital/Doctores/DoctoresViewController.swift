//
//  DoctoresViewController.swift
//  mobile-app-hospital
//
//  Created by DAMII on 4/05/24.
//

import UIKit

class DoctoresViewController: UIViewController, UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate {
    

    @IBOutlet weak var doctoresTableView: UITableView!
    @IBOutlet weak var buscadorSearchBar: UISearchBar!
    
    var DoctoresList: [Doctor] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listarDoctor()
        buscadorSearchBar.delegate = self
        doctoresTableView.delegate = self
        doctoresTableView.dataSource = self
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        guard let criterioBusqueda = searchBar.text else {return}
        if criterioBusqueda.isEmpty{
            listarDoctor()
            self.doctoresTableView.reloadData()
            return  
        }
        buscarDoctor(criterio: criterioBusqueda)
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        listarDoctor()
        self.doctoresTableView.reloadData()
    }
    
    func buscarDoctor(criterio : String){
        //https://jsonplaceholder.typicode.com/users/
        let urlBuscar = String(format: "%@%@", "https://jsonplaceholder.typicode.com/users/?name=", criterio)
        
        guard let url = URL(string : urlBuscar) else {return}
        
        let task = URLSession.shared.dataTask(with: url) {
            data, response, error in
            
            guard let data = data, let response = response as? HTTPURLResponse, error == nil else{
                print("Error: ", error ?? "" )
                return
            }
            let status = response.statusCode
            guard(200...299).contains(status) else{
                print("Reponse Code", status)
                return
            }
            if let doctorArray = try? JSONDecoder().decode([Doctor].self, from: data) {
                self.DoctoresList = doctorArray
                DispatchQueue.main.async {
                    self.doctoresTableView.reloadData()
                }
            } else {
                print("Error decoding JSON data")
            }
        }
        task.resume()
    }
    
    
    func listarDoctor(){
        //https://jsonplaceholder.typicode.com/users/
        let urlBuscar = String("https://jsonplaceholder.typicode.com/users")
        
        guard let url = URL(string : urlBuscar) else {return}
        
        let task = URLSession.shared.dataTask(with: url) {
            data, response, error in
            
            guard let data = data, let response = response as? HTTPURLResponse, error == nil else{
                print("Error: ", error ?? "" )
                return
            }
            let status = response.statusCode
            guard(200...299).contains(status) else{
                print("Reponse Code", status)
                return
            }
            if let doctorArray = try? JSONDecoder().decode([Doctor].self, from: data) {
                self.DoctoresList = doctorArray
                DispatchQueue.main.async {
                    self.doctoresTableView.reloadData()
                }
            } else {
                print("Error decoding JSON data")
            }
        }
        task.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DoctoresList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DoctoresCell", for: indexPath) as! DoctoresTableViewCell
        
        let doc = DoctoresList[indexPath.row]
        
        cell.NombreDoctorLabel .text = doc.name
        cell.DniDoctorLabel .text = ("DNI: " + doc.address.zipcode)
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let doctor = DoctoresList[indexPath.row]
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "DetalleDoctorViewController") as! DetalleDoctorViewController
        vc.id = String(doctor.id)
        vc.dni = doctor.address.zipcode
        vc.nombre = doctor.name
        vc.user = doctor.username
        vc.email = doctor.email
        vc.direccion = String(doctor.address.city + ", " + doctor.address.street + ", " + doctor.address.suite)
        
        self.navigationController?.pushViewController(vc, animated: true)
        self.present(vc, animated: true, completion: nil)
        
        }
                                      
}

