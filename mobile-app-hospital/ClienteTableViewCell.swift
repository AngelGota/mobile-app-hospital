//
//  ClienteTableViewCell.swift
//  mobile-app-hospital
//
//  Created by DAMII on 13/04/24.
//

import UIKit

class ClienteTableViewCell: UITableViewCell {
    @IBOutlet weak var nombreCliente: UILabel!
    @IBOutlet weak var dniCliente: UILabel!
    @IBOutlet weak var tipoSangre: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
