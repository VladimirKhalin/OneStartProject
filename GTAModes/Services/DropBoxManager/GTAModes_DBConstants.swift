import Foundation

struct GTA_DBKeys {
    
    static let RefreshTokenSaveVar = "refresh_token"
    
    static let appkey = "edrwnb9zlrqpmc4"
    static let appSecret = "x06ouknobnrivso"
    static let token = "k_NEn1_GHiMAAAAAAAAA1LhxTet_j7HydCHg8VFQuGw"
    static let refresh_token = "DziuHCVuEe0AAAAAAAAAARW5Mzi9un9WVMGpxLH-D8ZF3QaJHFCT7RticNQyuCBm"
    static let apiLink = "https://api.dropboxapi.com/oauth2/token"
    
    
//    static let appkey = "3c4yjrubjfbajey"
//    static let appSecret = "cxch66earsvqt49"
//    static let token = "YbDZn0zczkkAAAAAAAASG884Jy1iEiEnwIcsuy_KOTg"
//    static let refresh_token = "X-gKaGMs7IoAAAAAAAAAAcdzYPXNci9jL9Y89TwNMFJlfKTSFWfSaI1VIEUZXUPn"


    enum gta_Path: String {
        case gtasa_modes = "/cheats/version-SA/version-SA.json"
        case gtavc_modes = "/cheats/version-VC/version-VC.json"
        case gta5_modes = "/cheats/version-5/version-5.json"
        case gta6_modes = "/cheats/version-6/version-6.json"
        case main = "/main/main.json"
        case gameList = "/gameList/gamelist.json"
        case checkList = "/Checklist/checklist.json"
        case modsGTA5List = "/mods/content.json"
        
   
        
        
         
//        case gtasa_modes = "/Cheats/GTA-SA/cheats_GTA-SA.json"
//        case gtavc_modes = "/Cheats/GTA-VC/cheats_GTA-VC.json"
//        case gta5_modes = "/Cheats/GTA5/cheats_GTA5.json"
//        case gta6_modes = "/Cheats/GTA6/cheats_GTA6.json"
//        case main = "/main/main.json"
//        case gameList = "/gameList/gameList.json"
//        case checkList = "/cheklist/checklist.json"
//        case modsGTA5List = "/mods/mods_GTA5.json"
        
    }
}



