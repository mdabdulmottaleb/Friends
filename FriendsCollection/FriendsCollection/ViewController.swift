//
//  ViewController.swift
//  FriendsCollection
//
//  Created by AL Mustakim on 20/6/21.
//

import UIKit

class ViewController: UIViewController {
    
    var friendsArray = [RResult]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getFriends()
    }
    
    func getFriends(){
        
        var request = URLRequest(url: URL(string: "https://randomuser.me/api/?page=1&results=10")!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
          
            return
          }
          //print(String(data: data, encoding: .utf8)!)
            
            if let jsonResponse = try? JSONDecoder().decode(FriendsResponseModel.self, from: data) {
                
                self.friendsArray = jsonResponse.results!
                
                print(self.friendsArray)
                
            }
        }
        
        

        task.resume()

    }
    
    


}

