class Hospital {
  String name, location, category, open, providerType, foundedOn;
  List specialities, facilities, insurance, workingDays, services;
  Hospital(
      String name,
      String location,
      String category,
      String open,
      String providerType,
      String foundedOn,
      List specialities,
      List facilities,
      List insurance,
      List workingDays,
      List services) {
    this.name = name;
    this.location = location;
    this.category = category;
    this.open = open;
    this.providerType = providerType;
    this.foundedOn = foundedOn;
    this.specialities = specialities;
    this.insurance = insurance;
    this.facilities = facilities;
    this.workingDays = workingDays;
    this.services = services;
  }
}
