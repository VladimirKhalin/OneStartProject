
import UIKit
import Combine

class GTAModes_GameCheatsViewController: GTAModes_NiblessViewController {
    
  
    
    var alert: UIAlertController?
   
    var showTabBar = false
    
    private var subscriptions = Set<AnyCancellable>()
    //
    private let model: GTAModes_GameCheatsModel
    //
    private let menuStackConteinerLeft = UIStackView()
    //
    private let menuStackConteinerRight = UIStackView()
    //
    private let tableView = UITableView(frame: .zero, style: .grouped)
    
    private let tableViewFooter = UITableView(frame: .zero, style: .grouped)
    //
    private let customNavigation: GTAModes_CustomNavigationView
    //
  //  private let searchContainer = UIView()
    
    private var footer = UIView()
    
    private var fotterContent = GameModesHeaderView()
    //
 //   private var searchBar: GTAModes_SearchBar?
    //
    
    init(model: GTAModes_GameCheatsModel) {
        self.model = model
        self.customNavigation = GTAModes_CustomNavigationView(.gameModes, titleString: model.title)
        
        super.init()
        
        customNavigation.leftButtonAction = { [weak self] in
            self?.model.gta_backActionProceed()
        }
        customNavigation.rightButtonAction = { 
          //  [weak self] in
           // self?.model.gta_filterActionProceed()
            self.gta_changeDevice()    
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if model.cheatItems.isEmpty {
            gta_showSpiner()
        }
        gta_setupView()
        gta_setupBindings()
      //  gta_setupSearchBar()
      //  gta_searchBindings()
    }
    
    private func gta_setupView() {
        view.addSubview(customNavigation)
        customNavigation.gta_layout {
            $0.top.equal(to: view.safeAreaLayoutGuide.topAnchor, offsetBy: 21.0)
            $0.leading.equal(to: view.leadingAnchor, offsetBy: 20.0)
            $0.trailing.equal(to: view.trailingAnchor, offsetBy: -20.0)
            $0.height.equal(to: 36.0)
        }
        
//        view.addSubview(searchContainer)
//        searchContainer.gta_layout {
//            $0.top.equal(to: customNavigation.bottomAnchor, offsetBy: 16.0)
//            $0.leading.equal(to: view.safeAreaLayoutGuide.leadingAnchor, offsetBy: 20.0)
//            $0.trailing.equal(to: view.safeAreaLayoutGuide.trailingAnchor, offsetBy: -20.0)
//            $0.height.equal(to: 42)
//        }
//        searchContainer.backgroundColor = UIColor(named: "checkCellBlue")?.withAlphaComponent(0.4)
//        searchContainer.withCornerRadius(20.0)
        
        view.addSubview(tableView)
        tableView.backgroundColor = .clear
        tableView.tag = 1
        tableView.gta_layout {
          //  $0.top.equal(to: searchContainer.bottomAnchor, offsetBy: 8.0)
            $0.top.equal(to: customNavigation.bottomAnchor, offsetBy: 16.0)
            $0.leading.equal(to: view.leadingAnchor)
            $0.trailing.equal(to: view.trailingAnchor)
            $0.bottom.equal(to: view.bottomAnchor, offsetBy: 0)
             
        //    $0.bottom.equal(to: tableView.tableFooterView?.topAnchor)
          
        }

        view.addSubview(tableViewFooter)
        tableViewFooter.isHidden = self.showTabBar ? false : true
        tableViewFooter.backgroundColor = UIColor(named: "tapbarcolor")?.withAlphaComponent(0.95)
        tableViewFooter.alwaysBounceVertical = false
        tableViewFooter.registerReusableHeaderFooterView(viewType: GameModesHeaderView.self)
        tableViewFooter.estimatedRowHeight = 0.0
      //  tableViewFooter.dataSource = self
        tableViewFooter.delegate = self
        tableViewFooter.tag = 2

        tableViewFooter.gta_layout{
           // $0.top.equal(to: tableView.bottomAnchor, offsetBy: 10)
            $0.leading.equal(to: view.leadingAnchor)
            $0.trailing.equal(to: view.trailingAnchor)
            $0.height.equal(to: 120)
            $0.bottom.equal(to: view.bottomAnchor, offsetBy: 45)
        }
        
        tableView.registerReusableCell(cellType: GTAModes_MainViewCell.self)
        tableView.registerReusableCell(cellType: GTAModes_GameCheatsTableViewCell.self)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 96.0
        tableView.keyboardDismissMode = .onDrag
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
    }
    
    private func gta_setupBindings() {
        model.reloadData
            .sink { [weak self] in
                guard let self = self else { return }
                
                self.tableView.reloadData()
            }.store(in: &subscriptions)
        model.hideSpiner = { [weak self] in
            guard let self = self else { return }
            
            self.tableView.reloadData()
            self.gta_hideSpiner()
        }
    }
    
    private func gta_showSpiner() {
  
        alert = UIAlertController(title: nil, message: "Loading Data", preferredStyle: .alert)
        
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = .medium
        loadingIndicator.startAnimating()
        
        alert?.view.addSubview(loadingIndicator)
        
        present(alert!, animated: true, completion: nil)
        
    }
    
    private func gta_hideSpiner() {
        alert?.dismiss(animated: false)
    }
    
//    private func gta_setupSearchBar() {
//        let searchViewModel = GameModesSearchViewModel()
//        searchBar = GTAModes_SearchBar(viewModel: searchViewModel)
//        searchContainer.addSubview(searchBar!)
//        searchBar?.gta_layout {
//            $0.top.equal(to: searchContainer.topAnchor, offsetBy: -1.0)
//            $0.leading.equal(to: searchContainer.leadingAnchor, offsetBy: -1.0)
//            $0.trailing.equal(to: searchContainer.trailingAnchor, offsetBy: 1.0)
//            $0.bottom.equal(to: searchContainer.bottomAnchor, offsetBy: 1.0)
//        }
//    }
//    
//    private func gta_searchBindings() {
//        if let searchBar = searchBar {
//            searchBar.$text.dropFirst().sink { [weak self] searchText in
//                self?.model.gta_searchAt(searchText)
//            }.store(in: &subscriptions)
//            
//            searchBar.textDidEndEditing.sink { [ weak self ] _ in
//                self?.model.gta_searchDidCancel()
//            }.store(in: &subscriptions)
//            
//        }
//    }
    
    @objc func gta_changeDevice() {
        tableViewFooter.isHidden = showTabBar ? true : false
        self.showTabBar.toggle()
    }
}

extension GTAModes_GameCheatsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: GTAModes_GameCheatsTableViewCell = tableView.dequeueReusableCell(indexPath)
        cell.gameMode_configure_cell(model.cheatItems[indexPath.row])
        cell.backgroundColor = .clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView.tag == 1 {
           return  model.cheatItems.count
        } else {
            return 0
        }
    }
}

extension GTAModes_GameCheatsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(viewType: GameModesHeaderView.self)
        headerView?.backgroundColor = .orange
        headerView?.actionButton = { [weak self] index in
            self?.model.gta_showCheats(CheatsType.allCases[index])
        }
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if tableView.tag == 2 {
            return 45
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        model.gta_actionAt(index: indexPath.row)
    }
    
}
