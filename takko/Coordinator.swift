//
//  Coordinator.swift
//  takko
//
//  Created by Artur Carneiro on 14/02/20.
//  Copyright © 2020 Artur Carneiro. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator {
    
    var navigationController: UINavigationController { get set }
    func start()
}
