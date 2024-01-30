//
//  Project: FriendsBook
//  File: UserDetailsView.swift
//  Created by: Robert Bikmurzin
//  Date: 28.01.2024
//

import UIKit
import SnapKit

final class UserDetailsView: UIView {
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        
        return tableView
    }()
    
    private var dataSource = [Section]()
    
    init() {
        super.init(frame: CGRect.zero)
        configView()
        createSections(viewModel: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Настройка View
extension UserDetailsView {
    private func configView() {
        registerCells()
        makeConstraints()
        backgroundColor = Constants.selfBackgroundColor
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func makeConstraints() {
        addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func registerCells() {
        tableView.register(InfoCell.self, forCellReuseIdentifier: InfoCell.identifier)
        tableView.register(AboutCell.self, forCellReuseIdentifier: AboutCell.identifier)
        tableView.register(ContactsCell.self, forCellReuseIdentifier: ContactsCell.identifier)
        tableView.register(LocationCell.self, forCellReuseIdentifier: LocationCell.identifier)
        tableView.register(AdditionalInfoCell.self, forCellReuseIdentifier: AdditionalInfoCell.identifier)
        tableView.register(UserTableViewCell.self, forCellReuseIdentifier: UserTableViewCell.identifier)
    }
}

// MARK: - Методы для обновления View
extension UserDetailsView {
    
    func updateView(viewModel: UserDetailsModels.ViewModel) {
        createSections(viewModel: viewModel)
        tableView.reloadData()
    }
    
    private func createSections(viewModel: UserDetailsModels.ViewModel?) {
        dataSource.removeAll()
        dataSource.append(Section.info(viewModel?.info))
        dataSource.append(Section.about(viewModel?.about))
        dataSource.append(Section.contacts(viewModel?.contacts))
        dataSource.append(Section.location(viewModel?.location))
        dataSource.append(Section.additionalInfo(viewModel?.additionalInfo))
        dataSource.append(Section.friends(viewModel?.friends))
    }
}

extension UserDetailsView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch dataSource[indexPath.section] {
        case .info: return Constants.infoCellHeight
        case .about: return Constants.aboutCellHeight
        case .contacts: return Constants.contactsCellHeight
        case .location: return Constants.locationCellHeight
        case .additionalInfo: return Constants.additionalInfoCellHeight
        case .friends: return Constants.friendsCellHeight
        }
    }
}

extension UserDetailsView: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        dataSource.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch dataSource[section] {
        case .info: return 1
        case .about: return 1
        case .contacts: return 1
        case .location: return 1
        case .additionalInfo: return 1
        case .friends(let friends): return friends?.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch dataSource[indexPath.section] {
        case .info(let info):
            let cell = tableView.dequeueReusableCell(withIdentifier: InfoCell.identifier, for: indexPath) as? InfoCell
            cell?.configCellData(viewModel: info)
            return cell ?? UITableViewCell()
        case .about(let about):
            let cell = tableView.dequeueReusableCell(withIdentifier: AboutCell.identifier, for: indexPath) as? AboutCell
            cell?.configCellData(viewModel: about)
            return cell ?? UITableViewCell()
        case .contacts(let contacts):
            let cell = tableView.dequeueReusableCell(withIdentifier: ContactsCell.identifier, for: indexPath) as? ContactsCell
            cell?.configCellData(viewModel: contacts)
            return cell ?? UITableViewCell()
        case .location(let location):
            let cell = tableView.dequeueReusableCell(withIdentifier: LocationCell.identifier, for: indexPath) as? LocationCell
            cell?.configCellData(viewModel: location)
            return cell ?? UITableViewCell()
        case .additionalInfo(let additionalInfo):
            let cell = tableView.dequeueReusableCell(withIdentifier: AdditionalInfoCell.identifier, for: indexPath) as? AdditionalInfoCell
            cell?.configCellData(viewModel: additionalInfo)
            return cell ?? UITableViewCell()
        case .friends(let friends): 
            let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.identifier, for: indexPath) as? UserTableViewCell
            cell?.configCellData(viewModel: friends?[indexPath.row])
            return cell ?? UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        dataSource[section].title
    }
}

// MARK: - Constants
extension UserDetailsView {
    enum Constants {
        static let infoTitle: String = "INFO"
        static let aboutTitle: String = "ABOUT"
        static let contactsTitle: String = "CONTACTS"
        static let locationTitle: String = "LOCATION"
        static let additionalInfoTitle: String = "ADDITIONAL INFO"
        static let friendsTitle: String = "FRIENDS"
        static let infoCellHeight: CGFloat = 160
        static let aboutCellHeight: CGFloat = 160
        static let contactsCellHeight: CGFloat = 160
        static let locationCellHeight: CGFloat = 50
        static let additionalInfoCellHeight: CGFloat = 90
        static let friendsCellHeight: CGFloat = 70
        static let selfBackgroundColor: UIColor = .white
    }
    
    enum Section {
        case info(UserDetailsModels.ViewModel.Info?)
        case about(String?)
        case contacts(UserDetailsModels.ViewModel.Contacts?)
        case location(String?)
        case additionalInfo(UserDetailsModels.ViewModel.AdditionalInfo?)
        case friends([UserViewModel.User]?)
        
        var title: String {
            switch self {
            case .info : return Constants.infoTitle
            case .about : return Constants.aboutTitle
            case .contacts : return Constants.contactsTitle
            case .location  : return Constants.locationTitle
            case .additionalInfo   : return Constants.additionalInfoTitle
            case .friends   : return Constants.friendsTitle
            }
        }
    }
}
