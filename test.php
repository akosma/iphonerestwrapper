<?php
header("Content-type: text/plain");
$method = $_SERVER['REQUEST_METHOD'];
echo("METHOD = {$method}\n");

if ($method == "GET" || $method == "DELETE")
{
    if ($_GET['parameter'])
    {
        echo("parameter = {$_GET['parameter']}\n");
    }
}
else if ($method == "POST")
{
    if ($_POST['parameter'])
    {
        echo("parameter = {$_POST['parameter']}\n");    
    }
}
else if ($method == "PUT")
{
    parse_str(file_get_contents("php://input"), $parameters);
    if ($parameters['parameter'])
    {
        echo("parameter = {$parameters['parameter']}\n");
    }
}
