type Animal = object
  name: string
  age: int

type AnimalBox = object
  animals: seq[Animal]

iterator eachName(box: AnimalBox): string = 
  let length = box.animals.len
  var i = 0
  while i < length:
    yield box.animals[i].name
    inc i

iterator eachNameAndAge(box: AnimalBox): tuple[a: string, b: int] = 
  let length = box.animals.len
  var i = 0
  while i < length:
    yield ( box.animals[i].name, box.animals[i].age )
    inc i

let dog = Animal(name: "dog", age: 5)
let cat = Animal(name: "cat", age: 4)
let bird = Animal(name: "bird", age: 3)
let animalBox = AnimalBox(animals: @[dog, cat, bird])

echo "animalBox.eachName:"
for name in animalBox.eachName():
  echo name

echo ""

echo "animalBox.eachNameAndAge:"
for pair in animalBox.eachNameAndAge():
  echo pair