Welcome to the README.md

Post bootcamp I'm going over the learning materials starting from the beginning.

This is Boris Bikes again...


Extracting the Domain Model from user stories

Here are the user stoies:

As a person,
So that I can use a bike,
I'd like a docking station to release a bike.

As a person,
So that I can use a good bike,
I'd like to see if a bike is working

and the domain model asuming that person is not a controllable object here

| Objects | Messages |
|---------|----------|
|   Bike  | Working? |
| Dock_Stat | Release |


running irb we try to crate a new object from DockingStation

We get an error.


`
2.7.0 :001 > docking_station = DockingStation.new
Traceback (most recent call last):
        4: from /Users/student/.rvm/rubies/ruby-2.7.0/bin/irb:23:in `<main>'
        3: from /Users/student/.rvm/rubies/ruby-2.7.0/bin/irb:23:in `load'
        2: from /Users/student/.rvm/rubies/ruby-2.7.0/lib/ruby/gems/2.7.0/gems/irb-1.2
.1/exe/irb:11:in `<top (required)>'
        1: from (irb):1
NameError (uninitialized constant DockingStation)
`

Errors are awesome!

This is a NameError, we have a uninitialized constant 'DockingStation'
irb has no idea what this.


Writing a feature test for our new user story:

`As a system maintainer,
So that I can plan the distribution of bikes,
I want a docking station to have a default capacity of 20 bikes.`


2.7.0 :001 > require './lib/docking_station'
 => true
2.7.0 :002 > require './lib/bike'
 => true
2.7.0 :003 > station = DockingStation.new
=> #<DockingStation:0x00007fcb3e884580>
2.7.0 :004 > 20.times { station.dock Bike.new }
2.7.0 :005 > station.dock Bike.new
Traceback (most recent call last):
        7: from /Users/student/.rvm/rubies/ruby-2.7.0/bin/irb:23:in `<main>'
        6: from /Users/student/.rvm/rubies/ruby-2.7.0/bin/irb:23:in `load'
        5: from /Users/student/.rvm/rubies/ruby-2.7.0/lib/ruby/gems/2.7.0/gems/irb-1.2
.1/exe/irb:11:in `<top (required)>'
        4: from (irb):5
        3: from (irb):5:in `times'
        2: from (irb):5:in `block in irb_binding'
        1: from /Users/student/Desktop/Projects/post_bootcamp/Week_1/boris_bikes_revis
/lib/docking_station.rb:14:in `dock'
RuntimeError (DockingStation full!)
2.7.0 :006 >

Implementing new user stories

Feature test:

2.7.0 :001 > require './lib/docking_station'
 => true
2.7.0 :002 > require './lib/bike'
 => true
2.7.0 :003 > station = DockingStation.new
=> #<DockingStation:0x00007fe0141118d0 @bikes=[], @capacity=20>
2.7.0 :004 > bike = Bike.new => #<Bike:0x00007fe0109139b0>
2.7.0 :005 > station.dock(bike.working?(false))


"Men with ven"

`As a maintainer of the system,
So that I can manage broken bikes and not disappoint users,
I'd like vans to take broken bikes from docking stations and deliver them to garages to be fixed.

As a maintainer of the system,
So that I can manage broken bikes and not disappoint users,
I'd like vans to collect working bikes from garages and distribute them to docking stations.
`
looks like we'll need two new classes, vans and garages.

First off the van takes boken bikes from the docking station and stores them. The client has not indicated a limit on the ammount of bikes it can hold so I will assume it will take all them it can then drop them into a garage. They can also drop working bikes back off at a docking station.

Next we have garages, they can store bikes, no limit given and fixes bikes.
I wonder weather if I should impelemt a fix method for a garage or if the bikes should be automatically fixed when dropped off.



Feature test 'tree':
(All 'Named' classes exist for this feature flow)

Station.bikes = [[Bike_1, working],[Bike_2, broken],[Bike_3, broken]]
Van.collect_bikes(Station)
Station.bikes = [[Bike_1, working]]
Van.bikes = [[Bike_2, broken],[Bike_3, broken]]
Van.drop_off_bikes(Garage)
Van.bikes = []
Garage = [[Bike_2, working],[Bike_3, working]]
Van.collect_bikes(Garage)
Van.drop_off_bikes(Station)

There are a few problems here:

One being what happend if a Station only needs one fixed bike replaced but the Van wants to drop off two bike. We will get an error but it's not very practical. Maybe the Van only drops off an many bikes as the Station needs.

What happens if the Van tries to drop off a broken Bike back to a Station? Error?

We still have the isse of auotmatic fixing at a Garage vs a fix method.

Also my code is starting to look rather messy.



`require './lib/docking_station'
require './lib/bike'
require './lib/van'
require './lib/garage'
station = DockingStation.new
bike = Bike.new
van = Van.new
garage = Garage.new
bike.condition(false)
station.dock(bike)
van.collect_bikes(station)
van.drop_off_bikes(garage)
garage.fix_all
`


def collect_bikes(location)
  if location.is_a?(DockingStation)
    location.bikes.each do |bike|
      @bikes << bike if bike.status == false
    end
    location.bikes.clear
  elsif location.is_a?(Garage)
    location.bikes.each do |bike|
      @bikes << bike
    end
  end
end



def collect_bikes(location)
  case location
  when DockingStation
    location.bikes.each do |bike|
      @bikes << bike if bike.status == false
    end
    location.bikes.clear
  when Garage
    location.bikes.each do |bike|
      @bikes << bike
    end
  end
end





def collect_bikes(location)
  case location
  when DockingStation
    method if bike.status == false
    location.bikes.clear
  when Garage
    method
  end
end

private

def method
  location.bikes.each do |bike|
    @bikes << bike
  end
end

Modules as mixins

Behaviour shared by the DockingStation, Van, and Garage classes are that they all have a @bikes instance variable that is set to = [] on initialization 
