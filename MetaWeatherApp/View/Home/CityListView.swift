//
//  CityList.swift
//  MetaWeatherApp
//
//  Created by Khawlah Alrashed on 18/04/2022.
//

import SwiftUI

struct CityListView: View {
    @State var allWeathers: [Weather]
    
    var body: some View {
                VStack {
                    List (0 ..< allWeathers.count) { index in
                            NavigationLink(destination: DayListView(weather: allWeathers[index])) {
                                CityCell(weather: allWeathers[index])
                            }
                    }
                    .navigationBarTitle(Text("Cities"))
                }
        
    }
}

//struct CityList_Previews: PreviewProvider {
//    static var previews: some View {
//        CityListView(allWeathers: [Weather()])
//    }
//}
