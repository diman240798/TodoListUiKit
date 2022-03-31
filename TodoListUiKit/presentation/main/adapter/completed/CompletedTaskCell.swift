//
//  CompletedTaskCellTableViewCell.swift
//  TodoListUiKit
//
//  Created by firecode id2 on 29.03.2022.
//

import UIKit

class CompletedTaskCell: UITableViewCell {

    static let id = "CompletedTaskCell"
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var checked: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
