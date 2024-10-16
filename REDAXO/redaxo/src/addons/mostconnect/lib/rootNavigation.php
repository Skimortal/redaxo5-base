<?php

class RootNavigation {

    /**
     * @param rex_category $cat
     * @param int $depth
     * @return mixed
     */
    public static function checkMetadata($cat, $depth) {
        return $cat->getValue('cat_hide_navigation') != "|true|";
    }
}