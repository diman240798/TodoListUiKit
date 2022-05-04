//
//  DetailsViewModel.swift
//  TodoListUiKit
//
//  Created by firecode id2 on 31.03.2022.
//

import Foundation
import UIKit

class DetailsViewModel {
    
    let interactor: DetailsInteractor
    
    init(_ interactor: DetailsInteractor) {
        self.interactor = interactor
    }
    
    func getTask(id: String) {
//        return interactor.getTask(id)
    }
}
