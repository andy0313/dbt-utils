{% macro get_url_path(field) -%}


{%- set stripped_url = 
    dbt_utils.replace(dbt_utils.replace(field, "'http://'", "''"), "'https://'", "''")
    
%}

{%- set first_slash_pos = 
    dbt_utils.position("'/'", stripped_url)
    
%}

{%- set parsed_path =
    dbt_utils.split_part(
        dbt_utils.right(stripped_url, dbt_utils.length(stripped_url) ~ "-" ~ first_slash_pos
    ), "'?'", 1)
-%}

    {{ dbt_utils.safe_cast(
        parsed_path,
        dbt_utils.type_string()
    )}}
    
{%- endmacro %}

