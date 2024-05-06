//
//  CompanyListView.swift
//  SwiftCoreDataMVVM
//
//  Created by Martin Wainaina on 06/05/2024.
//

import SwiftUI

struct CompanyListView: View {
//    @StateObject private var viewModel = CompanyViewModel()
    @EnvironmentObject var viewModel : CompanyViewModel
    @State var isShowSheet = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.companies, id: \.self) { company in
                    VStack(alignment: .leading) {
                        Text(company.title ?? "")
                        Text(company.owner ?? "")
                            .foregroundStyle(.gray)
                            .fontWeight(.light)
                    }
                    .onTapGesture {
                        viewModel.company = company
                        isShowSheet = true
                    }
                }
                .onDelete(perform: viewModel.deleteCompany)
            }
            .navigationTitle("Companies")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        isShowSheet = true
                    } label: {
                        Image(systemName: "plus")
                    }
                    .buttonStyle(.bordered)

                }
            }
            .sheet(isPresented: $isShowSheet) {
                AddCompanyView()
                    //.presentationDetents([.fraction(0.5)]) // cover only 50 %
                    .interactiveDismissDisabled()
                    
            }
        }
    }
}

//#Preview {
//    CompanyListView()
//}
