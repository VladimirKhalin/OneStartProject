

import Foundation
import UIKit

final class GTAModes_GameCheatsTableViewCell: UITableViewCell, GTAModes_Reusable {
    
    private let containerView = UIView()
    private let titleLabel = UILabel()
    private let favoriteImage = UIImageView()
    private let firstStackView = UIStackView()
    private let secondStackView = UIStackView()
    private let contentModeView = UIView()
    private let modeTitleLabel = UILabel()
    private let spacerOne = UIView()
    private let spacerTwo = UIView()
    private let spacerThree = UIView()
    private let spacerFore = UIView()
    private let screenWidth = UIScreen.main.bounds.width
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        gta_setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func prepareForReuse() {
        super.prepareForReuse()
        
        favoriteImage.image = UIImage()
        
        titleLabel.text = ""
        firstStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        secondStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
    }
    
    public func gameMode_configure_cell(_ value: CheatItem) {
        titleLabel.font = UIFont(name: "Gilroy-Semibold", size: 15)
        titleLabel.textColor = .white
        //titleLabel.dropShadow(color: .black, offSet: CGSize(width: 1, height: 1))
        
        titleLabel.text = value.name
        favoriteImage.image =  UIImage(named: value.isFavorite ? "favoritesYes" : "favoritesNo")
        if value.code.count > 1 {
            contentModeView.isHidden = true
            firstStackView.isHidden = false
            secondStackView.isHidden = false
            print("============= ->  " + value.platform + "  <- =============" )
            let imagesListName = gta_configureCodes(value)
            print("============= ->  " + "\(imagesListName)" + "  <- =============" )
            gta_addImages(imagesListName)
        } else {
            contentModeView.isHidden = false
            firstStackView.isHidden = true
            secondStackView.isHidden = true
            modeTitleLabel.text = value.code.first ?? ""
            modeTitleLabel.font = UIFont(name: "Gilroy-Semibold", size: 15)
            modeTitleLabel.textColor = .white
        }
    }
    
    private func gta_setupLayout() {
        contentView.backgroundColor = .clear
        contentView.addSubview(containerView)
        containerView.gta_layout {
            $0.top.equal(to: contentView.topAnchor, offsetBy: 6.0)
            $0.bottom.equal(to: contentView.bottomAnchor, offsetBy: -6.0)
            $0.leading.equal(to: contentView.leadingAnchor, offsetBy: 20.0)
            $0.trailing.equal(to: contentView.trailingAnchor, offsetBy: -20.0)
        }
        containerView.withCornerRadius(20.0)
        containerView.backgroundColor = UIColor(named: "CheckCell")?.withAlphaComponent(1.0)
        containerView.dropShadow()
        
        containerView.addSubview(favoriteImage)
        favoriteImage.gta_layout {
            $0.trailing.equal(to: containerView.trailingAnchor, offsetBy: -15.0)
            $0.top.equal(to: containerView.topAnchor, offsetBy: 15.0)
            $0.height.equal(to: 21.0)
            $0.width.equal(to: 21.0)
        }
        favoriteImage.image = UIImage(named: "favoritesNo")
        
        containerView.addSubview(firstStackView)
        containerView.addSubview(secondStackView)
        containerView.addSubview(titleLabel)
        titleLabel.gta_layout {
            $0.leading.equal(to: containerView.leadingAnchor, offsetBy: 15.0)
            $0.trailing.equal(to: favoriteImage.leadingAnchor, offsetBy: -8.0)
            $0.top.equal(to: containerView.topAnchor, offsetBy: 15.0)
            $0.bottom.equal(to: firstStackView.topAnchor, offsetBy: -10.0)
        }
 
        firstStackView.backgroundColor = UIColor(named: "ButtonColor")?.withAlphaComponent(1.0)
        firstStackView.withCornerRadius(10)
        firstStackView.dropShadow()
        firstStackView.gta_layout {
            $0.top.equal(to: titleLabel.bottomAnchor, offsetBy: 15.0)
            $0.leading.equal(to: containerView.leadingAnchor, offsetBy: 15.0)
            $0.trailing.lessThanOrEqual(to: containerView.trailingAnchor, offsetBy: -15.0)
            $0.height.equal(to: 28)
        }
       /*
        firstStackView.gta_layout {
            $0.top.equal(to: titleLabel.bottomAnchor, offsetBy: 15.0)
            $0.leading.equal(to: containerView.leadingAnchor, offsetBy: 15.0)
            $0.trailing.lessThanOrEqual(to: containerView.trailingAnchor, offsetBy: -15.0)
            $0.height.equal(to: 28)
        }
        */
        
        
        
        secondStackView.backgroundColor = UIColor(named: "ButtonColor")?.withAlphaComponent(1.0)
        secondStackView.withCornerRadius(10)
        secondStackView.dropShadow()
        secondStackView.gta_layout {
            $0.top.equal(to: firstStackView.bottomAnchor, offsetBy: 8.0)
            $0.leading.equal(to: containerView.leadingAnchor, offsetBy: 15.0)
            $0.trailing.lessThanOrEqual(to: containerView.trailingAnchor, offsetBy: -15.0)
           // $0.height.equal(to: 28)
            $0.bottom.equal(to: containerView.bottomAnchor, offsetBy: -8.0)
        }
        gta_configureStackView(firstStackView)
        gta_configureStackView(secondStackView)
        
        containerView.addSubview(contentModeView)
        contentModeView.gta_layout {
            $0.top.equal(to: titleLabel.bottomAnchor, offsetBy: 8.0)
            $0.leading.equal(to: containerView.leadingAnchor, offsetBy: 8.0)
            $0.trailing.lessThanOrEqual(to: containerView.trailingAnchor, offsetBy: -8.0)
            $0.height.equal(to: 28)
            //$0.bottom.equal(to: containerView.bottomAnchor, offsetBy: -8.0)
        }
        
        contentModeView.addSubview(modeTitleLabel)
        modeTitleLabel.gta_layout {
            $0.top.equal(to: contentModeView.topAnchor, offsetBy: 4.0)
            $0.bottom.equal(to: contentModeView.bottomAnchor, offsetBy: -4.0)
            $0.leading.equal(to: contentModeView.leadingAnchor, offsetBy: 8.0)
            $0.trailing.equal(to: contentModeView.trailingAnchor, offsetBy: -8.0)
            $0.centerY.equal(to: contentModeView.centerYAnchor)
        }
        contentModeView.withCornerRadius(10.0)
       // contentModeView.withBorder(width: 1.0, color: UIColor(named: "blueLight")!)
        contentModeView.backgroundColor = UIColor(named: "ButtonColor")?.withAlphaComponent(1.0)
        contentModeView.dropShadow()
        containerView.layoutIfNeeded()
        
    }
    
