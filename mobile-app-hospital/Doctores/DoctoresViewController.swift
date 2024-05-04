//
//  DoctoresViewController.swift
//  mobile-app-hospital
//
//  Created by DAMII on 4/05/24.
//

import UIKit

class DoctoresViewController: UIViewController, UISearchBarDelegate, UITableViewDataSource {
    

    @IBOutlet weak var doctoresTableView: UITableView!
    @IBOutlet weak var buscadorSearchBar: UISearchBar!
    
    var DoctoresList: [Doctor] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buscadorSearchBar.delegate = self
        doctoresTableView.dataSource = self
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        guard let criterioBusqueda = searchBar.text else {return}
        buscarDoctor(criterio: criterioBusqueda)
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DoctoresList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DoctoresCell", for: indexPath) as! DoctoresTableViewCell
        
        let doc = DoctoresList[indexPath.row]
        
        cell.NombreDoctorLabel .text = doc.name
        cell.DniDoctorLabel .text = doc.address.city
        
        return cell
    }

}
