import yaml
import pprint
f = open('seed.yml')
seed = yaml.load(f)
f.close()
f = open('data.yml')
for project in yaml.load_all(f):
  if 'ingredients' in project.keys():
    ingredients = project.values()[0]
  if 'locations' in project.keys():
    locations = project.values()[0]
  if 'meals' in project.keys():
    meals = project.values()[0]
  if 'recipes' in project.keys():
    recipes = project.values()[0]
  if 'cooked_meal_ingredients' in project.keys():
    cooked_meal_ingredients = project.values()[0]
  if 'recipe_ingredients' in project.keys():
    recipe_ingredients = project.values()[0]
f.close()


def getLocation(id_num):
  columns = locations['columns']
  for loc in locations['records']:
    if int(loc[columns.index('id')]) == int(id_num):
      return loc[columns.index('name')]
  return locations['records'][int(id_num)-1][columns.index('name')] 
def getIngredient(id_num):
  columns = ingredients['columns']
  for ing in ingredients['records']:
    if int(ing[columns.index('id')]) == int(id_num):
      return ing

ing_index = ingredients['columns']
loc_index = locations['columns']
meal_index = meals['columns']
recipe_index = recipes['columns']
cmi_index = cooked_meal_ingredients['columns']
ri_index = recipe_ingredients['columns']
def load_ingredients():
  for record in ingredients['records']:
    new_dict = {}
    new_dict['location'] = getLocation(record[ing_index.index('location_id')])
    new_dict['name'] = record[ing_index.index('name')]
    new_dict['photo'] = record[ing_index.index('photo')]
    new_dict['price'] = record[ing_index.index('price')]
    new_dict['size'] = record[ing_index.index('size')]
    if new_dict not in seed['ingredients']:
      seed['ingredients'].append(new_dict)

def load_locations():
  for record in locations['records']:
    new_dict = {}
    new_dict['name'] = record[loc_index.index('name')]
    new_dict['city'] = record[loc_index.index('city')]
    if record[loc_index.index('address')]:
      new_dict['location'] = record[loc_index.index('address')]
    if new_dict not in seed['locations']:
      seed['locations'].append(new_dict)

def load_cooked_meals():
  for record in meals['records']:
    if record[meal_index.index('type')] == "CookedMeal":
      new_dict = {}
      new_dict['name'] = record[meal_index.index('name')]
      new_dict['description'] = record[meal_index.index('description')]
      new_dict['directions'] = record[meal_index.index('directions')]
      new_dict['thumb'] = record[meal_index.index('thumb')]
      new_dict['time_in_minutes'] = record[meal_index.index('time_in_minutes')]
      new_dict['ingredients'] = []
      for cmi_r in cooked_meal_ingredients['records']:
        if cmi_r[cmi_index.index('cooked_meal_id')] == record[meal_index.index('id')]:
          ing_dict = {}
          ing = getIngredient(cmi_r[cmi_index.index('ingredient_id')])
          ing_dict['name'] = ing[ing_index.index('name')]
          ing_dict['size'] = cmi_r[cmi_index.index('amount')]
          new_dict['ingredients'].append(ing_dict)
    if new_dict not in seed['cooked_meals']:
      seed['cooked_meals'].append(new_dict)

def load_recipes():
  for record in recipes['records']:
    new_dict = {}
    new_dict['name'] = record[recipe_index.index('name')]
    new_dict['description'] = record[recipe_index.index('description')]
    new_dict['directions'] = record[recipe_index.index('directions')]
    new_dict['image'] = record[recipe_index.index('image')]
    new_dict['recipe_type'] = record[recipe_index.index('recipe_type')]
    new_dict['servings'] = record[recipe_index.index('servings')]
    new_dict['time_in_minutes'] = record[recipe_index.index('time_in_minutes')]
    new_dict['ingredients'] = []
    for ri_r in recipe_ingredients['records']:
      if ri_r[ri_index.index('recipe_id')] == record[recipe_index.index('id')]:
        ing_dict = {}
        ing = getIngredient(ri_r[ri_index.index('ingredient_id')])
        ing_dict['name'] = ing[ing_index.index('name')]
        ing_dict['size'] = ri_r[ri_index.index('amount')]
        new_dict['ingredients'].append(ing_dict)
    if new_dict not in seed['recipes']:
      seed['recipes'].append(new_dict)


load_ingredients()
load_locations()
load_cooked_meals()
load_recipes()

f = open('seed.yml', "w")
yaml.dump(seed, f)
f.close()
