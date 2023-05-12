<?php
    session_start();
    session_destroy();
    header("location:index.php?c=Documento&m=login");