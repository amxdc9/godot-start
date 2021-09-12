# extends Node2D

var StringUtils = load("res://util/StringUtils.gd")

# (optional) class definition with a custom icon
class_name MyClass, "res://icon.png"



# Member variables
# gds有5种基础类型，Boolean，Integer(Java long)，Float(Java double)，String，Null

# &&=and  ||=or  !=not
var a = (true or false) && true
var b = 9223372036854775807
var c = 1.5
var s = "Hello"
var arr = [1, 2, 3]
var dict = {
	2: 3,
	"key": "字符串作为key",
	arr: "数组作为key"
}
var typed_var: int
var inferred_type: String = "String"

# Constants

const ANSWER = 42
const THE_NAME = "Charly"

# Enums

enum {LEFT, RRIGHT, FRONT, BACK}
# 等价于
# const LEFT = 0
# const RIGHT = 1
# const FRONT = 2
# const BACK = 3
enum FOOD {GOOD, NORMAL, BAD = -1}

# Built-in vector types

var v2 = Vector2(1, 2)
var v3 = Vector3(1, 2, 3)

func _init():
	pass

static func getAnswer():
	return ANSWER

func typeInfo():
	var template = "[Variant:{}] [type:{}] [value:{}]"
	print(StringUtils.format(template, [TYPE_BOOL, typeof(a), a]))
	print(StringUtils.format(template, [TYPE_INT, typeof(b), b]))
	print(StringUtils.format(template, [TYPE_INT, typeof(c), c]))
	print(StringUtils.format(template, [TYPE_STRING, typeof(s), s]))
	print(StringUtils.format(template, [TYPE_ARRAY, typeof(arr), arr]))
	print(StringUtils.format(template, [TYPE_DICTIONARY, typeof(dict), dict]))
	print(StringUtils.format(template, [TYPE_DICTIONARY, typeof(FOOD), FOOD]))
	print(StringUtils.format(template, [TYPE_DICTIONARY, typeof(FOOD.GOOD), FOOD.GOOD]))
	print(self is Reference)
	print(a is Dog) # 类似于instanceof

func some_function(param1, param2):
	var local_var = 5

	if param1 < local_var:
		print(param1)
	elif param2 > 5:
		print(param2)
	else:
		print("Fail!")
		
	match local_var:
		1:
			print("match1")
		2:
			print("match2")
		5:
			print("match5")
			# continue
		6:
			print("match6")
		_:
			print("match_")

	for i in range(20):
		print(i)

	while param2 != 0:
		param2 -= 1

	var local_var2 = param1 + 3
	return local_var2

# Function
func arrayIterator():
	# range等价于for(int i = 0; i < 20; i++)
	print("数组遍历方法1：")
	for i in range(3):
		print(i)
	print("数组遍历方法2：")
	for ele in arr:
		print(ele)
	print("数组遍历方法3：")
	for index in range(arr.size()):
		print(arr[index])


func dictionaryIterator():
	print("字典遍历方法1：")
	for key in dict:
		print("key:" + key as String)
		print("value:" + dict[key] as String)
		
	print("字典遍历方法2：")
	for key in dict.keys():
		print("key:" + key as String)
		print("value:" + dict[key] as String)
		
	print("字典遍历方法3：")
	for value in dict.values():
		print("value:" + value as String)	




func innerClassTest():
	var dog = Dog.new(1)
	dog.move()
	
	dog.info()
	dog.height = 2
	dog.info()

# Inner class，默认继承Object
class Animal:
	extends Object  # 如果不指定继承的类，默认基础Object
	const STATIC_FIELD = "静态变量"
	# 属性
	var height: int
	
	func _init():
		print("Animal 构造方法")
		
	func move():
		print("animal，移动")
	
	static func staticFuction():
		pass

class Dog: 
	extends Animal
	
	# Constructor
	func _init(height):
		self.height = height
		print("Dog 构造方法")
	
	# Functions override functions with the same name on the base/parent class.
	func move():
		print("dog，用4个脚跑")
		# If you still want to call them, use '.' (like 'super' in other languages).
		.move()
		
	func info(parm = 100):
		print("height：" + height as String)
