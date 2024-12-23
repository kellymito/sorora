{% if settings.pagination == 'infinite' %}
	{% paginate by 12 %}
{% else %}
	{% if settings.grid_columns_desktop == '5' %}
		{% paginate by 50 %}
	{% else %}
		{% paginate by 48 %}
	{% endif %}
{% endif %}

{% embed "snipplets/page-header.tpl" with { breadcrumbs: false, container: true } %}
	{% block page_header_text %}
		{% if products %}
			{{ 'Resultados de búsqueda' | translate }}
		{% else %}
			{{ "No encontramos nada para" | translate }}<span class="ml-2">"{{ query }}"</span>
		{% endif %}
	{% endblock page_header_text %}
{% endembed %}

<section class="category-body">
	<div class="container">
		{% if products %}
			<h2 class="h4 mt-2 mb-4">
				{{ "Mostrando los resultados para" | translate }}<span class="ml-2">"{{ query }}"</span>
			</h2>
			<div class="js-product-table row">
				{% include 'snipplets/product_grid.tpl' %}
			</div>
			{% if settings.pagination == 'infinite' %}
				{% set pagination_type_val = true %}
			{% else %}
				{% set pagination_type_val = false %}
			{% endif %}
			{% include "snipplets/grid/pagination.tpl" with {infinite_scroll: pagination_type_val} %}
		{% else %}
			<h2 class="h4 my-4 py-4">
				{{ "Escribilo de otra forma y volvé a intentar." | translate }}
			</h2>
		{% endif %}
	</div>
</section>