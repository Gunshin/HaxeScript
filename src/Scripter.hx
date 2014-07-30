package;

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
	
	var scriptVars:Map<String, Dynamic>;

	public function new(path_:String) 
	{
		var parser = new Parser();
		
		interp = new Interp();
		
		//cScript = parser.parseString(File.getContent(path_));
	}

	/*public function AddFunction(name_:String, func_:Action_0):Void
	{
		//func_.Invoke();
		scriptVars.set(name_, func_);
	}*/
	
	public function AddFunction(name_:String, func_:cs.system.Action_1<String>):Void
	{
		scriptVars.set(name_, func_.AsDelegate());
	}
	
	public function Run():Void
	{
		interp.variables = scriptVars;
		
		interp.execute(cScript);
	}
}

