//
//  NiblessViewController.swift
//  GTA Modes
//
//  Created by Максим Педько on 27.07.2023.
//

import UIKit

open class GTAModes_NiblessViewController: UIViewController {
   
    private lazy var waterBackground: UIImageView = {
        let waterBack = UIImageView()
        waterBack.image = UIImage(named: "WaterBackground")
        waterBack.contentMode = .scaleToFill
        waterBack.translatesAutoresizingMaskIntoConstraints = false
        waterBack.heightAnchor.constraint(equalToConstant: view.frame.height).isActive = true
        waterBack.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
       return waterBack
    }()
    
    public init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required public init?(coder aDecoder: NSCoder) {
        fatalError("Init is not implemented")
    }
    
    open override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        view.setGradientBackground()
        view.addSubview(waterBackground)
        waterBackground.alpha = 0.9
        
      //  gta_setupBackground()
        
    }
    
//    private func gta_setupBackground() {
//        let backgroundImageView = UIImageView(frame: view.bounds)
//        backgroundImageView.image = UIImage(named: "bg")
//        backgroundImageView.contentMode = .scaleAspectFill
//        view.addSubview(backgroundImageView)
//        view.sendSubviewToBack(backgroundImageView)
//    }
    


}

open class NiblessFilterViewController: UIViewController {
    
    public init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required public init?(coder aDecoder: NSCoder) {
        fatalError("Init is not implemented")
    }
    
    open override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    private func gta_setupBackground() {
        view.backgroundColor = .black
    }
    
    open override func viewDidLoad() {
        //
        super.viewDidLoad()
        //
        gta_setupBackground()
        
    }
}
