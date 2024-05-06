//
//  SwiftCoreDataMVVMApp.swift
//  SwiftCoreDataMVVM
//
//  Created by Martin Wainaina on 06/05/2024.
//

import SwiftUI

@main
struct SwiftCoreDataMVVMApp: App {
    @StateObject var companyViewModel = CompanyViewModel()
    var body: some Scene {
        WindowGroup {
            CompanyListView()
                .environmentObject(companyViewModel)
        }
    }
}
