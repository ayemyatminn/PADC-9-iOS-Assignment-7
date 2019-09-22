//
//  ViewController.swift
//  NestedTableView
//
//  Created by Aye Myat Minn on 9/15/19.
//  Copyright © 2019 Aye Myat Minn. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    var parentList: [ParentVO] = []

    @IBOutlet weak var nestedTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        guard let url = URL(string: SharedConstants.baseURL) else {return}
//
//        Alamofire.request(url).responseData { (response) in
//
//            guard let data = response.result.value else { return}
//
//            do{
//                let decoder = JSONDecoder()
//                decoder.keyDecodingStrategy = .convertFromSnakeCase
//                self.parentList = try  decoder.decode([ParentVO].self, from: data)
//                print(self.parentList.first?.childs?.first?.childName ?? "")
//
//                self.nestedTableView.reloadData()
//            }catch let jsonErr{
//                print(jsonErr)
//            }
//        }
        // Do any additional setup after loading the view.
        nestedTableView.separatorStyle = .none
        
        nestedTableView.delegate = self
        nestedTableView.dataSource = self
        
        getDataList()
        
        nestedTableView.register(UINib(nibName: String(describing: ParentTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: ParentTableViewCell.self))
    }
    
    func getDataList(){
        DataModel.shared().getDataFromApi(success: { (result) in
            self.parentList = result
            self.nestedTableView.reloadData()
        }) { (err) in
            print(err)
        }
    }
}



extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.parentList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ParentTableViewCell.self), for: indexPath) as! ParentTableViewCell
        cell.parent = self.parentList[indexPath.row]
        return cell
    }
    
    
}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let childItemCount = self.parentList[indexPath.row].childs?.count ?? 0
         return CGFloat(53 + (121 * childItemCount))
    }
    
}

