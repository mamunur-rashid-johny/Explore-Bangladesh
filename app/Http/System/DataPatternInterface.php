<?php 

namespace App\Http\System;

use App\Http\System\AbstractModelPattern;

interface DataPatternInterface
{
   public static function getJson(): AbstractModelPattern;
   public static function getData(): AbstractModelPattern;
}