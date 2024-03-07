//
//  MainItemObject.swift
//  GTAModes
//
//  Created by Максим Педько on 10.08.2023.
//

import Foundation
import RealmSwift

public struct MainItemsDataParser: Codable {
    
    public let data: [MainItemParser]
  
    enum CodingKeys: String, CodingKey {
      case data = "ubsakvasn16"
    
    }
}


//struct TempMainItemParser: Codable {
//  public let data1: [MainItemParser]
//  public let data2: [MainItemParser]
//   
//  enum CodingKeys: String, CodingKey {
//    case data1 = "ubsakvasn16"
//    case data2 = "ubsakvasn15"
//  }
//}


public struct MainItemParser: Codable {
    
    public let title: String
    public let type: String
    public let imagePath: String
    
    private enum CodingKeys : String, CodingKey {
            case title = "CASKm6"
            case type = "CASKm7"
            case imagePath = "CASKm8"
        }
}

public struct MainItem {
    
    public var title: String = ""
    public var type: String = ""
    public var imagePath: String = ""
    public var typeItem: MenuItemType
    
    private enum CodingKeys : String, CodingKey {
            case title = "CASKm6"
            case type = "CASKm7"
            case imagePath = "CASKm8"
        }
    
    init(title: String, type: String, imagePath: String, typeItem: MenuItemType) {
        self.title = title
        self.type = type
        self.imagePath = imagePath
        self.typeItem = typeItem
    }
    
}

public enum MenuItemType: String, Decodable {
    
    case main, gameSelection
    //, gameList
}

public final class MainItemObject: Object {

    @objc dynamic var title: String = ""
    @objc dynamic var type: String = ""
    @objc dynamic var imagePath: String = ""
    @objc dynamic var rawTypeItem: String = ""
    
    private enum CodingKeys : String, CodingKey {
            case title = "CASKm6"
            case type = "CASKm7"
            case imagePath = "CASKm8"
        }
    
    public var typeItem: MenuItemType {
    MenuItemType(rawValue: rawTypeItem) ?? .main
       // MenuItemType(rawValue: rawTypeItem) ?? .gameSelection
    }

    convenience init(
        title: String,
        type: String,
        imagePath: String,
        rawTypeItem: String
    ) {
        self.init()

        self.title = title
        self.type = type
        self.imagePath = imagePath
        self.rawTypeItem = rawTypeItem

    }

    var lightweightRepresentation: MainItem {
        print(title, type, imagePath, typeItem )
        return MainItem(title: title, type: type, imagePath: imagePath, typeItem: typeItem)
        
    }

}
