<?php

namespace App\Http\System;

abstract class AbstractModelPattern
{
   abstract protected function extractAll();
   abstract protected function extractParent();
   abstract protected function extractID();
}
