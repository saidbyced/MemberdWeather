//
//  ContentView.swift
//  MemberdWeather
//
//  Created by Christopher Eadie on 10/02/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        WeatherView(viewModel: .init())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
