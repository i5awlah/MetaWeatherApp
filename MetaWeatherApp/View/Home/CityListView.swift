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
        NavigationView {
            ZStack {
                BackgroundView()
                VStack {
                    List {
                        ForEach(0 ..< 3) { index in
                            NavigationLink(destination: DayListView(weather: allWeathers[index])) {
                                CityCell(weather: allWeathers[index])
                            }
                        }
                        
                    }
                    .navigationBarTitle(Text("Cities"))
                }
            }
        }.accentColor(Color(.label))
        .onAppear { UITableView.appearance().backgroundColor = UIColor.clear
        }
    }
}

//struct CityList_Previews: PreviewProvider {
//    static var previews: some View {
//        CityListView(allWeathers: [Weather()])
//    }
//}
