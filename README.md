# iOS-Practise-Homepwner

Application was created using the resource: iOS Programming: The Big Nerd Ranch Guide (6th Edition)

Practise application that records a list of items with serial numbers and value. Users are presented with a tableview upon launch that
shows a list of items the user has recorded. The user can press the '+' key in the top right to create an object. Users can tap an items
row to view a detailed view. The detailed view allows the user to add a picture to the item.

NOTES
----------------------------------------------------------------------------------------------------------------------------------

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

-----------------------------------------------------------------------------------------------------------------------------------

UIAlertController:
- Often used to warn users that an important action is about to happen.
- Give them a chance to cancel the action

.actionSheet:
- used to present user with a list of actions from which to choose
- if user can back out of a decision or if action is not critical than .actionSheet may be better

.alert:
- used to display critical information to require user to decide how to precede.

-----------------------------------------------------------------------------------------------------------------------------------

Stack Views:
- Useful for interfaces with a linear layout 

Auto Layout:
- Every view has an intrinsic content size
- If you do not explicitly determine height or width, view uses its intrinsic content size to derive values
- Derives value from intrinsic content size using:
    - views content hugging priorities: Like a rubber band around a view. The higher the priority the stronger the rubber band. Higher priority wont stretch. Higher priority = more it wants to hug its intrinsic content size
    - views content compression resistance priorities: How much a view resists getting smaller than its intrinsic content 

-----------------------------------------------------------------------------------------------------------------------------------

Segues:
- Segues move another view controller's onto the screen.
- Each segue has a style, action item and identifier
    - style: how the view transition will be presented
    - action item: the view object in the storyboard file that triggers the segue
    - identifier - programmically access the segue
    


Design Patterns:

- Delegation - One object delegates certain responsibilities to another object.
- Data Source - Data source is responsible for providing data to another object when requested.
- Target-Action Pairs - One object calls a method on another object when a specfic event occurs. Target is the object that has a method called on it, action is the method being called. 
