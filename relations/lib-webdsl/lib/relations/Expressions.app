module lib/relations/Expressions

section java implementations

  native class lib.relations.Expressions as Expressions{
  	static choice(Object, Object) : Object
  	static choice(Object, List<Object>) : List<Object>
  	static choice(List<Object>, Object) : List<Object>
  	static choice(List<Object>, List<Object>) : List<Object>
  	static merge(Object, Object) : List<Object>
  	static merge(Object, List<Object>) : List<Object>
  	static merge(List<Object>, Object) : List<Object>
  	static merge(List<Object>, List<Object>) : List<Object>
  	static plus(String, String) : String
  	static plus(Int, Int) : Int
  	static minus(Int, Int) : Int
  	static mul(Int, Int) : Int
  	static mod(Int, Int) : Int
  	static div(Int, Int) : Int
  	static avg(List<Int>) : Int
  	static sum(List<Int>) : Int
  	static max(List<Int>) : Int
  	static min(List<Int>) : Int
  	static conj(List<Bool>) : Bool
  	static disj(List<Bool>) : Bool
  	static concat(List<String>) : String
  	static count(Object) : Int
  	static count(List<Object>) : Int
  	static not(Bool) : Bool
  	static lt(Int, Int) : Bool
  	static lte(Int, Int) : Bool
  	static gt(Int, Int) : Bool
  	static gte(Int, Int) : Bool
  	static and(Bool, Bool) : Bool
  	static or(Bool, Bool) : Bool
  	static eq(Object, Object) : Bool
  	static eq(Object, List<Object>) : Bool
  	static eq(List<Object>, Object) : Bool
  	static eq(List<Object>, List<Object>) : Bool
  	static neq(Object, Object) : Bool
  	static neq(Object, List<Object>) : Bool
  	static neq(List<Object>, Object) : Bool
  	static neq(List<Object>, List<Object>) : Bool
  	static conditional(Bool, Object, Object) : Object
  	static conditional(Bool, Object, List<Object>) : Object
  	static conditional(Bool, List<Object>, Object) : Object
  	static conditional(Bool, List<Object>, List<Object>) : Object
  }

