{# /*============================================================================
  #Product Related Grid
==============================================================================*/

#Properties

#Related Slider

#}

{% set related_slider = related_slider | default(false) %}
{% set related_products = [] %}
{% set related_products_ids_from_app = product.metafields.related_products.related_products_ids %}
{% set has_related_products_from_app = related_products_ids_from_app | get_products | length > 0 %}
{% if has_related_products_from_app %}
    {% set related_products = related_products_ids_from_app | get_products %}
{% endif %}
{% if related_products is empty %}
    {% set max_related_products_length = 8 %}
    {% set max_related_products_achieved = false %}
    {% set related_products_without_stock = [] %}
    {% set max_related_products_without_achieved = false %}
    
    {% set products_from_category = category.products | shuffle %}
    {% for product_from_category in products_from_category if not max_related_products_achieved and product_from_category.id != product.id %}
        {%  if product_from_category.stock is null or product_from_category.stock > 0 %}
            {% set related_products = related_products | merge([product_from_category]) %}
        {% elseif (related_products_without_stock | length < max_related_products_length) %}
            {% set related_products_without_stock = related_products_without_stock | merge([product_from_category]) %}
        {% endif %}
        {%  if (related_products | length == max_related_products_length) %}
            {% set max_related_products_achieved = true %}
        {% endif %}
    {% endfor %}
    {% if (related_products | length < max_related_products_length) %}
        {% set number_of_related_products_for_refill = max_related_products_length - (related_products | length) %}
        {% set related_products_for_refill = related_products_without_stock | take(number_of_related_products_for_refill) %}
        
        {% set related_products = related_products | merge(related_products_for_refill)  %}
    {% endif %}
{% endif %}

{% if related_products | length > 0 %}
    <div class="row mb-3 pb-2 align-items-center">
        {% if settings.products_related_title %}
            <div class="col">
                <h2 class="h3 mb-1">{{ settings.products_related_title }}</h2>
            </div>
        {% endif %}
        <div class="col-auto text-right d-none d-md-block">
            <div class="js-swiper-related-prev swiper-button-prev d-inline-block svg-circle svg-icon-text">{% include "snipplets/svg/chevron-left.tpl" with {svg_custom_class: "icon-inline icon-lg"} %}</div>
            <div class="js-swiper-related-next swiper-button-next d-inline-block svg-circle svg-icon-text ml-2">{% include "snipplets/svg/chevron-right.tpl" with {svg_custom_class: "icon-inline icon-lg"} %}</div>
        </div>
    </div>
    <div class="row">
        {% if related_slider %}
            <div class="col-12 pr-0 pr-md-3">
                <div class="js-swiper-related swiper-container" data-related-products-amount="{{ related_products | length }}">
                    <div class="swiper-wrapper">
        {% endif %}

        {% for related in related_products %}
            {% if related_slider %}
                {% include 'snipplets/grid/item.tpl' with {'product': related, 'slide_item': true} %}
            {% else %}
                {% include 'snipplets/grid/item.tpl' with {'product': related} %}
            {% endif %}
        {% endfor %}

        {% if related_slider %}
                    </div>
                </div>
            </div>
        {% endif %}
    </div>
{% endif %}