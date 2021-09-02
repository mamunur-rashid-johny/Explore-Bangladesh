<?php

namespace App\Http\Controllers;

use App\Models\ZipCodeModel;
use App\Http\System\AbstractModelPattern;
use App\Http\System\DataPatternInterface;

class ZipCodeController implements DataPatternInterface
{
   public function __construct()
   {
      // TODO: Implement __construct() method
   }

   public static function getJson(): AbstractModelPattern
   {
      $object = new ZipCodeModel();
      return (new self)->$object->extractAll();
   }

   public static function getData(): AbstractModelPattern
   {
      $object = new ZipCodeModel();
      return (new self)->$object->extractAll();
   }
}
