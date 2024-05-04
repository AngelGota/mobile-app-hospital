//
//  DoctoresTableViewCell.swift
//  mobile-app-hospital
//
//  Created by DAMII on 13/04/24.
//

import UIKit

class DoctoresTableViewCell: UITableViewCell {

    
    @IBOutlet weak var NombreDoctorLabel: UILabel!
    @IBOutlet weak var DniDoctorLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
