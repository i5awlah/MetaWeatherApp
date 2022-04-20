import CoreData

struct PersistenceController {
    static let shared = PersistenceController()
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "MeatWeather")
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
    
    func updateCoreData(weather: Weather) { //2487956 San // 1940345 Dubai
        // first check if the city is saved in CoreData. if there is then deleted and added again with updated values
        delete(weather: weather)
        add(weather: weather)
    }
    
    func save(completion: @escaping (Error?) -> () = {_ in} ) {
        let context = container.viewContext
        if context.hasChanges {
            do {
                try context.save()
                completion(nil)
            } catch {
                completion(error)
            }
        }
    }
    
    func add(weather: Weather) {
        // Get a reference to a NSManagedObjectContext
        let context = container.viewContext
        
        let city = City(context: context)
        city.title = weather.title
        city.woeid = String(weather.woeid)
        
        for i in 0..<weather.consolidatedWeather.count {
            let dayWeather = DayWeather(context: context)
            dayWeather.maxTemp = weather.consolidatedWeather[i].maxTemp
            dayWeather.minTemp = weather.consolidatedWeather[i].minTemp
            dayWeather.theTemp = weather.consolidatedWeather[i].theTemp
            dayWeather.airPressure = weather.consolidatedWeather[i].airPressure
            dayWeather.windSpeed = weather.consolidatedWeather[i].windSpeed
            dayWeather.humidity = Int16(weather.consolidatedWeather[i].humidity)
            dayWeather.applicableDate = weather.consolidatedWeather[i].applicableDate
            dayWeather.stateName = weather.consolidatedWeather[i].weatherStateName
            dayWeather.stateAbbr = weather.consolidatedWeather[i].weatherStateAbbr
            city.addToToWeather(dayWeather)
        }
        // save
        save { error in
            if error == nil {
                print("Save \(weather.title) in CoreData Successfully")
            }
        }
        
    }
    
    func delete(weather: Weather) {
        let context = container.viewContext
        do {
            let fetchRequest = NSFetchRequest<City>(entityName: "City")
            fetchRequest.fetchLimit = 1
            fetchRequest.predicate = NSPredicate(format: "title == %@", weather.title)
            
            // Fetch a single object. If the object does not exist,
            // nil is returned
            let object = try context.fetch(fetchRequest).first
            if let city = object {
                for i in 0..<city.toWeather!.count {
                    context.delete(city.toWeather![i] as! DayWeather)
                }
                
                context.delete(city)
                // save
                save { error in
                    if error == nil {
                        print("deleted \(weather.title) from CoreData Successfully")
                    }
                }
            }
            
        } catch {
        }
    }
    
    func fetch() -> [Weather]? {
        let context = container.viewContext
        do {
            let fetchRequest = NSFetchRequest<City>(entityName: "City")
            let objects = try context.fetch(fetchRequest)
            
            var weather = [Weather]()
            for i in 0..<objects.count {
                let title = objects[i].title!
                let woeid = Int(objects[i].woeid!) ?? 0
                
            var consolidatedWeather = [ConsolidatedWeather]()
                for j in 0..<objects[i].toWeather!.count {
                    let dayWeather = objects[i].toWeather![j] as! DayWeather
                    
                    let maxTemp = dayWeather.maxTemp
                    let minTemp = dayWeather.minTemp
                    let theTemp = dayWeather.theTemp
                    let airPressure = dayWeather.airPressure
                    let windSpeed = dayWeather.windSpeed
                    let humidity = dayWeather.humidity
                    let applicableDate = dayWeather.applicableDate
                    let weatherStateName = dayWeather.stateName
                    let weatherStateAbbr = dayWeather.stateAbbr
                    
                    consolidatedWeather.append(ConsolidatedWeather(weatherStateName: weatherStateName!, weatherStateAbbr: weatherStateAbbr!, created: "", applicableDate: applicableDate!, minTemp: minTemp, maxTemp: maxTemp, theTemp: theTemp, windSpeed: windSpeed, airPressure: airPressure, humidity: Int(humidity)))
                }
                
                weather.append(Weather(consolidatedWeather: consolidatedWeather, title: title, woeid: woeid))
                
            }
            return weather
        } catch {
        }
        return nil
    }
}
