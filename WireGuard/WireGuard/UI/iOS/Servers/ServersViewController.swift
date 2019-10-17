// SPDX-License-Identifier: MIT
// Copyright © 2018-2019 WireGuard LLC. All Rights Reserved.

import UIKit

class ServersViewController: UIViewController {

    @IBOutlet var tableView: UITableView!

    private let accountManager: AccountManaging
    private var dataSource: ServersDataSourceAndDelegate?

    init(accountManager: AccountManaging = AccountManager.sharedManager) {
        self.accountManager = accountManager
        super.init(nibName: String(describing: ServersViewController.self), bundle: Bundle.main)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        styleViews()

        let countries = accountManager.availableServers ?? []
        self.dataSource = ServersDataSourceAndDelegate(countries: countries, tableView: self.tableView)
        self.tableView.reloadData()

    }

    func styleViews() {
        view.backgroundColor = UIColor.backgroundOffWhite
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.backgroundColor = UIColor.backgroundOffWhite
    }

    func setupNavigationBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "Close"), style: .plain, target: self, action: #selector(close))
        navigationItem.leftBarButtonItem?.tintColor = UIColor.guardianBlack
        navigationItem.title = "Connection"
    }

    @objc func close() {
        self.dismiss(animated: true, completion: nil)
    }
}
