import UIKit

var collection: [Any] = [2, "Hi", true, 5, "Bye", false]
print(collection)

for value in collection {
    if value is Int {
        print("Int - \(value)")
    } else if value is String {
        print("String - \(value)")
    } else if value is Bool {
        print("Bool - \(value)")
    }
}

var dict = [String: Any]()

var key = [String]()
var value = [Any]()

for index in collection {
    if index is String {
        key.append(index as! String)
    } else {
        value.append(index)
    }
}
for key in key {
    dict[key] = value
}
print(dict)


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
