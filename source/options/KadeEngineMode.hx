package options;

class KadeEngineMode extends BaseOptionsMenu
{
    public var kadeArray:Array<Option> = [];

        // 明日修复

    public function new()
    {
        title = 'Kade Engine Mode Settings';
        rpcTitle = 'Kade Engine Mode Menu';

        var option:Option = new Option('KE Mode', //Name
        'If checked, Kade Engine Mode is Starting', //Description
        'kadeEngineMode', //Save data variable name
        'bool'); //Variable type
        addOption(option);
        option.onChange = kEModeStart;

        var option:Option = new Option('nps Display', //Name
        'If checked, Nps UI is Visible', //Description
        'npsDisplay', //Save data variable name
        'bool'); //Variable type
        addOption(option);
        kadeArray.push(option);

        var option:Option = new Option('healthBar Color KE', //Name
        'If checked, healthBar Color is Red and Green', //Description
        'healthBarColor', //Save data variable name
        'bool'); //Variable type
        addOption(option);
        kadeArray.push(option);

        /*if (!ClientPrefs.data.kadeEngineMode)
        {
            for (i in 0...kadeArray.length)
            {
                //grpOptions[i].visible = false;
                optionsArray.remove(kadeArray[i]);
            }
        }*/

        super();
    }

    private function kEModeStart()
    {
        // Kade Engine Mode
        if (curOption.name == "KE Mode" && ClientPrefs.data.kadeEngineMode)
        {
            ClientPrefs.data.framerate = 120;
        }
        else if (curOption.name == "KE Mode" && !ClientPrefs.data.kadeEngineMode)
        {
            ClientPrefs.data.framerate = 60;
        }

        if(ClientPrefs.data.framerate > FlxG.drawFramerate)
        {
            FlxG.updateFramerate = ClientPrefs.data.framerate;
            FlxG.drawFramerate = ClientPrefs.data.framerate;
        }
        else
        {
            FlxG.drawFramerate = ClientPrefs.data.framerate;
            FlxG.updateFramerate = ClientPrefs.data.framerate;
        }
    }

    /*override function update(elapsed:Float)
    {
        super.update(elapsed);

        if (ClientPrefs.data.kadeEngineMode)
        {
            if (optionsArray[1] == null)
            {
                for (i in 0...kadeArray.length)
                {
                    var e = i + 1;

                    optionsArray.push(kadeArray[i]);

                    for (item in grpOptions.members)
                    {
                        if (item.ID == e)
                        {
                            item.visible = true;
                        }
                    }
                    for (item in checkboxGroup.members)
                    {
                        if (item.ID == e)
                        {
                            item.visible = true;
                        }
                    }
                }
            }
        }
        else
        {
            if (optionsArray[1] != null)
            {
                for (i in 0...kadeArray.length)
                {
                    var e = i + 1;

                    optionsArray.remove(kadeArray[i]);

                    for (item in grpOptions.members)
                    {
                        if (item.ID == e)
                        {
                            item.visible = false;
                        }
                    }
                    for (item in checkboxGroup.members)
                    {
                        if (item.ID == e)
                        {
                            item.visible = false;
                        }
                    }
                }
            }
        }
    }*/
}