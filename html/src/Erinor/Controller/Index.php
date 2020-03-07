<?php namespace Erinor\Controller;

class Index
{
    private static function GetPageAndMenu($args)
    {
        $retArr = array("page" => 'pages/uvod.page.php',
            "menu" => 'menus/uvod.menu.php');

        if (isset($args['ca']))
        {
            $pfTmp = 'pages/'.$args['ca'];
            $mfTmp = 'menus/'.$args['ca'];
            if (isset($args['sc']))
            {
                $pfTmp .= '/'.$args['sc'];
            }
            
            $pfTmp .= '.page.php';
            $mfTmp .= '.menu.php';
            
            if (is_file($pfTmp))
            {
                $retArr["page"] = $pfTmp;
            }
            if (is_file($mfTmp))
            {
                $retArr["menu"] = $mfTmp;
            }
        }
        
        return $retArr;
    }
    
    
    public static function MainRoute($args)
    {
        $pm = self::GetPageAndMenu($args);
        
        // var_dump($pm);
        
        $meta = file_get_contents ($pm["page"], null, null, null, 512);
        $title = "";
        $description = "";
        $keywords = array();
        $t = "";
        if(preg_match("/title\s*=\s*\"([^\"]*)\";/im", $meta, $t))
        {
            $title = $t[1];
        }
        if(preg_match("/description\s*=\s*\"([^\"]*)\";/im", $meta, $t))
        {
            $description = $t[1];
        }
        if(preg_match("/keywords\s*=\s*\"([^\"]*)\";/im", $meta, $t))
        {
            $keywords = explode(",", $t[1]);
            foreach ($keywords as $key => $val)
            {
                $keywords[$key] = trim($val);
            }
        }
        
        $properties = array();
        $properties["page"] = $pm["page"];
        $properties["menu"] = $pm["menu"];
        
        $page = new \Core\Page($title,
                               $description,
                               $keywords,
                               "main",
                               null,null,null,
                               $properties);

        $page->Render();
    }
}

class ParsePage
{
    public $separator = "----------";
    protected $source = "";
    
    public $meta = "";
    public $page = "";
    
    public $title = ""; // Default values.
    public $description = ""; // Default values.
    public $keywords = ""; // Default values.
    
    protected $chyby;
    
    public function __construct($source)
    {
        if (is_file($source))
        {
            $this->source = file_get_contents($source);
        }
        else
        {
            $this->chyby[] = "Zdrojový soubor nemohl být načten";
        }
    }
    public function splitPage()
    {
        if (preg_match("/".preg_quote($this->separator)."/", $this->source))
        {
            $page_part = explode($this->separator, $this->source);
            $this->meta = $page_part[0];
            $this->page = $page_part[1];
        }
        else
        {
            $this->varovani[] = "Soubor nemá uvedené žádné metainformace";
            $this->meta = "";
            $this->page = $this->source;
        }
    }
    public function extractMeta()
    {
        if ($this->meta != "")
        {
            if(preg_match("/title\s*=\s*\"([^\"]*)\";/im", $this->meta, $t)) $this->title = $t[1];
            if(preg_match("/description\s*=\s*\"([^\"]*)\";/im", $this->meta, $d)) $this->description = $d[1];
            if(preg_match("/keywords\s*=\s*\"([^\"]*)\";/im", $this->meta, $k)) $this->keywords = $k[1];
        }
        else $this->varovani[] = "Soubor nemá uvedené žádné metainformace - není co extrahovat";
    }
}

if (isset($_GET['ca'])
    && !isset($_GET['sc'])
    && !empty($_GET['ca'])
    && is_file('pages/'.$_GET['ca'].'.page.php'))
{
    $source = 'pages/'.$_GET['ca'].'.page.php';
}
elseif (isset($_GET['ca'])
    && isset($_GET['sc'])
    && !empty($_GET['ca'])
    && !empty($_GET['sc'])
    && is_file('pages/'.$_GET['ca'].'/'.$_GET['sc'].'.page.php'))
{
    $source = 'pages/'.$_GET['ca'].'/'.$_GET['sc'].'.page.php';
}
else
{
    $source = 'pages/uvod.page.php';
}

/*MENU*/

if (isset($_GET['ca'])
    && !empty($_GET['ca'])
    && is_file('menus/'.$_GET['ca'].'.menu.php'))
{
    $menu = 'menus/'.$_GET['ca'].'.menu.php';
}
else
{
    $menu = 'menus/uvod.menu.php';
}

/*ASSIGN*/

$pg = new ParsePage($source);
$pg->title = "Stránky LARPu Erinor (pořádané skupinou Pilirion)";
$pg->keywords = "larp, erinor, fantasy, dřevárny, roleplay";
$pg->description = "Stránky LARPu Erinor";
$pg->splitPage();
$pg->extractMeta();
$title = $pg->title;
$keywords = $pg->keywords;
$description = $pg->description;
$contents = $pg->page;
$tmpfname = tempnam(sys_get_temp_dir(), "t");
$l = fopen($tmpfname, "w");
fwrite($l, $contents);
fclose($l);
?>