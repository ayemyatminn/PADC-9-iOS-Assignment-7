//
//  ChildTableViewCell.swift
//  NestedTableView
//
//  Created by Aye Myat Minn on 9/15/19.
//  Copyright © 2019 Aye Myat Minn. All rights reserved.
//

import UIKit

class ChildTableViewCell: UITableViewCell {
    
    static let identifier = "ChildTableViewCell"

    
    @IBOutlet weak var ivProfile: UIImageView!
    @IBOutlet weak var lblStudentName: UILabel!
    @IBOutlet weak var lblStudentGender: UILabel!
    
    var child: ChildVO? {
        didSet{
            if let child = child{
                lblStudentName.text = child.childName
                lblStudentGender.text = child.gender
                if child.gender == "Female"{
                    ivProfile.image = UIImage(named: "female")
                }else{
                    ivProfile.image = UIImage(named: "male")
                }
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
