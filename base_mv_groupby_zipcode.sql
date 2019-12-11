Select
  data_date,
  dim_lookup('campaigns',campaign_version_id, 'name') as campaign_name,
  dim_lookup('lineitems', lineitem_version_id, 'name') as lineitem_name,
  dim_lookup('tactics', tactic_version_id, 'name') as tactic_name,
 dim_lookup('ads', ad_version_id, 'name') as advertisement_name,
  clean_site as url,
  ip_lookup(IP, 'COUNTRY') as Country,
  ip_lookup(IP, 'POSTAL_CODE') as ZipCode,
  sum(adv_server_views) as Impressions,
  sum(adv_clicks) as Clicks,
  sum(adv_conversions) as Conversions
from
  base_mv
where
  data_date >= $date
  and data_date <= $date
  and dim_lookup('campaigns', campaign_version_id, 'campaign_id') = $campaign_id
group by
  data_date,
  dim_lookup('campaigns',campaign_version_id, 'name'),
  dim_lookup('lineitems', lineitem_version_id, 'name'),
  dim_lookup('tactics', tactic_version_id, 'name'),
 dim_lookup('ads', ad_version_id, 'name'),
  clean_site,
  ip_lookup(IP, 'COUNTRY'),
  ip_lookup(IP, 'POSTAL_CODE')