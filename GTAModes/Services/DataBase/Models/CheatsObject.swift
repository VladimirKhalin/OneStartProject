////
////  CheatsObject.swift
////  GTAModes
////
////  Created by Максим Педько on 10.08.2023.
////
import Foundation
import RealmSwift

struct CheatCodeParser: Codable {
    let name: String
    let code: [String]
    let filterTitle: String
    
    private enum CodingKeys : String, CodingKey {
        case name = "AVHnmaskbn128"
        case code = "AVHnmaskbn127"
        case filterTitle = "AVHnmaskbn126"
    }
}

struct CheatCodesPlatformParser: Codable {
    let ps: [CheatCodeParser]
    let xbox: [CheatCodeParser]
    let pc: [CheatCodeParser]?
    
    private enum CodingKeys: String, CodingKey {
        case ps = "vmi51ovaCMs7"
        case xbox = "vmi51ovaCMs6"
        case pc = "vmi51ovaCMs5"
    }
}

struct CheatCodesGTA5Parser: Codable {
    let GTA5: CheatCodesPlatformParser
    
    private enum CodingKeys: String, CodingKey {
        case GTA5 = "kbias-kvsaj5612k"
    }
}

struct CheatCodesGTA6Parser: Codable {
    let GTA6: CheatCodesPlatformParser
    
    private enum CodingKeys: String, CodingKey {
        case GTA6 = "kbias-kvsaj5612k"
    }
}

struct CheatCodesGTASAParser: Codable {
    let GTA_San_Andreas: CheatCodesPlatformParser
    
    private enum CodingKeys: String, CodingKey {
        case GTA_San_Andreas = "kbias-kvsaj5612k"
    }
}

struct CheatCodesGTAVCParser: Codable {
    let GTA_Vice_City: CheatCodesPlatformParser
   
    private enum CodingKeys: String, CodingKey {
        case GTA_Vice_City = "kbias-kvsaj5612k"
    }
}

public struct CheatItem {
    
    var name: String = ""
    var code: [String] = []
    var filterTitle: String = ""
    var platform: String = ""
    var game: String = ""
    var isFavorite: Bool = false

    init(name: String, code: [String], filterTitle: String, platform: String, game: String, isFavorite: Bool) {
        self.name = name
        self.code = code
        self.filterTitle = filterTitle
        self.platform = platform
        self.game = game
        self.isFavorite = isFavorite
    }
}

public final class CheatObject: Object {
    
    @objc dynamic private(set) var id: String = UUID().uuidString.lowercased()
    @objc dynamic var name: String = ""
    var code = List<String>()
    @objc dynamic var filterTitle: String = ""
    @objc dynamic var platform: String = ""
    @objc dynamic var game: String = ""
    @objc dynamic var isFavorite: Bool = false
    
    override public static func primaryKey() -> String? {
        return #keyPath(CheatObject.id)
    }

    convenience init(
        name: String,
        code: [String],
        filterTitle: String,
        platform: String,
        game: String,
        isFavorite: Bool
    ) {
        self.init()
        self.name = name
        self.code.append(objectsIn: code)
        self.filterTitle = filterTitle
        self.platform = platform
        self.game = game
        self.isFavorite = isFavorite
    }

    var lightweightRepresentation: CheatItem {
        return CheatItem(
            name: name,
            code: Array(code),
            filterTitle: filterTitle,
            platform: platform,
            game: game,
            isFavorite: isFavorite
        )
    }
}





//    private enum CodingKeys : String, CodingKey {
//        case name = "AVHnmaskbn128"
//        case code = "AVHnmaskbn127"
//        case filterTitle = "AVHnmaskbn126"
//        case platform = "vmi51ovaCMs7"
//        case game = "44"
//        case isFavorites = "66"
//
//    }

/*
struct CheatCode: Codable {
    let name: String
    let code: [String]
    let filterTitle: String
    
    private enum CodingKeys: String, CodingKey {
        case name = "AVHnmaskbn128"
        case code = "AVHnmaskbn127"
        case filterTitle = "AVHnmaskbn126"
    }
}

// Define a struct to parse the array of cheat codes.
struct CheatCodesContainer: Codable {
    let cheatCodes: [CheatCode]
    
    private enum CodingKeys: String, CodingKey {
        case cheatCodes = "vmi51ovaCMs7"
    }
}

// Define a struct to parse the top-level object in the JSON.
struct Version5CheatCodes: Codable {
    let gameCheatCodes: CheatCodesContainer
    
    private enum CodingKeys: String, CodingKey {
        case gameCheatCodes = "kbias-kvsaj5612k"
    }
}
*/
