package;

import cs.Lib;
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
	
	public function AddVariable<T>(name_:String, variable_:T)
	{
		interp.variables[name_] = variable_;
	}
	
	public function AddFunction<T>(name_:String, func_:cs.system.Func_1<T>):Void
	{
		interp.variables[name_] = function() return func_.Invoke();
	}
	
	public function AddFunction1<T, U>(name_:String, func_:cs.system.Func_2<T, U>):Void
	{
		interp.variables[name_] = function(t) return func_.Invoke(t);
	}
	
	public function AddFunction2<T, U, V>(name_:String, func_:cs.system.Func_3<T, U, V>):Void
	{
		interp.variables[name_] = function(t, u) return func_.Invoke(t, u);
	}
	
	public function AddFunction3<T, U, V, W>(name_:String, func_:cs.system.Func_4<T, U, V, W>):Void
	{
		interp.variables[name_] = function(t, u, v) return func_.Invoke(t, u, v);
	}
	
	public function AddFunction4<T, U, V, W, X>(name_:String, func_:cs.system.Func_5<T, U, V, W, X>):Void
	{
		interp.variables[name_] = function(t, u, v, w) return func_.Invoke(t, u, v, w);
	}
	
	public function AddAction(name_:String, func_:Action_0):Void
	{
		interp.variables[name_] = function() func_.Invoke();
	}
	
	public function AddAction1<T>(name_:String, func_:cs.system.Action_1<T>):Void
	{
		interp.variables[name_] = function(t) func_.Invoke(t);
	}
	
	public function AddAction2<T, U>(name_:String, func_:cs.system.Action_2<T, U>):Void
	{
		interp.variables[name_] = function(t, u) func_.Invoke(t, u);
	}
	
	public function AddAction3<T, U, V>(name_:String, func_:cs.system.Action_3<T, U, V>):Void
	{
		interp.variables[name_] = function(t, u, v) func_.Invoke(t, u, v);
	}
	
	public function AddAction4<T, U, V, W>(name_:String, func_:cs.system.Action_4<T, U, V, W>):Void
	{
		interp.variables[name_] = function(t, u, v, w) func_.Invoke(t, u, v, w);
	}
	
	public function Run():Void
	{
		interp.execute(cScript);
	}
}

