//
//  ReleaseMonitoring
//  FirefoxPrivateNetworkVPN
//
//  This Source Code Form is subject to the terms of the Mozilla Public
//  License, v. 2.0. If a copy of the MPL was not distributed with this
//  file, You can obtain one at https://mozilla.org/MPL/2.0/.
//
//  Copyright © 2020 Mozilla Corporation.
//

import RxSwift
import RxCocoa

protocol ReleaseMonitoring {
    var updateStatus: Observable<UpdateStatus?> { get }

    func start()
    func stop()
}
