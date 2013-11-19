DROP TABLE logs;

CREATE EXTERNAL TABLE logs (
    log_id string,
    browse_id string,
    ns string,
    dt string,
    google_uuid string,
    login_admin_id string,
    login_admin_account string,
    login_manager_id string,
    login_manager_account string,
    login_member_id string,
    login_member_account string,
    meta_api_key string,
    meta_locale string,
    url string,
    url_host string,
    url_path string,
    url_path_part_0 string,
    url_path_part_1 string,
    url_path_part_2 string,
    url_path_part_3 string,
    url_path_part_4 string,
    url_path_part_5 string,
    url_path_part_6 string,
    url_path_part_7 string,
    url_path_part_8 string,
    url_path_part_9 string,
    url_param_utm_source string,
    url_param_utm_medium string,
    url_param_utm_campaign string,
    url_param_utm_term string,
    url_param_utm_content string,
    url_param_utm_custom string,
    root_referer_url string,
    root_referer_url_host string,
    root_referer_url_path string,
    root_referer_url_path_part_0 string,
    root_referer_url_path_part_1 string,
    root_referer_url_path_part_2 string,
    root_referer_url_path_part_3 string,
    root_referer_url_path_part_4 string,
    root_referer_url_path_part_5 string,
    root_referer_url_path_part_6 string,
    root_referer_url_path_part_7 string,
    root_referer_url_path_part_8 string,
    root_referer_url_path_part_9 string
)
PARTITIONED BY (ymd string)
ROW FORMAT
    serde 'com.amazon.elasticmapreduce.JsonSerde'
    with serdeproperties ('paths'='log_id, browse_id, ns, dt, google_uuid, login_admin_id, login_admin_account, login_manager_id, login_manager_account, login_member_id, login_member_account, meta_api_key, meta_locale, url, url_host, url_path, url_path_part_0, url_path_part_1, url_path_part_2, url_path_part_3, url_path_part_4, url_path_part_5, url_path_part_6, url_path_part_7, url_path_part_8, url_path_part_9, url_param_utm_source, url_param_utm_medium, url_param_utm_campaign, url_param_utm_term, url_param_utm_content, url_param_utm_custom, root_referer_url, root_referer_url_host, root_referer_url_path, root_referer_url_path_part_0, root_referer_url_path_part_1, root_referer_url_path_part_2, root_referer_url_path_part_3, root_referer_url_path_part_4, root_referer_url_path_part_5, root_referer_url_path_part_6, root_referer_url_path_part_7, root_referer_url_path_part_8, root_referer_url_path_part_9')
LOCATION 's3://york-emr/tables/logs';

ALTER TABLE logs RECOVER PARTITIONS;

