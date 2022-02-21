//
//  WeatherView.swift
//  MemberdWeather
//
//  Created by Christopher Eadie on 10/02/2022.
//

import SwiftUI

struct WeatherView: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        ZStack {
            VStack {
                Text("The weather in ")
                
                Text("London")
                    .fontWeight(.bold)
                
                Text(" is currently")
                
                if viewModel.currentTemp != nil {
                    Text(viewModel.currentTempString + " degrees")
                        .foregroundColor(tempColor)
                        .padding(.top, 10)
                } else {
                    Text("Unknown")
                }
            }
            .font(.system(.largeTitle))
        }
    }
    
    var tempColor: Color {
        switch (viewModel.currentTemp ?? 0.0) {
        case ...5:
            return .indigo
        case 5..<13:
            return .blue
        case 13..<18:
            return .pink
        case 18...25:
            return .orange
        default:
            return .red
        }
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(viewModel: .init())
    }
}
