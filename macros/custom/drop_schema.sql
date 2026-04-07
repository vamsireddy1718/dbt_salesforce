{% macro drop_schema(schema_name) %}

    {% set schemas_to_drop = [
        schema_name,
        schema_name ~ '_staging',
        schema_name ~ '_salesforce_custom',
        schema_name ~ '_salesforce_seeds'
    ] %}

    {% for schema in schemas_to_drop %}
        {% set drop_query %}
            DROP SCHEMA IF EXISTS {{ target.database }}.{{ schema }} CASCADE;
        {% endset %}
        {% do run_query(drop_query) %}
        {{ log("Dropped schema: " ~ target.database ~ "." ~ schema, info=True) }}
    {% endfor %}

{% endmacro %}