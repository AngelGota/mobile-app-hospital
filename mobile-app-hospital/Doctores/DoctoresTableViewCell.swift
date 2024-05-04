//
//  DoctoresTableViewCell.swift
//  mobile-app-hospital
//
//  Created by DAMII on 13/04/24.
//

import UIKit

class DoctoresTableViewCell: UITableViewCell {

    
    @IBOutlet weak var NombreDoctor: UILabel!
    
    @IBOutlet weak var DNIDoctoro: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
