# Overview
This documentation concerns how to organize a shop menu structure so that the auto-noder will be able to properly generate a menu in the ui.
While the primary use for this is shop windows, the same process is used for the battle menu. The battle menu options are not sent from the model at this time,
but the structure is shown here as an example.


## Sample Battle Structure
```json
[
    {"Attack": lambda : target,}
    {"Spell":[
            {"spell_name_1": lambda : target},
            {"spell_name_2": lambda : targetall},
            {...}
        ]
    },
    {"Persona": [
            {"persona_name_1": lambda : changePersona},
            {"persona_name_2": lambda : changePersona},
            {...}
        ]
    },
    {"Guard": lambda : guard},
    {"Item": [
            {"itemname1": lambda : useItem},
            {...}
        ]
    },
    {"Scan": lambda : scanAbility}
]
```

### Reasoning
Wrapping the single-item dictionaries in a list allows maintaining an order, while being able to associate within the same structure the rest of the "tree" relying on the original element.

The specified lambdas are, of course, TODO as a structure, as we can't pass funcrefs directly.