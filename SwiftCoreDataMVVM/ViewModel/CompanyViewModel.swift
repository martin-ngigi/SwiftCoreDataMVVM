//
//  CompanyViewModel.swift
//  SwiftCoreDataMVVM
//
//  Created by Martin Wainaina on 06/05/2024.
//

import Foundation
import CoreData
import SwiftUI

class CompanyViewModel: ObservableObject {
    private let viewContext = PersistenceController.shared.container.viewContext
    @Published var companies: [CompanyEntity] = []
    @Published var company: CompanyEntity?
    
    @Published var title: String = ""
    @Published var owner: String = ""
    
    init() {
        fetchCompanies()
    }
    
    func fetchCompanies() {
        let request = CompanyEntity.fetchRequest()
        do {
            companies = try viewContext.fetch(request)
        }
        catch {
            print("DEBUG: Failed to load companies with error \(error.localizedDescription)")
        }
    }
    
    func addCompany(){
        if title.isEmpty || owner.isEmpty {
            print("DEBUG: owner or title can't be empty")
            return
        }
        
        let company = CompanyEntity(context: viewContext)
        company.id = UUID()
        company.title = title
        company.owner = owner
        save()
        fetchCompanies()
    }
    
    private func save() {
        do {
            try viewContext.save()
        }
        catch {
            print("DEBUG: Failed to save with error \(error.localizedDescription)")
        }
    }
    
    func editCompany(company: CompanyEntity) {
        if title.isEmpty || owner.isEmpty {
            print("DEBUG: owner or title can't be empty")
            return
        }
        
        company.id = UUID()
        company.title = title
        company.owner = owner
        save()
        fetchCompanies()
    }
    
    func deleteCompany(at offsets: IndexSet) {
        offsets.forEach { index in
            let company = companies[index]
            viewContext.delete(company)
        }
        save()
        fetchCompanies()
    }
}
