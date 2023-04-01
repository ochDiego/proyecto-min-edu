<?php

    class Database
    {
        public static function conectar()
        {
            $dns="mysql:host=" . DB_HOST .";dbname=" . DB_NAME . ";charset=" . DB_CHARSET;
            $options=[
                PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
                PDO::ATTR_EMULATE_PREPARES => false
            ];
            try {
                $conn=new PDO($dns,DB_USERNAME,DB_PASSWORD,$options);
                return $conn;
            } catch (PDOException $e) {
                echo "ERROR: " . $e->getMessage() . '<br>';
                exit;
            }
        }
    }