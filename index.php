<?php

require_once './vendor/autoload.php';

// TODO: Environment File Config
$dotenv = \Dotenv\Dotenv::createImmutable(__DIR__ . '/../');
$dotenv->load();

