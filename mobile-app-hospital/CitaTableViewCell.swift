import UIKit

class CitaTableViewCell: UITableViewCell {

    @IBOutlet weak var nombreDoctor: UILabel!
    @IBOutlet weak var nombrePaciente: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
