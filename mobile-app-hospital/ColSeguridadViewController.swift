import UIKit
import CoreData

struct Seguridad {
    var nombres: String
    var dni: String
}

class ColSeguridadViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var seguridadTableView: UITableView!
    
    var seguridadLista: [PersonalEntity] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        seguridadTableView.dataSource = self
        seguridadTableView.delegate = self
        
        listarPersonal()
    }
    
    @IBAction func actionNewRegister(_ sender: Any) {
        var nombreTextField = UITextField()
        var dniTextField = UITextField()
        
        let alerta = UIAlertController(title: "Registrar personal", message: "Completa todos los campos", preferredStyle: .alert)
        
        alerta.addTextField {
            alertTextField in alertTextField.placeholder = "Ingrese nombre"
            nombreTextField = alertTextField
        }
        alerta.addTextField {
            alertTextField in alertTextField.placeholder = "Ingrese dni"
            dniTextField = alertTextField
        }
        
        let action = UIAlertAction(title: "Registrar", style: .default, handler: {
            action in 
            let nombre = nombreTextField.text
            let dni = dniTextField.text
            self.registrarPersonal(nombre: nombre, dni: dni)
            print("Registrar los datos del nuevo personal")
        })
        
        alerta.addAction(action)
        alerta.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
        present(alerta, animated: true, completion: nil)
    }
    
    func registrarPersonal(nombre: String?, dni: String?) {
        if let name = nombre, let dni = dni {
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let managedContext = appDelegate.persistentContainer.viewContext
            let entidad = PersonalEntity(context: managedContext)
            entidad.nombre = name
            entidad.dni = dni
            do{
                try managedContext.save()
                seguridadLista.append(entidad)
            } catch let error as NSError {
                print("No fue posible guardar los datos \(error), \(error.userInfo)")
            }
            seguridadTableView.reloadData()
        }
    }
    
    func listarPersonal() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        do {
            let results = try managedContext.fetch(PersonalEntity.fetchRequest())
            seguridadLista = results as! [PersonalEntity]
        } catch let error as NSError {
            print("No fue posible guardar los datos \(error), \(error.userInfo)")
        }
        seguridadTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return seguridadLista.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellSeguridad", for: indexPath) as! ColSeguridadTableViewCell
        let persona = seguridadLista[indexPath.row]
        cell.nombre.text = persona.nombre
        cell.dni.text = persona.dni
        
        return cell
        
    }
}
