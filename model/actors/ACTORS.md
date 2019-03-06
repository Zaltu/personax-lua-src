# Overview
Because why not have lots of completely different things with the same name? Actors in this case represent:  
**Any non-static existance, whether interactable or not, that exists in any number of environments**  
Because we define everything to be loaded in each env in the Lua model, and to allow us to dynamically change what gets loaded, every single 2D and 3D element of a level must be defined, with behavioural properties, in Lua. We **do not count the basic, static background geometry as part of this**. That is also defined in Lua, but based on the name of the environemnt being loaded, as it represents the elements that will never change, regardless of flags or anything else.

## Definitions
Actors are defined with the following properties:
- model: the path/name of the 3D or 2D resource to load
- trigger: if desired, the lua code string to execute when the capsules overlap etc.

It is important to note that the interactability of the entity is completely dependant on the existance of the `trigger` property. A generic capsule will be automatically generated if there exists a potential trigger. The checking for flags and whether or not to include the actor is decided on *env* load, not here.