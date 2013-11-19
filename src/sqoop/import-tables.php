<?php
$config = array(
    'db' => array(
        'table',
    ),
);

if (count($argv) < 3) {
    echo __FILE__ . " <db user> <db password> <db host>\n";
    exit;
}

$user = $argv[1];
$password = $argv[2];
$stagingIP = "10.0.0.2";
if (isset($argv[3])) {
    $stagingIP = $argv[3];
}

foreach($config as $db => $tables) {
    foreach($tables as $table) {
        $cmd = <<<EOD
hive -e "DROP TABLE {$db}.{$table};"
EOD;
        passthru($cmd);

        $cmd = <<<EOD
sqoop/bin/sqoop import \
    --connect jdbc:mysql://{$stagingIP}/{$db} \
    --username {$user} --password {$password} \
    --hive-import --hive-overwrite --hive-database {$db} \
    --table {$table} --hive-table {$table} \
    --num-mappers 10
EOD;
        passthru($cmd);
    }
}

