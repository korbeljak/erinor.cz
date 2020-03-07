<?php

include "Entity.php";

/**
 * Flat class - represents each of the house's flat.
 *
 * A flat has one or more owners, every owner 
 * has 1 flat as maximum. An owner is a system user.
 *
 * A flat has its number. The number is unique, thus it
 * can be used for indexing without any need to introduce
 * a new ID.
 *
 * A flat has its size, this size is used to count a share.
 *
 * A flat can be found in the national registry. A Registry record
 * can be represented as a string and monthly synchronized.
 *
 */
class Flat implements Entity
{
    /**
     * Constructs a Flat Entity.
     */
    public function __construct()
    {
        $flatNr = \Core\PlainInt("flatNr",
                                 true, // required
                                 "Číslo bytu", // hint
                                 "Číslo bytu (jednotky)", // desc
                                 1, // default
                                 1, // min - first flat number
                                 21); // max - max flat number
        
        $unitShareDividend = \Core\PlainInt("unitShareDividend",
                                            true, // required
                                            "Podíl na vlastnictví domu - čitatel");

        $unitShareDivisor = \Core\PlainInt("unitShareDivisor",
                                           true,
                                           "Podíl na vlastnictví domu - jmenovatel");

        $nationalRegistryStr = \Core\PlainString("nationalRegistryStr", 
                                                 true,
                                                 "Záznam v katastru nemovitostí určený pro synchronizaci");
        
        // I am an Entity, so add my members dynamically.
        $this->AddAttribute($flatNr);
        $this->AddAttribute($unitShareDividend);
        $this->AddAttribute($unitShareDivisor);
        $this->AddAttribute($nationalRegistryStr);
    }

    public function GetHtmlForm($type)
    {
        switch ($type)
        {
            case Entity::FORM_TYPE_ADD:
                break;
            case Entity::FORM_TYPE_EDIT:
                break;
            case Entity::FOTM_TYPE_DELETE:
                break;
            default:
                // Log error.
                break;
        }
        
    }
    
    public function GetJsValidation($type)
    {
        switch ($type)
        {
            case Entity::FORM_TYPE_ADD:
                break;
            case Entity::FORM_TYPE_EDIT:
                break;
            case Entity::FOTM_TYPE_DELETE:
                break;
            default:
                // Log error.
                break;
        }
        
    }
    
    public function Validate()
    {
        
    }
    
    public function Save()
    {
        
    }
    
    public function Load()
    {
        
    }
    
    public function GetById()
    {
        
    }
    
    public static function Install()
    {
        $rClass = new \ReflectionClass($this);
        $sql = "CREATE TABLE ".$rClass->getName();
        
    }
}