// section helper functions
//   
//   function asBoolean(i:Object):Bool{
//   	return i as Bool;
//   }
//   
//   function asBoolean(is:[Object]):[Bool]{
//   	var r : [Bool];
//   	for(i in is){
//   		r.add(i as Bool);
//   	}
//   	return r;
//   }
//   
//   function asInteger(i:Object):Int{
//   	return i as Int;
//   }
//   
//   function asInteger(is:[Object]):[Int]{
//   	var r : [Int];
//   	for(i in is){
//   		r.add(i as Int);
//   	}
//   	return r;
//   }
//   
//   function asString(i:Object):String{
//   	return i as String;
//   }
//   
//   function asString(is:[Object]):[String]{
//   	var r : [String];
//   	for(i in is){
//   		r.add(i as String);
//   	}
//   	return r;
//   }
// 
// section multiplicity expressions : choice (no shortcut evaluation)
// 
// 	function choice(i:Object, j:Object):Object{
// 		if(i!=null){
// 			return i;
// 		}
// 		return j;
// 	}
// 
// 	function choice(i:Object, js:[Object]):[Object]{
// 		if(i!=null){
// 			return [i];
// 		}
// 		return js;
// 	}
// 
// 	function choice(is:[Object], j:Object):[Object]{
// 		if(is.length>0){
// 			return is;
// 		}
// 		if(j!=null){
// 			return [j];
// 		}
// 		var empty : [Object];
// 		return empty;
// 	}
// 
// 	function choice(is:[Object], js:[Object]):[Object]{
// 		if(is.length>0){
// 			return is;
// 		}
// 		return js;
// 	}
// 
// section multiplicity expressions : merge
// 
// 	function merge(i:Object, j:Object):[Object]{
// 		var r : [Object];
// 		if(i!=null){
// 			r.add(i);
// 		}
// 		if(j!=null){
// 			r.add(j);
// 		}
// 		return r;
// 	}
// 
// 	function merge(i:Object, js:[Object]):[Object]{
// 		var r : [Object];
// 		if(i!=null){
// 			r.add(i);
// 		}
// 		r.addAll(js);
// 		return r;
// 	}
// 
// 	function merge(is:[Object], j:Object):[Object]{
// 		var r : [Object];
// 		r.addAll(is);
// 		if(j!=null){
// 			r.add(j);
// 		}
// 		return r;
// 	}
// 
// 	function merge(is:[Object], js:[Object]):[Object]{
// 		var r : [Object];
// 		r.addAll(is);
// 		r.addAll(js);
// 		return r;
// 	}
// 
// section math expressions : plus string
// 
//   function plus(i:String, j:String):String {
//   	return if(i != null && j != null) i+j else null;
//   }
//   
//   function plus(i:String, js:[String]):[String] {
//   	return plus([i], js);
//   }
//   
//   function plus(is:[String], j:String):[String] {
//   	return plus(is, [j]);
//   }
// 
//   function plus(is:[String], js:[String]):[String] {
//   	var r : [String];
//   	for(i in is){
//   		for (j in js){
//   			r.add(i+j);
//   		}
//   	}
//   	return r;
//   }
// 
// section math eipressions : plus int
// 
//   function plus(i:Int, j:Int):Int {
//   	return if(i != null && j != null) i+j else null;
//   }
//   
//   function plus(i:Int, js:[Int]):[Int] {
//   	return plus([i], js);
//   }
//   
//   function plus(is:[Int], j:Int):[Int] {
//   	return plus(is, [j]);
//   }
// 
//   function plus(is:[Int], js:[Int]):[Int] {
//   	var r : [Int];
//   	for(i in is){
//   		for (j in js){
//   			r.add(i+j);
//   		}
//   	}
//   	return r;
//   }
// 
// section math eipressions : minus int
// 
//   function minus(i:Int, j:Int):Int {
//   	return if(i != null && j != null) i-j else null;
//   }
//   
//   function minus(i:Int, js:[Int]):[Int] {
//   	return minus([i], js);
//   }
//   
//   function minus(is:[Int], j:Int):[Int] {
//   	return minus(is, [j]);
//   }
// 
//   function minus(is:[Int], js:[Int]):[Int] {
//   	var r : [Int];
//   	for(i in is){
//   		for (j in js){
//   			r.add(i-j);
//   		}
//   	}
//   	return r;
//   }
// 
// section math eipressions : mul int
// 
//   function mul(i:Int, j:Int):Int {
//   	return if(i != null && j != null) i*j else null;
//   }
//   
//   function mul(i:Int, js:[Int]):[Int] {
//   	return mul([i], js);
//   }
//   
//   function mul(is:[Int], j:Int):[Int] {
//   	return mul(is, [j]);
//   }
// 
//   function mul(is:[Int], js:[Int]):[Int] {
//   	var r : [Int];
//   	for(i in is){
//   		for (j in js){
//   			r.add(i*j);
//   		}
//   	}
//   	return r;
//   }
// 
// section math eipressions : mod int
// 
//   function mod(i:Int, j:Int):Int {
//   	return if(i != null && j != null && j != 0) i%j else null;
//   }
//   
//   function mod(i:Int, js:[Int]):[Int] {
//   	return mod([i], js);
//   }
//   
//   function mod(is:[Int], j:Int):[Int] {
//   	return mod(is, [j]);
//   }
// 
//   function mod(is:[Int], js:[Int]):[Int] {
//   	var r : [Int];
//   	for(i in is){
//   		for (j in js){
//   			if(j != 0){
//   				r.add(i%j);
//   			}
//   		}
//   	}
//   	return r;
//   }
// 
// section math expressions : div int
// 
//   function div(i:Int, j:Int):Int {
//   	return if(i != null && j != null && j != 0) i/j else null;
//   }
//   
//   function div(i:Int, js:[Int]):[Int] {
//   	return div([i], js);
//   }
//   
//   function div(is:[Int], j:Int):[Int] {
//   	return div(is, [j]);
//   }
// 
//   function div(is:[Int], js:[Int]):[Int] {
//   	var r : [Int];
//   	for(i in is){
//   		for (j in js){
//   			if(j != 0){
//   				r.add(i/j);
//   			}
//   		}
//   	}
//   	return r;
//   }
// 
// section aggregation expressions
// 
//   function avg(is:[Int]):Int {
//   	if(is.length==0){return null;}
//   	return sum(is) / is.length;
//   }
//   
//   function sum(is:[Int]):Int {
//   	var sum : Int := 0;
//   	for(i in is){
//   		sum := sum + i;
//   	}
//   	return sum;
//   }
//   
//   function max(is:[Int]):Int {
//   	if(is.length==0){return null;}
//   	var max : Int := -2147483648;
//   	for(i in is){
//   		if(max < i){
//   			max := i;
//   		}
//   	}
//   	return max;
//   }
// 
//   function min(is:[Int]):Int {
//   	if(is.length==0){return null;}
//   	var min : Int := 2147483647;
//   	for(i in is){
//   		if(min > i){
//   			min := i;
//   		}
//   	}
//   	return min;
//   }
//   
//   function conj(is:[Bool]):Bool {
//   	if(is.length==0){return null;}
//   	for(i in is){
// 			if(!i){
// 				return false;
// 			}
//   	}
//   	return true;
//   }
//   
//   function disj(is:[Bool]):Bool {
//   	if(is.length==0){return null;}
//   	for(i in is){
// 			if(i){
// 				return true;
// 			}
//   	}
//   	return false;
//   }
//   
//   function concat(is:[String]):String {
//   	var r := "";
//   	for(i in is){
// 			r := r + i;
//   	}
//   	return r;
//   }
//   
//   function count(i:Object):Int {
//   	return if(i==null) 0 else 1;
//   }
//   
//   // function count(i:Object):Int {
//   // 	return if(i==null) 0 else 1;
//   // }
//   // 
//   // function count(is:[Object]):Int {
//   // 	return is.length;
//   // }
// 
// section logic expressions
// 
//   function not(i:Bool):Bool {
//   	return if(i != null) !i else null;
//   }
//   
//   function lt(i:Int, j:Int):Bool {
//   	return if(i != null && j != null) i<j else null;
//   }
//   
//   function lte(i:Int, j:Int):Bool {
//   	return if(i != null && j != null) i<=j else null;
//   }
//   
//   function gt(i:Int, j:Int):Bool {
//   	return if(i != null && j != null) i>j else null;
//   }
//   
//   function gte(i:Int, j:Int):Bool {
//   	return if(i != null && j != null) i>=j else null;
//   }
//   
//   function and(i:Bool, j:Bool):Bool {
//   	return if(i != null && j != null) i&&j else null;
//   }
//   
//   function or(i:Bool, j:Bool):Bool {
//   	return if(i != null && j != null) i||j else null;
//   }
// 
// section logic expresions : equality
// 
//   function eq(i:Object, j:Object):Bool {
//   	return if(i != null && j != null) i==j else null;
//   }
// 
//   function eq(i:Object, js:[Object]):Bool {
//   	return eq([i], js);
//   }
// 
//   function eq(is:[Object], j:Object):Bool {
//   	return eq(is, [j]);
//   }
//   
//   function eq(is:[Object], js:[Object]):Bool {
//   	return is==js;
//   }
// 
//   function neq(i:Object, j:Object):Bool {
//   	return if(i != null && j != null) i!=j else null;
//   }
// 
//   function neq(i:Object, js:[Object]):Bool {
//   	return neq([i], js);
//   }
// 
//   function neq(is:[Object], j:Object):Bool {
//   	return neq(is, [j]);
//   }
//   
//   function neq(is:[Object], js:[Object]):Bool {
//   	return is!=js;
//   }
// 
// section conditional (no shorcut evaluation)
// 
//   function cond(b:Bool,i:Object,j:Object):Object{
//   	if(b!=null){
// 			if(b){
// 				return i;
// 			}else{
// 				return j;
// 			}
//   	}
//   	return null;
//   }
// 
//   function cond(b:Bool,i:Object,js:[Object]):[Object]{
//   	if(b!=null){
// 			if(b){
// 				if(i!=null){
// 					return [i];
// 				}
// 			}else{
// 				return js;
// 			}
//   	}
//   	var empty : [Object];
//   	return empty;
//   }
// 
//   function cond(b:Bool,is:[Object],j:Object):[Object]{
//   	if(b!=null){
// 			if(b){
// 				return is;
// 			}else{
// 				if(j!=null){
// 					return [j];
// 				}
// 			}
//   	}
//   	var empty : [Object];
//   	return empty;
//   }
// 
//   function cond(b:Bool,is:[Object],js:[Object]):[Object]{
//   	if(b!=null){
// 			if(b){
// 				return is;
// 			}else{
// 				return js;
// 			}
//   	}
//   	var empty : [Object];
//   	return empty;
//   }