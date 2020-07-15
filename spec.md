# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes) -- User has_many dreams
- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User) -- Dream belongs_to user 
- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients) User has_many :dream_symbolisms, through: :dreams, has_many :symbolisms, through: :dream_symbolisms
- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients) -- Symbolism has_many :dreams, through: :dream_symbolism, Dream has_many :symbolisms, through: :dream_symbolisms
- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity) -- DreamSymbolisms have meanings
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item) -- User has email, password, and username. Dreams and Symbolisms have validations for uniqueness on their titles and names, respectively, DreamSymbolism's meaning can't be blank.
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes) -- Dream's have is_public scope method to check if the is_public attribute = true
- [x] Include signup (how e.g. Devise)
- [x] Include login (how e.g. Devise)
- [x] Include logout (how e.g. Devise)
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
- [x] Include nested resource show or index (URL e.g. users/2/recipes) -- users/:user_id/dreams/:id && users/:id/dreams
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new) -- users/:id/dreams/new
- [x] Include form display of validation errors (form URL e.g. /recipes/new)

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate