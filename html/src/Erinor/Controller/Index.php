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
        
        if (isset($args['ss']))
        {
            $properties["ss"] = $args['ss'];
        }
        
        $page = new \Core\Page($title,
                               $description,
                               $keywords,
                               "main",
                               null,null,null,
                               $properties);

        $page->Render();
    }
}