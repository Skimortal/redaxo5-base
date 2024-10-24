<?php
header("Content-Type: text/html; charset=utf-8");

$ssa = rex_article::getSiteStartArticle();
$article = rex_article::get($this->getValue("article_id"));

$isSsa = $ssa->getId() == $article->getId();

$headerImages = array_filter(explode(",", getHierarchicalVar("art_header_images", $article, $ssa)));
$headerType = $article->getValue("art_header_type");
$headerText = $article->getValue("art_header_text");
$headerTheme = $article->getValue("art_header_theme");

$cssFiles = array();
$cssFiles['main'] = rex_addon::get('mostconnect')->getPath('assets/css/main.less');

rex_less_compiler::compile($cssFiles);

$project = rex_addon::get('mostconnect');
?>
<!DOCTYPE html>
<html lang="<?php echo rex_clang::getCurrent()->getCode(); ?>">
<head>
    <meta charset="utf-8" />
    <?php
    $seo = new rex_yrewrite_seo();
    echo $seo->getTags();
    ?>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <?php foreach($cssFiles as $cssFile => $lessFile) { ?>
        <link href="/..<?php echo $project->getAssetsUrl('css/'.$cssFile.'.css'); ?>" rel="stylesheet">
    <?php } ?>
    <?php echo seo42::getLangTags(); ?>
</head>

<body id="body">
<header id="navigation" class="navbar-fixed-top">
    <nav class="collapse navbar-collapse navbar-right" role="navigation">
        <?php
        $nav = new rex_nav();
        $nav->setShowAll(false);
        $nav->setListId('nav', 1);
        $nav->setListClass('nav navbar-nav', 1);
        $nav->setLevelCount(1);
        $nav->addCallback('RootNavigation::checkMetadata');
        echo $nav->getNavigation();
        ?>
    </nav>
</header>

<main class="mainContainer">
    REX_ARTICLE[]
    <?php
    /**
    // Output Slices/Content
    $slices = getSections($article);
    if(!$slices) {
        $slices = getAllSlices($article);
    }
    $out = '';
    foreach ($slices as $slice) {
        if($slice->getModuleId() != 79) {
            $out .= $slice->getSlice();
        }
    }
    print $out;
     */
    ?>
</main>

<footer id="footer">
</footer>

<script src="/..<?php echo $project->getAssetsUrl('js/main.js'); ?>"></script>
</body>
</html>