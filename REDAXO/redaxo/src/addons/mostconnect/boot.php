<?php
// Include any necessary files here
require_once __DIR__ . '/functions/functions.php';

// Add your function to the global function pool
rex_extension::register('PACKAGES_INCLUDED', function ($params) {
    if (rex::isBackend() && rex::getUser()) {
        if (!function_exists('getHierarchicalVar')) {
            function getHierarchicalVar() {
                rex_view::output('getHierarchicalVar is not defined.');
            }
        }
    }
});