package backend;

import haxe.Json;
import haxe.format.JsonParser;
import haxe.io.Bytes;
import openfl.net.FileReference;
import sys.io.File;

class FileSave
{
	public static function saveContent(path:String, json:Dynamic, parts:Array<String>)
	{
		json = haxe.Json.stringify(json, "\t");

		// _file = new FileReference();
		// _file.save(data, Name + ".json");

		var currentPath = "assets/";

		for (part in parts)
		{
			currentPath += part + "/";
			if (!sys.FileSystem.exists(currentPath))
			{
				sys.FileSystem.createDirectory(currentPath);
			}
		}

		trace(currentPath);
		trace(path);

		// File.append("assets/stages/" + Type.getClass(FlxG.state) + "/" + Name + ".json");
		File.saveContent(currentPath + path + ".json", json);
	}

	public static function getContent(path:String, ?parts:Array<String>):Dynamic
	{
		if (parts == null)
		{
			var currentPath = "assets/";

			path = currentPath + path + ".json";

			if (sys.FileSystem.exists(path))
			{
				return Json.parse(File.getContent(path));
			}
			else
			{
				throw "File not found: " + path;
			}
		}
		else
		{
			var currentPath = "assets/";

			for (part in parts)
			{
				currentPath += part + "/";
				if (!sys.FileSystem.exists(currentPath))
				{
					sys.FileSystem.createDirectory(currentPath);
				}
			}

			path = currentPath + path + ".json";

			if (sys.FileSystem.exists(path))
			{
				return Json.parse(File.getContent(path));
			}
			else
			{
				throw "File not found: " + path;
			}
		}
	}
}
