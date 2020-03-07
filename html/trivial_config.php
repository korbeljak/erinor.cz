<?php
/**
 * @file svjcore_config.php
 * 
 * This is an installed file of Trivial system.
 * 
 * @note This file can be modified to suit your needs or to simply run
 * multiple projects from the same core.
 * 
 */

/**
 * Directory Separator. (Do not change me.)
 * @var DS 
 */
define('DS', DIRECTORY_SEPARATOR);

/**
 * Trivial Path.
 * @var CFG_TRIVIAL_PATH
 */
define('CFG_TRIVIAL_PATH', __DIR__.DS."..".DS."..".DS."trivial");

/**
 * Default e-mail to send logs to.
 * @var CFG_LOG_EMAIL
 */
define('CFG_LOG_EMAIL', "korbel.jak@gmail.com");

/**
 * Default log file.
 * 
 * @var CFG_LOG_FILE
 */
define('CFG_LOG_FILE', __DIR__.DS."log".DS."trivial.log");

/**
 * Default Theme name.
 * @var CFG_DEFAULT_THEME_NAME
 */
define('CFG_DEFAULT_ASSET_PATH', __DIR__.DS."assets");

/**
 * Default template path.
 * @var CFG_TEMPLATE_PATH
 */
define('CFG_TEMPLATE_PATH', CFG_DEFAULT_ASSET_PATH.DS."template");

/**
 * Default Theme name.
 * @var CFG_DEFAULT_THEME_NAME
 */
define('CFG_DEFAULT_THEME_NAME', "main");

/**
 * Path to the product root directory.
 * 
 * @var PRODUCT_ROOT_PATH
 */
define('PRODUCT_ROOT_PATH', __DIR__);

/**
 * If run in debugging mode.
 * 
 * @var CFG_IS_DEBUGGING
 */
define('CFG_IS_DEBUGGING', false);

// SITE CONFIG =================================================================

/**
 * Default Site Title.
 * @var CFG_SITE_DEFAULT_TITLE
 */
define('CFG_SITE_DEFAULT_TITLE', "Stránky LARPu Erinor (pořádané skupinou Pilirion)");

/**
 * Default Site Description.
 * @var CFG_SITE_DEFAULT_DESCRIPTION
 */
define('CFG_SITE_DEFAULT_DESCRIPTION', "Stránky LARPu Erinor");

/**
 * Default Site Keywords.
 * @var CFG_SITE_DEFAULT_KEYWORDS
 */
define('CFG_SITE_DEFAULT_KEYWORDS', "larp,erinor,fantasy,dřevárny,roleplay");

/**
 * Default Theme path - concatenation of theme name and template path.
 * @var CFG_SITE_DEFAULT_THEME_PATH
 */
define('CFG_SITE_DEFAULT_THEME_PATH', CFG_TEMPLATE_PATH.DS."main");

// SITE CONFIG END =============================================================

// Here go autoloaders.
    // User defined first.
function Erinor_Autoload(string $className)
{
    $fileName = __DIR__.DS."src".DS.str_replace("\\", "/", $className).".php";
    if (file_exists($fileName))
    {
        require $fileName;
    }
}

spl_autoload_register("Erinor_Autoload");
    // Core's autoloader next.
require CFG_TRIVIAL_PATH.DS.'autoloader.php';

// Here go the routes / routing rules.

\Core\Router::GetDefaultRouter()->AddRule("/^$/", '\Erinor\Controller\Index::MainRoute');
\Core\Router::GetDefaultRouter()->AddRule("/^(?P<ca>[\w-]+)\/?$/", '\Erinor\Controller\Index::MainRoute');
\Core\Router::GetDefaultRouter()->AddRule("/^(?P<ca>[\w-]+)\/(?P<sc>[\w-]+)\/?$/", '\Erinor\Controller\Index::MainRoute');

