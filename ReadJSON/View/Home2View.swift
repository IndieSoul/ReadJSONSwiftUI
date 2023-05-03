//
//  Home2View.swift
//  ReadJSON
//
//  Created by Luis Enrique Rosas Espinoza on 03/05/23.
//

import SwiftUI

struct Home2View: View {
    @StateObject var model2ViewModel = Model2ViewModel()
    
    var body: some View {
        if model2ViewModel.dataModels.data.isEmpty {
            ProgressView()
        } else {
            List(model2ViewModel.dataModels.data, id: \.id) { item in
                HStack {
                    AsyncImage(url: URL(string: item.avatar)) { image in
                        image
                            .resizable()
                            .frame(width: 80, height: 80)
                            .clipped()
                            .clipShape(Circle())
                    } placeholder: {
                        ProgressView()
                    }
                    VStack(alignment: .leading) {
                        Text(item.first_name)
                            .fontWeight(.bold)
                        Text(item.email)
                    }
                }
            }
        }
    }
}

struct Home2View_Previews: PreviewProvider {
    static var previews: some View {
        Home2View()
    }
}
