//
//  IncompleteTaskCell.swift
//  TodoListUiKit
//
//  Created by firecode id2 on 31.03.2022.
//

import UIKit

class IncompleteTaskCell: UITableViewCell {
    
    static let id = "IncompleteTaskCell"

    @IBOutlet weak var name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
