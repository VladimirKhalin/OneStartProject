
import Foundation
import UIKit

final class GTAModes_MainFlowCoordinator: NSObject, GTAModes_FlowCoordinator {
    
    private weak var rootViewController: UIViewController?
    private weak var panPresentedViewController: UIViewController?
    private weak var presentedViewController: UIViewController?
    
    
    override init() {
        super.init()
    }
    
    
    //MARK: Start View Controlle
    
    func gta_createFlow() -> UIViewController {
        let model = GTAModes_MainModel(navigationHandler: self as MainModelNavigationHandler)
        let controller = GTAModes_MainViewController_New(model: model)
        rootViewController = controller
        
        return controller
    }
}

extension GTAModes_MainFlowCoordinator: MainModelNavigationHandler {
    
    func mainModelDidRequestToModes(_ model: GTAModes_MainModel) {
        let modelScreen = GTAModes_MainModel(navigationHandler: self as MainModelNavigationHandler)
        let model = GTAModes_GameModesModel(navigationHandler: self as GameModesModelNavigationHandler)
        let controller = GTA_GameModesViewController(model: model, modelScreen: modelScreen)
        presentedViewController = controller
        rootViewController?.navigationController?.pushViewController(controller, animated: true)
    }
    
    func mainModelDidRequestToModesInfo(_ model: GTAModes_MainModel) {
        let model = GTAModes_GameModesModel(navigationHandler: self as GameModesModelNavigationHandler)
        let controller = GTA_GameModesInfoViewController(model: model)
        presentedViewController = controller
        rootViewController?.navigationController?.pushViewController(controller, animated: true)
    }
    
    func mainModelDidRequestToMap(_ model: GTAModes_MainModel) {
        let controller = GTAModes_MapViewController(navigationHandler: self as MapNavigationHandler)
        presentedViewController = controller
        rootViewController?.navigationController?.pushViewController(controller, animated: true)
    }
    
    func mainModelDidRequestToGameSelection(_ model: GTAModes_MainModel) {
        let model = GSModel(navigationHandler: self as GSModelNavigationHandler)
        let controller = GSViewController(model: model)
        presentedViewController = controller
        
        rootViewController?.navigationController?.pushViewController(controller, animated: true)
    }
    
    func mainModelDidRequestToChecklist(_ model: GTAModes_MainModel) {
        let model = GTAModes_ChecklistModel(navigationHandler: self as ChecklistModelNavigationHandler)
        let controller = GTAModes_ChecklistViewController(model: model)
        presentedViewController = controller
        rootViewController?.navigationController?.pushViewController(controller, animated: true)
    }
    
}

extension GTAModes_MainFlowCoordinator: GSModelNavigationHandler {

    func gsModelDidRequestToBack(_ model: GSModel) {
        presentedViewController?.navigationController?.popViewController(animated: true)
    }
    
    
    func gsModelDidRequestToGameModes(_ model: GSModel, gameVersion: String) {
        let model = GTAModes_GameCheatsModel(versionGame: gameVersion, navigationHandler: self as GameCheatsModelNavigationHandler)
        let controller = GTAModes_GameCheatsViewController(model: model)
        presentedViewController?.navigationController?.pushViewController(controller, animated: true)
    }

}

extension GTAModes_MainFlowCoordinator: ChecklistModelNavigationHandler {
    
    func checklistModelDidRequestToFilter(
        _ model: GTAModes_ChecklistModel,
        filterListData: FilterListData,
        selectedFilter: @escaping (String) -> ()
    ) {
        
        let controller = GTAModes_FilterViewController(
            filterListData: filterListData,
            selectedFilter: selectedFilter,
            navigationHandler: self as FilterNavigationHandler
        )
        presentedViewController?.gta_presentPan(controller)
        panPresentedViewController = controller
    }
    
    
    func checklistModelDidRequestToBack(_ model: GTAModes_ChecklistModel) {
        presentedViewController?.navigationController?.popViewController(animated: true)
    }
    
}

extension GTAModes_MainFlowCoordinator: GameCheatsModelNavigationHandler {
    
    func gameModesModelDidRequestToBack(_ model: GTAModes_GameCheatsModel) {
        presentedViewController?.navigationController?.popViewController(animated: true)
    }
    
    
    func gameModesModelDidRequestToFilter(
        _ model: GTAModes_GameCheatsModel,
        filterListData: FilterListData,
        selectedFilter: @escaping (String) -> ()
    ) {

        let controller = GTAModes_FilterViewController(
            filterListData: filterListData,
            selectedFilter: selectedFilter,
            navigationHandler: self as FilterNavigationHandler
        )
        presentedViewController?.gta_presentPan(controller)
        panPresentedViewController = controller
    }
    
}

extension GTAModes_MainFlowCoordinator: FilterNavigationHandler {
    
    func filterDidRequestToClose() {
        panPresentedViewController?.dismiss(animated: true)
    }
    
}

extension GTAModes_MainFlowCoordinator: MapNavigationHandler {
    
    func mapDidRequestToBack() {
        presentedViewController?.navigationController?.popViewController(animated: true)
    }
}

extension GTAModes_MainFlowCoordinator: GameModesModelNavigationHandler {
    
    func gameModesModelDidRequestToFilter(_ model: GTAModes_GameModesModel, filterListData: FilterListData, selectedFilter: @escaping (String) -> ()) {
        let controller = GTAModes_FilterViewController(
            filterListData: filterListData,
            selectedFilter: selectedFilter,
            navigationHandler: self as FilterNavigationHandler
        )
        presentedViewController?.gta_presentPan(controller)
        panPresentedViewController = controller
    }
    
    func gameModesModelDidRequestToBack(_ model: GTAModes_GameModesModel) {
        presentedViewController?.navigationController?.popViewController(animated: true)
    }
    
}
