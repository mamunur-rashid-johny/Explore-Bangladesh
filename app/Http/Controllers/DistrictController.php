<?php

namespace App\Http\Controllers;

use App\Models\DistrictModel;
use App\Http\System\AbstractModelPattern;
use App\Http\System\DataPatternInterface;

class DistrictController implements DataPatternInterface
{
   public function __construct()
   {
      // TODO: Implement __construct() method
   }

   public static function getJson(): AbstractModelPattern
   {
      $object = (new DistrictModel());
      return (new self)->$object->extractAll();
   }

   public static function getData(): AbstractModelPattern
   {
      $object = (new DistrictModel());
      return (new self)->$object->extractAll();
   }
}
