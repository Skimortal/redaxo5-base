<?php




/*working directory*/

chdir('..');





/*base functions*/

function formatBytes($size, $precision = 2){
	$base = log($size, 1024);
	$suffixes = array('B', 'KB', 'MB', 'GB', 'TB');
	return round(pow(1024, $base - floor($base)), $precision) .' '. $suffixes[floor($base)];
}

function folderSize($dir){
	$size = 0;
	foreach (glob(rtrim($dir, '/').'/*', GLOB_NOSORT) as $each) {
		$size += is_file($each) ? filesize($each) : folderSize($each);
	}
	return $size;
}

function dirToArray($dir) {
	$result = array();
	$cdir = scandir($dir);
	foreach ($cdir as $value){
		if (substr($value,0,1) != '.'){
			if (is_dir($dir . DIRECTORY_SEPARATOR . $value)){
				$result[] = array(
					'name' => $value,
					'size' => folderSize($dir . DIRECTORY_SEPARATOR . $value),
					'type' => 'dir',
					'children' => dirToArray($dir . DIRECTORY_SEPARATOR . $value)
				);
			}else{
				$result[] = array(
					'name' => $value,
					'size' => filesize($dir . DIRECTORY_SEPARATOR . $value),
					'type' => 'file'
				);
			}
		}
	}
	return $result;
}






/*run analysis*/

$system = dirToArray('./');





/*add free space*/

array_push($system,array(
	'name' => 'free',
	'type' => 'free',
	'size' => ($this->getConfig('space') - (folderSize(getcwd()) / 1048576)) * 1048576
));
$space = json_encode($system);







/*setup*/

echo rex_view::title($this->i18n('capacity_title_extended'));
$content = $buttons = '';






/*saving*/

if (rex_post('formsubmit', 'string') == '1') {
	$this->setConfig(rex_post('config', [
		['space', 'int'],
		['largedir', 'int'],
		['largefile', 'int']
	]));
}





/*sunburst area*/

$content .= '<div class="sunburst"></div>';







/*styling*/

$content .= '

<style type="text/css">
	.sunburst{
		background: #e0f5ee;
	}
	.sunburst svg{
		width: 100%;
        height: 100%;
        max-height: 100vh;
	}
	.sunburst path{
		stroke: #e0f5ee !important;
	}
	.sunburst path:hover{
		fill: #2e8f75 !important;
	}
	.sunburst path[name="root"]{
		fill: #e0f5ee !important;
	}
	.sunburst path[name="free"]{
		fill: #ffffff !important;
	}
</style>

';





/*sunburst init*/

$content .= '

<script type="text/javascript">
	var flaredata = {
			"name": "root",
			"size": '.($this->getConfig('space') * 1048576).',
			"type": "dir",
			"children": ' . $space . '
	};
</script>

<script>

var width = 1000,
    height = 1000,
    radius = Math.min(width, height) / 2;

var x = d3.scale.linear()
    .range([0, 2 * Math.PI]);

var y = d3.scale.sqrt()
    .range([0, radius]);

var color = d3.scale.category20c();

var svg = d3.select(".sunburst").append("svg")
    .attr("viewBox", "0 0 1000 1000")
    .append("g")
    .attr("transform", "translate(" + width / 2 + "," + (height / 2 + 10) + ") rotate(-90 0 0)");

var partition = d3.layout.partition()
    .value(function (d) {
        return d.size;
    });

var arc = d3.svg.arc()
    .startAngle(function (d) {
        return Math.max(0, Math.min(2 * Math.PI, x(d.x)));
    })
    .endAngle(function (d) {
        return Math.max(0, Math.min(2 * Math.PI, x(d.x + d.dx)));
    })
    .innerRadius(function (d) {
        return Math.max(0, y(d.y));
    })
    .outerRadius(function (d) {
        return Math.max(0, y(d.y + d.dy));
    });

var g = svg.selectAll("g")
    .data(partition.nodes(flaredata))
    .enter().append("g");

var path = g.append("path")
    .attr("d", arc)
    .attr("name", function (d) {
        return (d.name);
    })

    .attr("type", function (d) {
        return (d.type);
    })

    .style("fill", function (d) {
		var p = (d.parent ? d.parent.size : 1);
		var i = d.size;
		var o = i/p;
		if(d.type == "dir" && d.size > '.($this->getConfig('largedir') * 1048576).'){
			return "rgba(38,49,62,1)";
		}else if(d.type == "file" && d.size > '.($this->getConfig('largefile') * 1048576).'){
			return "rgba(217,83,79,1)";
		}else{
			return "rgba(59,181,148,"+(0.5+o/2)+")";
		}
	})

    .on("click", click);

