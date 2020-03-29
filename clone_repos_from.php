<?php 

$context = stream_context_create(["http" => ["header" => "User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36"]]);
$query   = file_get_contents('https://api.github.com/users/'.$argv[1].'/repos?per_page=300', false, $context);
$json    = json_decode($query);

foreach ($json as $data) {
	shell_exec('git clone '.$data->html_url);
}
