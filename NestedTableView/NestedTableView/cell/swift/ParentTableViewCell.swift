//
//  ParentTableViewCell.swift
//  NestedTableView
//
//  Created by Aye Myat Minn on 9/15/19.
//  Copyright © 2019 Aye Myat Minn. All rights reserved.
//

import UIKit

class ParentTableViewCell: UITableViewCell {

    @IBOutlet weak var lblParentName: UILabel!
    @IBOutlet weak var childListTableView: UITableView!
    
    var parent: ParentVO? {
        didSet {
            if let parent = parent {
                lblParentName.text = parent.parentName
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.selectionStyle = .none
        childListTableView.separatorStyle = .none
        childListTableView.dataSource = self
        childListTableView.isScrollEnabled = false
        
        childListTableView.register(UINib(nibName: ChildTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: ChildTableViewCell.identifier)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension ParentTableViewCell: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return parent?.childs?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ChildTableViewCell.identifier, for: indexPath) as! ChildTableViewCell
        cell.child = parent?.childs?[indexPath.row]
        
        return cell
    }
    
    
}

