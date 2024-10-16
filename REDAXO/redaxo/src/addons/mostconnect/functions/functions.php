<?php
function convertTextile($text) {
    $text = str_replace("<br>","",$text?$text:'');
    return FriendsOfRedaxo\MarkItUp\MarkItUp::parseOutput ('textile', $text);
}

/**
 * @param string $key
 * @param rex_article $article
 * @param rex_article $ssa
 * @return false|mixed
 */
function getHierarchicalVar($key, $article, $ssa) {
    $var = false;

    $a = $article;
    while ($a!=false) {
        if ($var) {
            break;
        }
        $var = $a->getValue($key);
        $a = $a->getParent();
    }
    if (!$var) {
        $var = $ssa->getValue($key);
    }

    return $var;
}

/**
 * @param rex_article $article
 * @param int $ctype
 * @return rex_article_slice[]
 */
function getSections($article, $ctype = 1) {
    $sections = array();
    $slice = rex_article_slice::getFirstSliceForCtype($ctype, $article->getId());

    if (!$slice) {
        return $sections;
    }
    do {
        if ($slice->getModuleId() == 10) {
            $sections[] = $slice;
        }
    }
    while ($slice = $slice->getNextSlice());

    return $sections;
}

/**
 * @param rex_article $article
 * @param int $ctype
 * @return rex_article_slice[]
 */
function getAllSlices($article, $ctype = 1) {
    $slices = array();
    $slice = rex_article_slice::getFirstSliceForCtype($ctype, $article->getId());

    if (!$slice) {
        return $slices;
    }
    do {
        $slices[] = $slice;
    }
    while ($slice = $slice->getNextSlice());

    return $slices;
}
