//
//  AppDelegate.swift
//  TodoListUiKit
//
//  Created by firecode id2 on 04.01.2022.
//

import UIKit
import Swinject
import SwinjectStoryboard

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    let container = SwinjectStoryboard.defaultContainer
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.registerDependencies()
        self.injectDependencies()
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.makeKeyAndVisible()
        self.window = window
        
        let storyboard = SwinjectStoryboard.create(name: "Main", bundle: nil, container: self.container)
        window.rootViewController = storyboard.instantiateInitialViewController()
        
        return true
    }
    
    private func registerDependencies() {
        // repo
        container.register(TaskRepository.self) { _ in TaskRepositoryRealmImplementaiton() }.inObjectScope(.container)
        // main
        container.register(MainInteractor.self) { r in
            MainInteractorImpl(r.resolve(TaskRepository.self)!)
        }
        container.register(MainViewModel.self) { r in
            MainViewModel(r.resolve(MainInteractor.self)!)
        }
        // details
        container.register(DetailsInteractor.self) { r in
            DetailsInteractorImpl(r.resolve(TaskRepository.self)!)
        }
        container.register(DetailsViewModel.self) { r in
            DetailsViewModel(r.resolve(DetailsInteractor.self)!)
        }
        // create
        container.register(CreateInteractor.self) { r in
            CreateInteractorImpl(r.resolve(TaskRepository.self)!)
        }
        container.register(CreateViewModel.self) { r in
            CreateViewModel(r.resolve(CreateInteractor.self)!)
        }
    }
    
    private func injectDependencies() {
        // main
        container.storyboardInitCompleted(MainViewController.self) { r, c in
            let viewModel = r.resolve(MainViewModel.self)
            c.viewModel = viewModel
        }
        // details
        container.storyboardInitCompleted(DetailsViewController.self) { r, c in
            let viewModel = r.resolve(DetailsViewModel.self)
            c.viewModel = viewModel
        }
        // create
        container.storyboardInitCompleted(CreateViewController.self) { r, c in
            let viewModel = r.resolve(CreateViewModel.self)
            c.viewModel = viewModel
        }
    }
}
