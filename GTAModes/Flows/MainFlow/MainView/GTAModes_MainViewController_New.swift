import UIKit
import Combine

class GTAModes_MainViewController_New: GTAModes_NiblessViewController {
    
    private var subscriptions = Set<AnyCancellable>()
    //
    private let model: GTAModes_MainModel
    //
    private let menuStackConteinerLeft = UIStackView()
    //
    private let menuStackConteinerRight = UIStackView()
    //
    private let tableView = UITableView(frame: .zero)
    //
    private let tableViewTwo = UITableView(frame: .zero)
    //
    var alert: UIAlertController?
    //
    private func gta_setupView() {
        
        view.addSubview(menuStackConteinerLeft)
        menuStackConteinerLeft.backgroundColor = .clear // Color
        menuStackConteinerLeft.widthAnchor.constraint(equalToConstant: 165).isActive = true
        menuStackConteinerLeft.heightAnchor.constraint(equalToConstant: 670).isActive = true
        menuStackConteinerLeft.translatesAutoresizingMaskIntoConstraints = false
        menuStackConteinerLeft.center = CGPoint(x: menuStackConteinerLeft.bounds.size.width/2, y: menuStackConteinerLeft.bounds.size.height/2)
        
        NSLayoutConstraint.activate([
            menuStackConteinerLeft.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -90),
            menuStackConteinerLeft.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 20)
        ])
        
        view.addSubview(menuStackConteinerRight)
        menuStackConteinerRight.backgroundColor = .clear  // Color
        menuStackConteinerRight.widthAnchor.constraint(equalToConstant: 165).isActive = true
        menuStackConteinerRight.heightAnchor.constraint(equalToConstant: 670).isActive = true
        menuStackConteinerRight.translatesAutoresizingMaskIntoConstraints = false
        menuStackConteinerRight.center = CGPoint(x: menuStackConteinerRight.bounds.size.width/2, y: menuStackConteinerRight.bounds.size.height/2)
        
        NSLayoutConstraint.activate([
            menuStackConteinerRight.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 90),
            menuStackConteinerRight.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 20)
        ])

        navigationItem.title = ""
        menuStackConteinerLeft.addSubview(tableView)
        tableView.backgroundColor = .clear
        tableView.alwaysBounceVertical = false
        tableView.tag = 1
        
        tableView.gta_layout {
            $0.top.equal(to: menuStackConteinerLeft.safeAreaLayoutGuide.topAnchor, offsetBy: 0.0)
            $0.leading.equal(to: menuStackConteinerLeft.leadingAnchor)
            $0.trailing.equal(to: menuStackConteinerLeft.trailingAnchor)
            $0.bottom.equal(to: menuStackConteinerLeft.bottomAnchor)
        }
        
        tableView.registerReusableCell(cellType: GTAModes_MainViewCell.self)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        menuStackConteinerRight.addSubview(tableViewTwo)
        tableViewTwo.backgroundColor = .clear
        tableViewTwo.alwaysBounceVertical = false
        
        tableViewTwo.gta_layout {
            $0.top.equal(to: menuStackConteinerRight.safeAreaLayoutGuide.topAnchor, offsetBy: 0.0)
            $0.leading.equal(to: menuStackConteinerRight.leadingAnchor)
            $0.trailing.equal(to: menuStackConteinerRight.trailingAnchor)
            $0.bottom.equal(to: menuStackConteinerRight.bottomAnchor)
        }
        tableViewTwo.registerReusableCell(cellType: GTAModes_MainViewCell.self)
        tableViewTwo.tag = 2
        
        tableViewTwo.delegate = self
        tableViewTwo.dataSource = self
    }
    
    init(model: GTAModes_MainModel) {
        self.model = model
        super.init()
    }
    
    private func gta_setupBindings() {
        model.reloadData
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in
                guard let self = self else { return }
                
                         self.tableView.reloadData()
                         self.tableViewTwo.reloadData()
            }.store(in: &subscriptions)
        
        model.hideSpiner = { [weak self] in
            guard let self = self else { return }
            
                self.tableView.reloadData()
                self.tableViewTwo.reloadData()
            self.gta_hideSpiner()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if model.menuItems.isEmpty {
            gta_showSpiner()
        }
        gta_setupView()
        gta_setupBindings()
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
}

extension GTAModes_MainViewController_New: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           
        let cell: GTAModes_MainViewCell = tableView.dequeueReusableCell(indexPath)
            cell.gta_configure(model.menuItems[indexPath.row], fontSize: 25.0, isLock: false)
            cell.backgroundColor = .clear
            return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.menuItems.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        model.gta_selectedItems(index: indexPath.row)
       // print("INFO: Переход №\(indexPath.row)")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView.tag == 1 {
            switch indexPath.row {
            case 0: return 378 //
            case 2: return 290 //277
            default: return 0
            }
        }else {
            switch indexPath.row {
            case 1: return 290
            case 3: return 378
            default: return 0
            }
        }
    }
}
 
