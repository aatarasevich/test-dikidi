<?php
$current_dir = isset($_GET['dir']) ? $_GET['dir'] : '.';

$current_dir = realpath($current_dir);
$root_dir = realpath('.');

if (strpos($current_dir, $root_dir) === 0) {
    $items = scandir($current_dir);

//    var_dump($items);
    $dir_items = array_filter($items, function($item) use ($current_dir) {
        $full_path = $current_dir . DIRECTORY_SEPARATOR . $item;
        return (is_dir($full_path) || is_file($full_path) && in_array(strtolower(pathinfo($item, PATHINFO_EXTENSION)), array('jpg', 'jpeg', 'png', 'gif')));
    });

    echo "<h1>FManager</h1> ";
    echo "<p>Current dir: $current_dir</p>";
    echo "<ul>";
    foreach ($dir_items as $item) {
        $full_path = $current_dir . DIRECTORY_SEPARATOR . $item;
        if ($item == '.') {
            continue;
        } elseif ($item == '..') {
            $full_path_2 = $current_dir . DIRECTORY_SEPARATOR;

            if ($current_dir == $root_dir) {
                echo "<li><a href=\"?dir=$root_dir\">home</a></li>";
                continue;
            }
            echo "<li><a href=\"?dir=$full_path\">back</a></li>";
        }
            if (is_dir($full_path)) {
            echo "<li><a href=\"?dir=$full_path\">$item/</a></li>";
        } else {
            echo "<li><img src=\"$full_path\" alt=\"$item\" style=\"max-width: 100px; max-height: 100px;\"></li>";
        }
    }
    echo "</ul>";


} else {
    echo 'Access denied';
    echo "<a href=\"?dir=$root_dir\">return back</a>";
}
