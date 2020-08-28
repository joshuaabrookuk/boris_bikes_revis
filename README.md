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
