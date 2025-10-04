1. Why I Chose a Class for ShoppingCart
I used a class for the ShoppingCart because the cart represents a single shared object whose state must persist and be updated across the program. When a user adds or removes products, those changes should be visible everywhere. This behavior requires reference semantics, which only classes provide. The cart also has its own identity — even if the contents change, it remains the same cart.
2. Why I Chose Structs for Product and Order
I implemented both Product and Order as structs because they represent independent, immutable data. A product is simply a set of information (name, price, category), while an order is a fixed snapshot of the cart at checkout. Structs use value semantics, meaning they are copied rather than referenced, which helps maintain data integrity and prevents unintended modifications.
3. Example Where Reference Semantics Matter
Reference semantics are essential for the ShoppingCart. When the cart object is passed to a function and updated (for example, adding a new product), those changes affect the original instance. This ensures all parts of the app always see the same, up-to-date version of the cart.
4. Example Where Value Semantics Matter
Value semantics are important for structs like CartItem. When you copy an item and change its quantity, the original instance remains unchanged. This behavior prevents accidental data modification and keeps values predictable and safe.
5. Challenges and Solutions
The main challenge was understanding when to use classes versus structs. Initially, I implemented everything as structs, but the cart didn’t preserve its state correctly. Switching to a class solved the issue.
Another challenge was handling optionals and data validation (such as ensuring positive quantities and prices). I solved this using guard statements and failable initializers.
Overall, this project helped me clearly understand the difference between reference and value types in Swift and how they affect the design and behavior of a program.

