<?php 

namespace App\Http\Core;

use PDO;

class Database
{
   private static $instance;
   private static $driver;
   private static $host;
   private static $database;
   private static $charset;
   private static $username;
   private static $password;
   private static $dataServerName;
   private static $connect;

   private function __construct()
   {
      if (!self::$instance) {
         echo 'Connection established successfully' . PHP_EOL;
         return self::$instance = $this;
      } else {
         echo 'Connection is already existed' . PHP_EOL;
         return self::$instance;
      }
   }

   private static function configure()
   {
      self::$driver   = 'mysql';
      self::$host     = 'localhost';
      self::$database = 'xpeedstudio';
      self::$charset  = 'utf8mb4';
      self::$username = 'root';
      self::$password = '';

      self::$dataServerName = '' . self::$driver . ':host=' . self::$host . ';dbname=' . self::$database . ';charset=' . self::$charset . '';
      return self::$dataServerName;
   }

   public static function connection()
   {
      try {
         self::$connect = new PDO(self::configure(), self::$username, self::$password);
         self::$connect->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
         self::$connect->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);

         return self::$connect;
      } catch (\PDOException $e) {
         return 'Connection error: ' . $e->getMessage();
      }
   }
}