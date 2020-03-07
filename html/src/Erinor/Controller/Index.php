<?php namespace Erinor\Controller;

class Index
{
    
    public static function MainRoute($args)
    {
        \Core\Logger::DebugLog(LOG_INFO,
                       "Hi, I am from Index Controller.",
                       \Core\Logger::O_USER);
        
        var_dump($args);
        
        $page = new \Core\Page("Hlavní stránka",
                               "Hlavní stránka.",
                               array("hlavní stránka"),
                               "main");

        $page->Render();
    }
}