select
    {calendar_group_by_attributes},
	  {store_group_by_attributes},
	  {user_group_by_attributes}, 
    {kpi_group_by_attributes},
    COUNT(distinct session_fk) as count_sessions,
    COUNT(distinct scene_fk) AS count_scenes,
	  sum(compliance_kpi_fact.result) as result,
    sum(compliance_kpi_fact.result_value) as result_value,
    sum(compliance_kpi_fact.score_value) as score_value,
	  countif(compliance_kpi_fact.result is not null) as count_result,
from {datamart_name}.compliance_kpi_fact
join {datamart_name}.store_dim on compliance_kpi_fact.store_fk = store_dim.store_pk
join {datamart_name}.user_dim on compliance_kpi_fact.user_fk = user_dim.user_pk
join {datamart_name}.calendar_dim on compliance_kpi_fact.visit_date = calendar_dim.date
group by 
	{calendar_group_by_attributes}, 
	{store_group_by_attributes},
	{user_group_by_attributes}, 
  {kpi_name_group_by_attributes},
  {numerator_name_group_by_attributed};
	
