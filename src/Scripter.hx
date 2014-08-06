package;

import cs.internal.Function.Closure;
import haxe.Log;
import hscript.Expr;
import hscript.Interp;
import hscript.Parser;

import sys.io.FileInput;
import sys.io.File;
import sys.FileSystem;

@:native("System.Action")
extern class Action_0
{
	function Invoke():Void;
}

@:native("System.Action")
extern class Action_1<T>
{
	function Invoke(t:T):Void;
}

@:native("System.Action")
extern class Action_2<T, U>
{
	function Invoke(t:T, u:U):Void;
}

@:native("System.Action")
extern class Action_3<T, U, V>
{
	function Invoke(t:T, u:U, v:V):Void;
}

@:native("System.Action")
extern class Action_4<T, U, V, W>
{
	function Invoke(t:T, u:U, v:V, w:W):Void;
}

/*@:native("System.Action")
extern class Action_5<T, U, V, W, X>
{
	function Invoke(t:T, u:U, v:V, w:W, x:X):Void;
}*/

/**
 * ...
 * @author Michael Stephens
 */
class Scripter 
{
	var interp:Interp;
	
	var cScript:Expr;
	
	public function new(path_:String) 
	{
		var parser = new Parser();
		
		interp = new Interp();
		
		cScript = parser.parseString(File.getContent(path_));
	}
	
	public function Funky(name_:String, func_:Closure):Void
	{
		interp.variables[name_] = func_;
	}
	
	public function AddVariable<T>(name_:String, variable_:T)
	{
		interp.variables[name_] = variable_;
	}
	
	public function AddFunction(name_:String, func_:Action_0):Void
	{
		interp.variables[name_] = function() func_.Invoke();
	}
	
	public function AddFunction1<T>(name_:String, func_:Action_1<T>):Void
	{
		interp.variables[name_] = function(t) func_.Invoke(t);
	}
	
	public function AddFunction2<T, U>(name_:String, func_:Action_2<T, U>):Void
	{
		interp.variables[name_] = function(t, u) func_.Invoke(t, u);
	}
	
	public function AddFunction3<T, U, V>(name_:String, func_:Action_3<T, U, V>):Void
	{
		interp.variables[name_] = function(t, u, v) func_.Invoke(t, u, v);
	}
	
	public function AddFunction4<T, U, V, W>(name_:String, func_:Action_4<T, U, V, W>):Void
	{
		interp.variables[name_] = function(t, u, v, w) func_.Invoke(t, u, v, w);
	}
	
	/*public function AddFunction5<T, U, V, W, X>(name_:String, func_:Action_5<T, U, V, W, X>):Void
	{
		interp.variables[name_] = function(t, u, v, w, x) func_.Invoke(t, u, v, w, x);
	}*/
	
	public function Run():Void
	{
		interp.execute(cScript);
	}
}

