### Markdown
    zr: reduces fold level throughout the buffer
    zR: opens all folds
    zm: increases fold level throughout the buffer
    zM: folds everything all the way
    za: open a fold your cursor is on
    zA: open a fold your cursor is on recursively
    zc: close a fold your cursor is on
    zC: close a fold your cursor is on recursively

# Clojure

### keywords
    :j keyword

# The Heart of Clojure

    LISP : List Processing
    in lisp, first element in expression is an operator or function
    so ("car" "cat")
    ;; -> ClassCastExceptions String cannot be cast to IFn
    '() -> the ' is needed for a list
    then you can do '(+ 2 4)
    ;; -> (+ 2 4)     Code is Data!!

#  Collections

    All collections are immutable and persisitant.
    Persistant means smart creations of new immutable versions.

### Lists ()

    '(1 2 "jam" :marmalade-jar)
    or
    '(1, 2, "jam", :marmalade-jar) #NOT IDIOMATIC

    (first )
    (rest )
    (first (rest (rest '(:rabbit :pocket-watch :marmalade :door))))
    ;; -> :marmalade

##### building lists using cons

    (cons 5 '()) add 5 to empty list
    or
    (cons 5 nil) since the end of a list is nil

    (cons 2 (cons 3 (cons 4 (cons 5 nil))))
    ;; -> (2 3 4 5)
    or use '()
    '(1 2 3 4 5) ;; -> (1 2 3 4 5)
    or
    (list 1 2 3 4 5) ;; -> (1 2 3 4 5)

conj : adds to the beginning of lists

    (conj '(:toast :butter) :jam :honey)
    ;; -> (:honey :jam :toast :butter)


### Vector : what if you need index access? []

    [:jar1 1 2 3 :jar2]
    ;; -> [:jar1 1 2 3 :jar2]
Faster index Performance than Lists

nth &

    (nth [:jar1 1 2 3 :jar2] 2) ;;
    ;; -> 2
last &

    (last [:rabbit :pocket-watch :marmalade])

count &

    (count [1 2 3 4 5])
    ;; -> 4


conj & : adds to the end of vectors

    (conj [:toast :butter] :jam)
    ;; -> [:toast :butter :jam]

    (conj [:toast :butter] :jam :honey)
    ;; -> [:toast :butter :jam :honey]

### Maps: key values

    {:jam1 "strawberry" :jam2 "blackberry"}
    ;; -> {:jam2 "blackberry", :jam1 "strawberry"}

    (get {:jam1 "strawberry" :jam2 "blackberry"} :jam2)
    ;; -> "blackberry"

default value returned

get &

    (get {:jam1 "strawberry" :jam2 "blackberry"} :jam3 "not found")
    ;; -> "not found"

    ;; getting using the key as the function
    (:jam2 {:jam1 "strawberry" :jam2 "blackberry" :jam3 "marmalade"})
    ;; -> "blackberry"

keys &

    ;; the keys function
    (keys {:jam1 "strawberry" :jam2 "blackberry" :jam3 "marmalade"})
    ;; -> (:jam3 :jam2 :jam1)

vals &

    ;;the vals function
    (vals {:jam1 "strawberry" :jam2 "blackberry" :jam3 "marmalade"})
    ;; -> ("marmalade" "blackberry" "strawberry")

The assoc function associates the new key-value pairs to map:
Given a map and a key, the dissoc function returns a new map with the key-value pair removed:
The merge function is also quite handy to merge the key-value pairs from one map to the other:

assoc &

    (assoc {:jam1 "red" :jam2 "black"} :jam1 "orange")
    ;; -> {:jam2 "black", :jam1 "orange"} a BRAND NEW Object

dissoc &

    (dissoc {:jam1 "strawberry" :jam2 "blackberry"} :jam1) ;; -> {:jam2 "blackberry"}

merge &

    (merge {:jam1 "red" :jam2 "black"} {:jam1 "orange" :jam3 "red"} {:jam4 "blue"})
    ;; -> {:jam4 "blue", :jam3 "red", :jam2 "black", :jam1 "orange"}

### Sets

    No Duplicates
    The fact that they are sets lets us do some handy set operations as well like union, difference, and intersection.
    In order to use them, you will need to prefix these functions with clojure.set.

union &

    must use clojure.set namespace

    (clojure.set/union #{:r :b :w} #{:w :p :y})
    ;; -> #{:y :r :w :b :p}
    The difference function is almost like subtraction. It takes the elements away from one of the sets:
    (clojure.set/difference #{:r :b :w} #{:w :p :y})
    ;; -> #{:r :b}

intersection &

    (clojure.set/intersection #{:r :b :w} #{:w :p :y})
    ;; -> #{:w}

converting to set &

    (set [:rabbit :rabbit :watch :door])
    ;; -> #{:door :watch :rabbit}
    (set {:a 1 :b 2 :c 3})
    ;; -> #{[:c 3] [:b 2] [:a 1]}

get &

    (get #{:rabbit :door :watch} :rabbit)
    ;; -> :rabbit
    (get #{:rabbit :door :watch} :jar)
    ;; -> nil
    We can also access it directly using the keyword:
    (:rabbit #{:rabbit :door :watch})
    ;; -> :rabbit

contains &

    (contains? #{:rabbit :door :watch} :rabbit) ;; -> true

add and remove from set

conj &

    To add elements onto a set, the collection functions of conj work just fine:
    (conj #{:rabbit :door} :jam)
    ;; -> #{:door :rabbit :jam}

disj &

    The disj function is used to remove elements from sets:
    (disj #{:rabbit :door} :door)
    ;; -> #{:rabbit}

# Symbols

    Clojure's version of variables

def &

    def actually uses a var, not a symbol
    var is powerful, and values also don't change


    lets create a var object in default namespace
    (def developer "Alice")
    ;; -> #'user/developer

let &: give temporary context

    available temporarily within the let context

    (def developer "Alice")
    ;; -> #'user/developer
    (let [developer "Alice in Wonderland"] developer)
    ;; -> "Alice in Wonderland"
    developer ;; -> "Alice"

    (let [developer "Alice in Wonderland" rabbit "White Rabbit"]
    [developer rabbit])
    ;; -> ["Alice in Wonderland" "White Rabbit"]
    rabbit
    ;; -> CompilerException java.lang.RuntimeException:
    ;; -> Unable to resolve symbol: rabbit in this context

defn &: creates vars for functions

    name, vector or parameters, body of function
    for no params, use empty vector

    (defn follow-the-rabbit [] "Off we go!")
    ;; -> #'user/follow-the-rabbit
    (follow-the-rabbit)
    ;; -> "Off we go!"

    (defn shop-for-jams [jam1 jam2] {:name "jam-basket" :jam1 jam1 :jam2 jam2})
    ;; -> #'user/shop-for-jams
    (shop-for-jams "strawberry" "marmalade")
    ;; -> {:name "jam-basket", :jam1 "strawberry", :jam2 "marmalade"}

fn  &: anonymous functions


    ;;returns back a temp function
    (fn [] (str "Off we go" "!"))
    ;; -> #<user$eval790$fn__791 user$eval790$fn__791@2ecd16a2>

    ;;invoke with parens
    ((fn [] (str "Off we go" "!")))
    ;; -> "Off we go!"

    In fact, defn is just the same as using def and binding the name to the anonymous function:
    (def follow-again (fn [] (str "Off we go" "!")))
    ;; -> #'user/follow-again
    (follow-again)
    ;; -> "Off we go!"


\# & shorthand for  fn

    (#(str "Off we go" "!"))
    ;; -> "Off we go!"

    (#(str "Off we go" "!" " - " %) "again")
    ;; -> "Off we go! - again"

    Or if there are multiple parameters, you can number the percent signs — for example, %1, %2, and so on:
    (#(str "Off we go" "!" " - " %1 %2) "again" "?")
    ;; -> "Off we go! - again?"

# Namespacing

### Namespace
ns &

    ns switches to namespace

create and switch to namespace

    (ns alice.favfoods) ;; -> nil

    at this point, the current namespace of REPL has switched
    can see this using *ns*

    *ns*
    ;; -> #<Namespace alice.favfoods>

    If we define something here, the var will be directly accessible:
    (def fav-food "strawberry jam")
    ;; -> #'alice.favfoods/fav-food
    fav-food
    ;; -> "strawberry jam"
    It also can be accessed via the fully qualified namespace alice.favfoods/fav-food:
    alice.favfoods/fav-food
    ;; -> "strawberry jam"

    If we switch to to another namespace, the symbol will no longer be resolved:
    (ns rabbit.favfoods) ;; -> nil
    fav-food
    ;; -> CompilerException java.lang.RuntimeException:
    ;; -> Unable to resolve symbol: fav-food in this context
    We could define a var with the symbol, with a different namespace, to another value: (ns rabbit.favfoods)

    (def fav-food "lettuce soup")
    ;; -> #'rabbit.favfoods/fav-food
    fav-food
    ;; -> "lettuce soup"

### Libs and Require

    Libs are made up of names and symbols associated with the namespaces

3 ways of using require expression

1st: Auto

    Auto-Require using fully qualified namespace
    (clojure.set/union #{:r :b :w} #{:w :p :y})
    ;; -> #{:y :r :w :b :p}
    or use
    (require 'clojure.set)

2cd: :as & (most commonly used)

    using an alias via :as
    this give us a prefix instead of the fully qualified namespace

    (ns wonderland) ;; -> nil

    ;; using an alias
    (require '[alice.favfoods :as af])
    ;; -> nil
    af/fav-food
    ;; -> "strawberry jam"

    Keyword Syntax:
    Although you can use require on its own, it is common to see it nested within the ns, with a keyword and vector:
    (ns wonderland
      (:require [alice.favfoods :as af]))
    af/fav-food
    ;; -> "strawberry jam"

3rd: :refer & :all & (can also be called: use)

    Loads ALL symbols and makes them directly accessible in current namespace
    Nameing conflicts can occur, harder to read

    import conflicts :
    (ns wonderland
      (:require [alice.favfoods :refer :all]
                [rabbit.favfoods :refer :all]))
      ;; -> Exception:
      ;; fav-food already refers to: #'alice.favfoods/fav-food
      ;; in namespace: wonderland


# Fun Function 1 learn &

    (ns wonderland
      (:require [clojure.set :as s]))

    (defn common-fav-foods [foods1 foods2]
      (let [food-set1 (set foods1)
            food-set2 (set foods2)
            common-foods (s/intersection food-set1 food-set2)]
        (str "Common Foods: " common-foods)))

    (common-fav-foods [:jam :brownies :toast]
                      [:lettuce :carrots :jam])
    ;; -> "Common Foods: #{:jam}"

# Transformation

    examples vs forms
    an expression is code that can be valuated for a result
    a form, is valid expression that can be evaluated. A form has correct syntax

### Logic Flows true false nil when

    (class true)
    ;; > java.lang.Boolean

convention for boolean to have ?

    (true? true)
    ;; > true
    (true? false)
    ;; > false

    (false? false)
    ;; > true

    (nil? nil)
    ;; > true

    (not false)
    ;; > true

    (not "hi")
    ;; > false

equality & (= ) (not= )

    (= :drinkme :drinkme)
    ;; > true

Collection Equality

    (= '(:drinkme :wow) [:drinkme :wow])

(empty? & works on vector list or map

    (empty? [:table :door :key])
    ;; > false

    definition of (empty? )
    (def empty?
        [coll] (not (seq coll)))


seq & persistent immutable sequence

    use (empty? [])
    and
    use (seq []) instead of (not (empty? []))

    collections and sequence abstractions
    collections share count, conj and seq function
    seq is walkable list abstraction
    seq provides first, rest and cons

    (seq [1 2 3])
    ;; > (1 2 4)

    (class [1 2 3])
    ;; -> clojure.lang.PersistentVector
    (class (seq [1 2 3]))
    ;; -> clojure.lang.PersistentVector$ChunkedSeq
    (seq [])
    ;; -> nil

every? &

    (every? fn [args])
    (every? odd? [1 3 5])
    ;; > true

    (every? (fn [x] (= x :drinkme)) [:drinkme drinkme])
    or
    (every? #(= % :drinkme) [:drinkme :drinkme])
    ;; > true

predicate & a function passed into function before args

some &

    (some #(> % 3) [1 2 3 4 5])
    ;; > true
    or
    (some #{3} [1 2 3 4])
    ;; > 3

    remember a set is a fn of its member
    (#{1 2 3 4} 3)
    ;; > 3

    so
    (some #{4 5} [1 2 3 4 5])
    ;; > 4

    CAREFUL
    (some #{nil} [nil nil nil])
    ;; -> nil
    (some #{false} [false false false])
    ;; -> nil

if & else &

    (if true "it is true" "it is false")
    ;; -> "it is true"
    (if false "it is true" "it is false")
    ;; -> "it is false"

if-let &

    evaluate based on result of if
    ;; This example is a bit contrived, because we could just do a ;; regular if, but it is good for illustration purposes.
    (if-let [need-to-grow-small (> 5 1)]
      "drink bottle"
      "don't drink bottle")

when & only evaluate when true

    (defn drink [need-to-grow-small]
      (when need-to-grow-small "drink bottle"))

when-let &

    (when-let [need-to-grow-small]
      "drink bottle")

cond & nested if's

    (let [bottle "drinkme"]
      (cond (= bottle "poison") "don't touch"
      (= bottle "drinkme") "grow smaller"
      (= bottle "empty") "all gone"
      :else "unknown"))
    ;; -> "grow smaller"
    nothing special about :else, just that it evaluates to true
    could also use "default" "unknown" since "default" evals to true

case & like cond but just one value is tested


    (let [bottle "drinkme"]
      (case bottle
        "poison" "don't touch"
        "drinkme" "grow smaller"
        "empty" "all gone"
        "unknown"))
    ;; > "unknown"
    the last expression is for no match. Otherwise exception thrown

# Functions Creating and Currying

### Currying &

partial &

    a way of currying in clojure
    take one param now and another param later
    splitting one function of many params into many single param functions

    (defn grow [name direction]
      (if (= direction :small)
        (str name " is growing smaller")
        (str name " is growing bigger")))
    ;; -> #'user/grow

    (grow "Alice" :small)
    ;; -> "Alice is growing smaller"

    We can take this original grow function of two parameters and change it into a function with one parameter of just the direction, with the name “Alice” already ready to be applied:

    (partial grow "Alice")
    ;; -> #<core$partial$fn__4228 clojure.core$partial$fn__4228@1759817d>
    ((partial grow "Alice") :small)
    ;; -> "Alice is growing smaller"

    (defn adder [x y] (+ x y))
    ;; -> #'user/adder
    (adder 3 4)
    ;; -> 7
    (def adder-5
    (partial adder 5))
    ;; -> #'user/adder-5
    (adder-5 10)
    ;; -> 15

comp & combining functions composing

    takes any number of funcitons as params
    (defn toggle-grow [direction]
      (if (= direction :small) :big :small))
    ;; -> #'user/toggle-grow

    (toggle-grow :big)
    ;; -> :small
    (toggle-grow :small)
    ;; -> :big

    (defn oh-my [direction]
      (str "Oh My! You are growing " direction))
    ;; -> #'user/oh-my

    to do both:
    (oh-my (toggle-grow :small))
    ;; -> "Oh My! You are growing :big"
    Or
    (defn surprise [direction]
      ((comp oh-my toggle-grow) direction))
    (surprise :small)
    ;; -> "Oh My! You are growing :big"

### Destructuring

    assign named bindings for elements in vectors and maps

