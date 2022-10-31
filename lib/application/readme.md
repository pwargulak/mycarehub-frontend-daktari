# Application

This is the Application layer in our Domain Driven Design(DDD) architecture.

It delegates the execution of business rules to the domain model classes(entities in the domain layer), which will ultimately update the data within those domain entities.
This is archived by use of the redux actions and view models that listen for any changes then updates the presentation layer.
