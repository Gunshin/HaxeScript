package;

import cs.internal.HxObject;
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
	function Invoke(a:T):Void;
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
	
	public function AddFunction<T>(name_:String, func_:Action_1<T>):Void
	{
		interp.variables[name_] = function(s) func_.Invoke(s);
	}
	
	public function Run():Void
	{
		interp.execute(cScript);
	}
}

