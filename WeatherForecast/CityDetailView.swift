//
//  CityDetailView.swift
//  WeatherForecast
//
//  Created by Kirill Lebedev on 13.08.24.
//

import SwiftUI

struct CityDetailView: View {

    @ObservedObject var viewModel: WeatherViewModel
    
    var body: some View {
        VStack {
            ZStack(alignment: .top) {
                CityCard(city: viewModel.selectedCity!, currentWeather: WeatherData.placeholder)
                HStack(alignment: .top) {
                    Button {
                        viewModel.showCityDetails = false
                    } label: {
                        Image(systemName: "chevron.down.circle")
                            .resizable() // To allow resizing
                             .frame(width: 20, height: 20) // Adjust the size
                             .foregroundColor(.black)
                             .opacity(0.7) // Make it slightly transparent
                    }
                    Spacer()
                    Button {
                        if viewModel.isFavorite {
                            viewModel.removeFavorite(city: viewModel.selectedCity!)
                        } else {
                            viewModel.addFavorite(city: viewModel.selectedCity!)
                        }
                    } label: {
                        Image(systemName: viewModel.isFavorite ? "star.fill" : "star")
                            .resizable() // To allow resizing
                             .frame(width: 20, height: 20) // Adjust the size
                             .foregroundColor(.black)
                             .opacity(0.7) // Make it slightly transparent
                    }
                }.padding(.horizontal)
            }
            Spacer()
        }
        
    }
    
}

#Preview {
    CityDetailView(viewModel: WeatherViewModel())
}
