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