    private func gta_addImages(_ imagesName: [String]) {
        firstStackView.addArrangedSubview(spacerOne)
        var spacerBool = false
        var imageIndex: Int = 0
        for image in imagesName {
            let imageView = UIImageView(image: UIImage(named: image))
            imageView.contentMode = .scaleAspectFit
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.gta_layout {
                $0.height.equal(to: 19.0)
                $0.width.equal(to: 19.0)
               
            }
            if imageIndex <= Int(screenWidth) / 28 {
                firstStackView.addArrangedSubview(imageView)
                imageView.gta_layout{
                    $0.top.equal(to: firstStackView.topAnchor, offsetBy: 5)
                    $0.bottom.equal(to: firstStackView.bottomAnchor, offsetBy: -5)
                }
            } else {
                if !spacerBool {
                    secondStackView.addArrangedSubview(spacerThree)
                    spacerBool.toggle()
                }
                secondStackView.addArrangedSubview(imageView)
                if image == imagesName.last {
                    secondStackView.addArrangedSubview(spacerFore)
                    imageView.gta_layout{
                    $0.top.equal(to: secondStackView.topAnchor, offsetBy: 5)
                    $0.bottom.equal(to: secondStackView.bottomAnchor, offsetBy: -5)
                }
                }
            }
            imageIndex += 1
    
        }
        firstStackView.addArrangedSubview(spacerTwo)
    }
    
    func gta_configureCodes(_ value: CheatItem) -> [String] {
        var trueCode: [String] = []
        
        if value.platform == "ps" {
            value.code.forEach { [weak self] code in
                guard let self = self else { return }
                
                let imageAssetName = self.gta_configurePSCode(code.uppercased())
                if imageAssetName == "" {
                    print(code)
                    print(value.code)
                }
                trueCode.append(imageAssetName)
            }
        }
        
        if value.platform == "xbox" {
            value.code.forEach { [weak self] code in
                guard let self = self else { return }
                
                let imageAssetName = self.gta_configureXBoxCode(code.uppercased())
                if imageAssetName == "" {
                    print(code)
                    print(value.code)
                }
                trueCode.append(imageAssetName)
            }
        }
        
        return trueCode
    }
    
    func gta_configurePSCode(_ code: String) -> String {
        if code == "TRIANGLE" {
            return "s_triangle"
        }
        if code == "SQUARE" {
            return "s_square"
        }
        if code == "CIRCLE" || code == "O" {
            return "s_circle"
        }
        if code == "X" {
            return "s_cross"
        }
        if code == "R1" {
            return "s_r1"
        }
        if code == "R2" {
            return "s_r2"
        }
        if code == "L1" {
            return "s_l1"
        }
        if code == "L2" {
            return "s_l2"
        }
        if code == "RIGHT" {
            return "s_right"
        }
        if code == "LEFT" {
            return "s_left"
        }
        if code == "DOWN" {
            return "s_down"
        }
        if code == "UP" {
            return "s_up"
        }
        return ""
    }
    
    func gta_configureXBoxCode(_ code: String) -> String {
        if code == "Y" {
            return "m_y"
        }
        if code == "B" {
            return "m_b"
        }
        if code == "A" {
            return "m_a"
        }
        if code == "X" {
            return "m_x"
        }
        if code == "RB" {
            return "m_rb"
        }
        if code == "RT" {
            return "m_rt"
        }
        if code == "LB" {
            return "m_lb"
        }
        if code == "LT" {
            return "m_lt"
        }
        if code == "RIGHT" {
            return "m_right"
        }
        if code == "LEFT" {
            return "m_left"
        }
        if code == "DOWN" || code == "Down" {
            return "m_down"
        }
        if code == "UP" {
            return "m_up"
        }
        
        if code == "R" || code == "L" || code == "BLACK" || code == "WHITE" {
            return "m_up"
        }
        return ""
    }
    
    func gta_configureStackView(_ stackView: UIStackView) {
        stackView.axis = .horizontal
        stackView.spacing = 3
        stackView.distribution = .fill
        stackView.alignment = .center
    }
    
}
