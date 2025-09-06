package options;

class KadeEngineMode extends BaseOptionsMenu
{
    public function new()
    {
        title = 'Kade Engine Mode';
        rpcTitle = 'Kade Engine Mode Menu';

        var option:Option = new Option('KE Mode', //Name
        'If checked, Kade Engine Mode is Starting', //Description
        'kadeEngineMode', //Save data variable name
        'bool'); //Variable type
        addOption(option);

        super();
    }
}