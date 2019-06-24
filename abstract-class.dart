void main() {
  PowerGrid grid = new PowerGrid();
  NuclearPlant nuclear = new NuclearPlant();
  SolarPlant solar = new SolarPlant();

  grid.addPlant(nuclear, hours: 5);
  grid.addPlant(solar, hours: 1);
}

class PowerGrid {
  List<PowerPlant> connectedPlants = [];

  addPlant(PowerPlant plant, {int hours}) {
    bool turnedOnConfirmation = plant.turnOn('$hours hours');
    print('TurnedOnConfirmation: $turnedOnConfirmation');
    connectedPlants.add(plant);
  }
}

abstract class PowerPlant {
  int costOfEnergy;
  bool turnOn(String turnedOnDuration);
}

abstract class ABuilding {
  double height;
}

class NuclearPlant implements PowerPlant {
  int costOfEnergy;
  bool turnOn(String turnedOnDuration) {
    print("I'm a nuclear plant turning on for $turnedOnDuration");
    return true;
  }
}

class SolarPlant implements PowerPlant, ABuilding {
  double height;
  int costOfEnergy;
  bool turnOn(String turnedOnDuration) {
    print("I'm a solar plant turning on for $turnedOnDuration");
    return false;
  }
}
