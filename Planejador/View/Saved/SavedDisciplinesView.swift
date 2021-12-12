//
//  SavedDisciplinesView.swift
//  Planejador
//
//  Created by Erick Manaroulas Felipe on 12/12/21.
//

import SwiftUI

struct SavedDisciplinesView: View {
    @State private var selectedType: ProfileViewSelection = .savedDisciplines
    @ObservedObject private var viewModel: ViewModel

    init() {
        viewModel = ViewModel()
    }

    var body: some View {
        VStack {
            Picker("Flavor", selection: $selectedType) {
                Text("Salvas").tag(ProfileViewSelection.savedDisciplines)
                Text("Histórico").tag(ProfileViewSelection.history)
            }
            Form {
                switch selectedType {
                case .savedDisciplines:
                    ForEach(viewModel.savedDisciplines, id: \.self.code) { disc in
                        NavigationLink(destination: { DisciplineDetailView(disc) }, label: {
                            MatchView(disc)
                        })
                    }
                case .history:
                    ForEach(viewModel.history, id: \.self.code) { disc in
                        NavigationLink(destination: { DisciplineDetailView(disc) }, label: {
                            MatchView(disc)
                        })
                    }
                }

            }
            .onAppear(perform: {
                self.viewModel.updateData()
            })
        }.pickerStyle(.segmented)
    }
}

struct SavedDisciplinesView_Previews: PreviewProvider {
    static var previews: some View {
        SavedDisciplinesView()
    }
}

enum ProfileViewSelection {
    case savedDisciplines
    case history
}
