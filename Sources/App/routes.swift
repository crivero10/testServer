import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "It works" example
    router.get { req in
        return "It works!"
    }
    
    // Basic "Hello, world!" example
    router.get("hello", "second", "third") { req in
        return "Hello, Joe!"
    }

    // Example of configuring a controller
    let todoController = TodoController()
    //when route=/todos, use function 'todoController.index'
    router.get("todos", use: todoController.index)
    router.post("todos", use: todoController.create)
    router.delete("todos", Todo.parameter, use: todoController.delete)
    
    let reviewController = UserController()
    router.get("reviews", use: reviewController.index)
    router.post("reviews", use: reviewController.create)
    router.delete("reviews", use: reviewController.delete)
}
