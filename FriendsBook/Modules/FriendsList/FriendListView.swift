//
//  Project: FriendsBook
//  File: FriendListView.swift
//  Created by: Robert Bikmurzin
//  Date: 31.01.2024
//

import UIKit
import SnapKit

protocol DisplayFriendList: AnyObject {
    func refreshData()
    func didSelectUser(userId: Int)
}

final class FriendListView: UIView {
    weak var delegate: DisplayFriendList?
    
    private var users: [UserViewModel.User] = []
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = Constants.tableViewBackgroundColor
        return tableView
    }()
    
    private let refreshControl: UIRefreshControl = {
       let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refresh(sender:)), for: .valueChanged)
        return refreshControl
    }()
    
    init() {
        super.init(frame: CGRect.zero)
        configView()
        makeConstraints()
        registerCells()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateFriendList(users: [UserViewModel.User]) {
        self.users = users
        tableView.reloadData()
    }
    
    func endRefreshing() {
        refreshControl.endRefreshing()
    }
    
    private func configView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.refreshControl = refreshControl
        backgroundColor = Constants.viewBackgroundColor
    }
    
    private func registerCells() {
        tableView.register(UserTableViewCell.self, forCellReuseIdentifier: UserTableViewCell.identifier)
    }
    
    private func makeConstraints() {
        addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().offset(Constants.horizontalPadding)
            make.verticalEdges.equalToSuperview()
        }
    }
    
    @objc
    private func refresh(sender: UIRefreshControl) {
        delegate?.refreshData()
    }
}

// MARK: - UITableViewDelegate
extension FriendListView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        Constants.heightForCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        delegate?.didSelectUser(userId: indexPath.row)
    }
}

// MARK: - UITableViewDataSource
extension FriendListView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let user = users[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.identifier, for: indexPath) as? UserTableViewCell else {
            return UITableViewCell()
        }
        cell.configCellData(viewModel: user)
        return cell
    }
}

// MARK: - Constants
extension FriendListView {
    enum Constants {
        static let tableViewBackgroundColor: UIColor = .clear
        static let viewBackgroundColor: UIColor = .white
        static let horizontalPadding: CGFloat = 10
        static let heightForCell: CGFloat = 70
    }
}
