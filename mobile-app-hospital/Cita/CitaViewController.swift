import UIKit

struct Cita{
    var nombrePaciente: String
    var nombreDoctor: String
}

class CitaViewController: UIViewController, UITableViewDataSource {
    
    var CitasList:[Cita] = []
    
    @IBOutlet weak var TableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TableView.dataSource = self
        
        CitasList.append(Cita(nombrePaciente: "Alfredo Melendez", nombreDoctor: "Nombre"))
        CitasList.append(Cita(nombrePaciente: "Alfredo Melendez", nombreDoctor: "Nombre"))
        CitasList.append(Cita(nombrePaciente: "Alfredo Melendez", nombreDoctor: "Nombre"))
        CitasList.append(Cita(nombrePaciente: "Alfredo Melendez", nombreDoctor: "Nombre"))
        CitasList.append(Cita(nombrePaciente: "Alfredo Melendez", nombreDoctor: "Nombre"))
       
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CitasList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CitasCell", for: indexPath) as! CitaTableViewCell
        let cita = CitasList[indexPath.row]
        cell.nombreDoctor.text = cita.nombreDoctor
        cell.nombrePaciente.text = cita.nombrePaciente
        
        return cell
    }
    
}
