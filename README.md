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
