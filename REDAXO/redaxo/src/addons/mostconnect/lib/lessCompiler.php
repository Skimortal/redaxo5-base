<?php

/**
 * @package redaxo\project
 */
class rex_less_compiler
{

    /**
     * @return void
     * @throws Exception
     */
    public static function compile($lessFiles)
    {
        $less = new lessc();
        foreach ($lessFiles as $fileName => $lessFile) {
            $outputFile = rex_addon::get('project')->getAssetsPath('css/'.$fileName.'.css');
            unlink($outputFile);
            $less->compileFile($lessFile, $outputFile);
        }
    }
}
