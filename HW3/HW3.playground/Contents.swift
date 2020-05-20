var collection: [Any] = [2, "Hi", true, 5, "Bye", false]
for item in collection {
    print(item)
}

for item in collection {
    if let item = item as? Int {
        print("\(item) is Int")
    } else if let item = item as? String {
        print("\(item) is String")
    } else if let item = item as? Bool {
        print("\(item) is Bool")
    }
}

for value in collection {
    if value is Int {
        print("Int - \(value)")
    } else if value is String {
        print("String - \(value)")
    } else if value is Bool {
        print("Bool - \(value)")
    }
}

let dictOfItems: [String: Any] = ["Int": 23,
                                  "Double": 3.14,
                                  "String": "String",
                                  "Bool true": true,
                                  "Bool false": false]

for (key, value) in dictOfItems {
    print("Key: \(key), Value: \(value)")
}

var total: Double = 0

for value in dictOfItems.values {
    if let item = value as? Int {
        total += Double(item)
    } else if let item = value as? Double {
        total += item
    } else if value is String {
        total += 1
    } else if let item = value as? Bool {
        total += item ? 2 : -3
    }
}
print(total)

total = 0

for value in dictOfItems.values {
    if let item = value as? Int {
        total += Double(item)
    } else if let item = value as? Double {
        total += item
    } else if let item = value as? String {
        if let number = Double(item) {
            total += number
        }
    }
}
print(total)

class Workout {
    let time: Double
    let distance: Double
    
    init(time: Double, distance: Double) {
        self.time = time
        self.distance = distance
    }
}

class Run: Workout {
    let cadence: Double
    
    init(cadence: Double, time: Double, distance: Double) {
        self.cadence = cadence
        super.init(time: time, distance: distance)
    }
}

class Swim: Workout {
    let stroke: String
    
    init(stroke: String, time: Double, distance: Double) {
        self.stroke = stroke
        super.init(time: time, distance: distance)
    }
}

var workouts: [Workout] = [
    Run(cadence: 80, time: 1200, distance: 4000),
    Swim(stroke: "Freestyle", time: 32.1, distance: 50),
    Swim(stroke: "Butterfly", time: 36.8, distance: 50),
    Swim(stroke: "Freestyle", time: 523.6, distance: 500),
    Run(cadence: 90, time: 358.9, distance: 1600)
]

func describeRun(runningWorkout: Run) {
    print("Cadence - \(runningWorkout.cadence) \nTime - \(runningWorkout.time / 60) \nDistance - \(runningWorkout.distance / 100)")
}

func describeSwim(runningWorkout: Swim) {
    print("Stroke - \(runningWorkout.stroke) \nTime - \(runningWorkout.time) \nDistance - \(runningWorkout.distance)")
}

for value in workouts {
    if value is Run {
        describeRun(runningWorkout: value as! Run)
    } else if value is Swim {
        describeSwim(runningWorkout: value as! Swim)
    }
}
