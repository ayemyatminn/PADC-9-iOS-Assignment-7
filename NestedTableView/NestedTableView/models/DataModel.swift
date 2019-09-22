//
//  DataModel.swift
//  NestedTableView
//
//  Created by Aye Myat Minn on 9/21/19.
//  Copyright © 2019 Aye Myat Minn. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class DataModel{
    
    var parent: [ParentVO] = []
    
    class func shared() -> DataModel {
        return sharedDataModel
    }
    
    public static var sharedDataModel: DataModel = {
        let dataModel = DataModel()
        return dataModel
    }()
    
    func getDataFromApi(success: @escaping ([ParentVO]) -> Void,failure: @escaping (String) -> Void){
        NetworkClient.shared().getData(success: { (data) in
            guard let data = data as? Data else {return}
            do{
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                self.parent = try decoder.decode([ParentVO].self, from: data)
                
                success(self.parent)
            }catch let err{
                failure(err.localizedDescription)
            }
            
        }) { (err) in
            failure(err)
        }
    }
}