var title = path.append("title")
    .text(function (d) {
        return d.name+\' – \'+(Math.round(d.size/1000000*10)/10)+\'MB\';
    });


function click(d) {
    if(d.size !== undefined) {
        d.size += 1;
    };

    path.transition()
        .duration(500)
        .attrTween("d", arcTween(d))

}

d3.select(self.frameElement).style("height", height + "px");

function arcTween(d) {
    var xd = d3.interpolate(x.domain(), [d.x, d.x + d.dx]),
        yd = d3.interpolate(y.domain(), [d.y, 1]),
        yr = d3.interpolate(y.range(), [d.y ? 20 : 0, radius]);
    return function (d, i) {
        return i ? function (t) {
            return arc(d);
        } : function (t) {
            x.domain(xd(t));
            y.domain(yd(t)).range(yr(t));
            return arc(d);
        };
    };
}
</script>

';




/*inputs*/

$content .= '<fieldset class="col-sm-6"><legend>' . $this->i18n('capacity_options') . '</legend>';





/*input space*/

$formElements = [];
$n = [];
$n['label'] = '<label>'.rex_i18n::msg('capacity_spacename').'</label>';
$n['field'] = '<input class="form-control" type="text" name="config[space]" value="'.$this->getConfig('space').'" placeholder="'.rex_i18n::msg('capacity_spacename_placeholder').'" />';
$formElements[] = $n;
$fragment = new rex_fragment();
$fragment->setVar('elements', $formElements, false);
$content .= $fragment->parse('core/form/container.php');



/*input warning*/

$formElements = [];
$n = [];
$n['label'] = '<label>'.rex_i18n::msg('capacity_warning').'</label>';
$n['field'] = '<input disabled class="form-control" type="text" name="config[warning]" value="'.$this->getConfig('warning').'" placeholder="'.rex_i18n::msg('capacity_warning_placeholder').'" />';
$formElements[] = $n;
$fragment = new rex_fragment();
$fragment->setVar('elements', $formElements, false);
$content .= $fragment->parse('core/form/container.php');



/*next column*/

$content .= '</fieldset><fieldset class="col-sm-6"><legend>' . $this->i18n('capacity_highlighting') . '</legend>';



/*input largedir*/

$formElements = [];
$n = [];
$n['label'] = '<label>'.rex_i18n::msg('capacity_largedir').'</label>';
$n['field'] = '<input class="form-control" type="text" name="config[largedir]" value="'.$this->getConfig('largedir').'" placeholder="'.rex_i18n::msg('capacity_largedir_placeholder').'" />';
$formElements[] = $n;
$fragment = new rex_fragment();
$fragment->setVar('elements', $formElements, false);
$content .= $fragment->parse('core/form/container.php');




/*input largefile*/

$formElements = [];
$n = [];
$n['label'] = '<label>'.rex_i18n::msg('capacity_largefile').'</label>';
$n['field'] = '<input class="form-control" type="text" name="config[largefile]" value="'.$this->getConfig('largefile').'" placeholder="'.rex_i18n::msg('capacity_largefile_placeholder').'" />';
$formElements[] = $n;
$fragment = new rex_fragment();
$fragment->setVar('elements', $formElements, false);
$content .= $fragment->parse('core/form/container.php');




/*notice*/

$content .= '</fieldset>';
$content .= '<fieldset class="col-sm-12"><small style="display: block; margin: 2rem 0; font-style: italic; opacity: 0.35;">'.$this->i18n('capacity_notice').'</small></fieldset>';





/*savebutton*/

$formElements = [];
$n = [];
$n['field'] = '<button class="btn btn-save" type="submit" name="save">'.$this->i18n('capacity_refresh').'</button>';
$formElements[] = $n;
$fragment = new rex_fragment();
$fragment->setVar('elements', $formElements, false);
$buttons = $fragment->parse('core/form/submit.php');
$buttons = '<fieldset class="rex-form-action">'.$buttons.'</fieldset>';






/*form output*/

$fragment = new rex_fragment();
$fragment->setVar('class', 'edit');
$fragment->setVar('title', $this->i18n('capacity_fieldname').': '.formatBytes(folderSize(getcwd())));
$fragment->setVar('body', $content, false);
$fragment->setVar('buttons', $buttons, false);
$output = $fragment->parse('core/page/section.php');
$output = '
<form action="'.rex_url::currentBackendPage().'" method="post">
<input type="hidden" name="formsubmit" value="1" />'.$output.'</form>
';
echo $output;






