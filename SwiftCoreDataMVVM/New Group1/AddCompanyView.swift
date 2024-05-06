//
//  AddCompanyView.swift
//  SwiftCoreDataMVVM
//
//  Created by Martin Wainaina on 06/05/2024.
//

import SwiftUI

struct AddCompanyView: View {
//    @StateObject var viewModel = CompanyViewModel()
    @EnvironmentObject var viewModel : CompanyViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Form {
            HStack {
                Button("Cancel"){
                    dismiss()
                }
                .buttonStyle(.bordered)
                
                Spacer()
                
                Button("Save"){
                    // Edit company
                    if let company = viewModel.company {
                        viewModel.editCompany(company: company)
                    }
                    else { // Add company
                        viewModel.addCompany()
                    }
                    
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
            }
            
            TextField("Company name", text: $viewModel.title)
            TextField("Owner", text: $viewModel.owner)
        }
        .onDisappear {
            viewModel.title = ""
            viewModel.owner = ""
            viewModel.company = nil
        }
        .onAppear{
            // Populate Edit company data
            if let company = viewModel.company {
                viewModel.title = company.title ?? ""
                viewModel.owner = company.owner ?? ""
            }
        }
    }
}

//#Preview {
//    AddCompanyView()
//}
