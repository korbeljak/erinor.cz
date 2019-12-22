<?php

/// Gets Winter Solstice day for a given year.
///
/// This date applies to Pilsen, Czech Republic.
function winter_solstice($year)
{
    $dates = array("$year-12-20", "$year-12-21", "$year-12-22");
    $shortest = NULL;
    $day = NULL;
    // Calculate longest night: can be 20, 21, 22 December.
    foreach ($dates as $date)
    {
        $pilsenLatitude = 49.7477831;
        $pilsenLongitude = 13.3783489;
        
        $sunrise = date_sunrise(strtotime($date),
                                SUNFUNCS_RET_DOUBLE,
                                $pilsenLatitude,
                                $pilsenLongitude,
                                90,1);
        
        $sunset = date_sunset(strtotime($date),
                              SUNFUNCS_RET_DOUBLE,
                              $pilsenLatitude,
                              $pilsenLongitude,
                              90,1);
        
        // Calculate time difference:
        $delta = $sunset-$sunrise;
        if ($shortest === NULL)
        {
            $shortest = $delta;
        }
        else
        {
            if ($delta < $shortest)
            {
                $shortest = $delta;
                $day = $date;
            }
        }
    }
    
    return DateTime::createFromFormat("Y-m-d", $day);
}

/// Lithen date computation function - main processing.
///
/// Lithen date is based on real date. New year begins with winter solstice,
/// this is also the 1. day of 1. week of Winter.
///
/// The year has 364 days - 4 seasons 13 weeks each (1 week has 7 days).
function checked_date($realDate, $winterSolsticeDate)
{
    // Jsme za datem Zimního Slunovratu, napočteme tedy dny:
    $days = $realDate->diff($winterSolsticeDate)->format("%a");
    $eyear = $winterSolsticeDate->format("Y") - 575;
    
    $plus10y = DateTime::createFromFormat("Y-m-d", "2011-09-29");
    if ($realDate > $plus10y)
    {
        // Skip The War with elves.
        $eyear += 10;
    }
    
    if ($days > 364)
    {
        return "Jsou dlouhonoční svátky, dny, na jejichž datum si nikdo ani nevzpomene - poslední ozvěny roku ".$eyear;
    }
    elseif ($days == 0)
    {
        return "Je Dlouhonoc! 1. den 1. týdne Zimy roku ".$eyear;
    }
    else
    {
        $seasonstrs = array("Zimy", "Jara", "Léta", "Podzimu");
        $eseason = (int)floor($days / (int)(13*7));
        $eweek = (int)floor(($days % (13*7)) / 7)+1;
        $eday = (int)floor(($days % (13*7)) % 7)+1;
        $kratkonoc = "";
        if ($eseason == 2 && $eweek == 1 && $eday == 1)
        {
            $kratkonoc = "Krátkonoc! ";
        }
        
        return "Je ".$kratkonoc.$eday.". den ".$eweek.". týdne ".$seasonstrs[$eseason]." roku ".$eyear;
    }
}

/// Lithen date computation function - preprocessing.
///
/// Lithen date is based on real date. New year begins with winter solstice,
/// this is also the 1. day of 1. week of Winter.
/// 
/// The year has 364 days - 4 seasons 13 weeks each (1 week has 7 days).
function lithen_date($realDate)
{
    $winterSolsticeDate = winter_solstice($realDate->format("Y"));
    
    if ($realDate >= $winterSolsticeDate)
    {
        return checked_date($realDate, $winterSolsticeDate);
    }
    else
    {
        // Winter solstice was the last year, recompute:
        $winterSolsticeDate = winter_solstice($realDate->format("Y") - 1);
        return checked_date($realDate, $winterSolsticeDate);
    }
}
?> 
