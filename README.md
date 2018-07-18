# iOS-Practise-Homepwner

Practise application that stores a list of items that you have at your house.

Custom Initializers:
- Classes have two kinds of initializers:
    - Designated Initializer
    - Convenience Initializer
    
- Designated Initializer:
    - Primary initializer for a class
    - Every class has at least one designated initializer
    - Ensures every property of a class has values
    - Calls a designated initializer on its superclass (if it has one)
    
- Convenience Initializer:
    - Optional
    - Calls another initializer on the same class 
    - Indicated by 'convenience' keyword
    
- When you create your own custom initializer you lose the default "free" initializer - init() 
- This is useful when all of the classes properties have default values

-----------------------------------------------------------------------------------------------------------------------------------

Why is itemStore set externally on ItemsViewController?
- This is because of a concept called the 'dependency inversion principle'
    1. High level objects should not depend on low-level objects. Both should depend on abstractions
    2. Abstractions should not depend on details. Details should depend on abstractions
    
- Store is a low-level object. ItemsViewController is a high level object.
- This results in a decoupling because ItemsViewController is not dependent on ItemStore.

Dependency Injection:
- High level objects don't assume which lower-level objects they need to use. These are passed in as parameters.
