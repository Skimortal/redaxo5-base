<?php


if (rex::isBackend() && rex::getUser()) {
	if (rex_be_controller::getCurrentPage() == 'capacity') {
		rex_view::addJsFile($this->getAssetsUrl('d3.v3.js'));
	}
}





