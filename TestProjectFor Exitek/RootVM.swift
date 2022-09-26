//
//  RootVM.swift
//  TestProjectFor Exitek
//
//  Created by Alinser Shchurko on 13.09.22.
//

import UIKit

protocol MobileStorageProtocol {
    
    //Set where saved all mobile
    var allMobiles: Set<Mobile> { get set }
    
    //Protocol methods
    func getAll() -> Set<Mobile>
    func findByImei(_ imei: String) -> Mobile?
    func save(_ mobile: Mobile)throws -> Mobile?
    func delete(_ product: Mobile)throws
    func exists(_ product: Mobile) -> Bool
    
}

struct Mobile: Hashable {
    let imei: String
    let model: String
}

class RootVM: MobileStorageProtocol {
    
    //MARK: Set where storage our mobile
    var allMobiles: Set<Mobile> = [] 
    
    //MARK: Func returned all devices
    func getAll() -> Set<Mobile> {
        allMobiles.self
        }
    
    //MARK: Func find by imei
    func findByImei(_ imei: String) -> Mobile? {
        //Buffer var
        var product: Mobile?
        
        //Buffer array where I try find needed gadget
        let arrayMob = allMobiles.reversed()
        
        //Method rewire array
        arrayMob.forEach { savedGadget in
            if imei == savedGadget.imei {
                //if array contain device with same imei, product = this device, else product = nil
                product = savedGadget
            }
        }
        return product
    }
    
    //MARK: Func save device in set.
    func save(_ mobile: Mobile) throws -> Mobile? {
        
            allMobiles.insert(mobile)
      
        return mobile
        }
    
    //MARK: Delete device outside set
    func delete(_ product: Mobile) throws {
       
        allMobiles.remove(product)
        
    }
    
    //MARK: Contain or not?
    func exists(_ product: Mobile) -> Bool {
        allMobiles.contains(product) ? true : false
    }
}
    


