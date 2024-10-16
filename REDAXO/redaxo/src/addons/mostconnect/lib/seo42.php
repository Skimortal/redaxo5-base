<?php
class seo42
{
    public static function getImageFile($file) {
        return '/..'.rex_addon::get('project')->getAssetsUrl('images/'.$file);
    }
    public static function getJSFile() {
    }
    public static function getIconFile($file) {
        return '/..'.rex_addon::get('project')->getAssetsUrl('icons/'.$file);
    }
    public static function getImageManagerFile($image, $type) {
        return rex_media_manager::getUrl($type, $image);
    }
    public static function getLangTags() {
        return "";
    }
    public static function getCombinedCSSFile() {
        // return rex_yrewrite::get
    }
    public static function getValue($value) {
        // return rex_yrewrite::get($value);
    }

    public static function getUrl($id) {
        return rex_yrewrite::getFullUrlByArticleId($id);
    }

    public static function getTitle() {
        $rex_yrewrite_seo = new rex_yrewrite_seo();
        return $rex_yrewrite_seo->getTitle();
    }
    public static function getFullUrl($articleId) {
        return rex_yrewrite::getFullUrlByArticleId($articleId);
    }
}
