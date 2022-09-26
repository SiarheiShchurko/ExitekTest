//
//  ViewController.swift
//  TestProjectFor Exitek
//
//  Created by Alinser Shchurko on 13.09.22.
//

import UIKit

class RootVC: UIViewController {
    
    @IBOutlet private weak var label: UILabel!
    
    //MARK: Model var
    private var rootVM: MobileStorageProtocol = RootVM()
    
    //MARK: For bool func
    private var isContain: Bool = false
    
    //MARK: Models in database
    private let mobile1 = Mobile(imei: "017A0", model: "Iphone 5c")
    private let mobile2 = Mobile(imei: "1378PRMX", model: "Iphone 13 Pro Max")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Return all objects
        loadObject(mobile1)  //Load element in dataBase
        print("Data base contain \(rootVM.allMobiles)")  //Print all elements in dataBase
        guard let product = rootVM.findByImei("017A0") else { return } //Remove optional
        print("FIND THE \(product)")  //Print find object by imei in database
        loadObject(mobile2)  //Load second object
        deleteObject(mobile1)  //Delete object
        print("Data base contain \(rootVM.allMobiles)") //All actual elements in database
        isContain = rootVM.exists(mobile2) //Database contain that model?
        print(isContain) //Answer
        
    }
    

    //Load in set
    private func loadObject(_ object: Mobile) {
        do {
            //func save in set
            let _ = try rootVM.save(object)
        } catch {
            print("ERROR in loadFunc")
        }
    }
    
    //Delete object
    private func deleteObject(_ object: Mobile) {
        do {
            //func save in set
            let _ = try rootVM.delete(object)
        } catch {
            print("DELETE ERROR")
        }
    }
    

}


