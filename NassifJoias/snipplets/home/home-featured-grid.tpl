{# /*============================================================================
  #Home featured grid
==============================================================================*/

#Properties

#Featured Slider

#}

{% set featured_products = featured_products | default(false) %}
{% set new_products = new_products | default(false) %}
{% set sale_products = sale_products | default(false) %}

{# Check if slider is used #}

{% set has_featured_products_and_slider = featured_products and settings.featured_products_format != 'grid' %}
{% set has_featured_products_and_image = featured_products and "featured_products_image.jpg" | has_custom_image %}
{% set has_new_products_and_slider = new_products and settings.new_products_format != 'grid' %}
{% set has_sale_products_and_slider = sale_products and settings.sale_products_format != 'grid' %}
{% set use_slider = has_featured_products_and_slider or has_new_products_and_slider or has_sale_products_and_slider %}

{% if featured_products %}
    {% set sections_products = sections.primary.products %}
    {% set section_name = 'primary' %}
    {% set sections_horizontal_item = false %}
    {% set section_title = settings.featured_products_title %}
    {% set section_link = settings.featured_products_link %}
{% endif %}
{% if new_products %}
    {% set sections_products = sections.new.products %}
    {% set section_name = 'new' %}
    {% set sections_horizontal_item = true %}
    {% set section_title = settings.new_products_title %}
    {% set section_link = settings.new_products_link %}
{% endif %}
{% if sale_products %}
    {% set sections_products = sections.sale.products %}
    {% set section_name = 'sale' %}
    {% set sections_horizontal_item = false %}
    {% set section_title = settings.sale_products_title %}
    {% set section_link = settings.sale_products_link %}
{% endif %}

<div class="container">
    <div class="row mb-3 pb-2 align-items-center">
        {% if new_products %}
            <div class="col-md-2 pt-md-3">
                <div class="row">
        {% endif %}
            {% if section_title %}
                <div class="col{% if new_products %} col-md-12{% endif %}">
                    <h2 class="h3 {% if new_products %}mb-3{% else %}mb-1{% endif %}">{{ section_title }}</h2>
                </div>
            {% endif %}
            {% if section_link %}
                <div class="col-auto text-right{% if new_products %} col-md-12 text-md-left mb-3{% endif %}">
                    <a href="{{ section_link }}" class="btn-link">{{ "Ver todos" | translate }}</a>
                </div>
            {% endif %}
        {% if new_products %}
            </div>
        {% endif %}
        {% if use_slider %}
            <div class="{% if not new_products %}col{% if (featured_products and settings.featured_products_title) or (sale_products and settings.sale_products_title) %}-auto{% endif %} text-right {% endif %}d-none d-md-block">
                <div class="js-swiper-{% if featured_products %}featured{% elseif new_products %}new{% else %}sale{% endif %}-prev swiper-button-prev d-inline-block svg-circle svg-icon-text">{% include "snipplets/svg/chevron-left.tpl" with {svg_custom_class: "icon-inline icon-lg"} %}</div>
                <div class="js-swiper-{% if featured_products %}featured{% elseif new_products %}new{% else %}sale{% endif %}-next swiper-button-next d-inline-block svg-circle svg-icon-text ml-2">{% include "snipplets/svg/chevron-right.tpl" with {svg_custom_class: "icon-inline icon-lg"} %}</div>
            </div>
        {% endif %}
    </div>
    {% if not new_products %}
    <div class="row{% if has_featured_products_and_image %} no-gutters{% endif %}">
    {% endif %}
        {% if has_featured_products_and_image %}
            <div class="col-12{% if settings.featured_products_format != 'grid' %} col-md-8{% endif %}">
                <div class="featured-product-image">
                    <img class="lazyautosizes lazyload" src="{{ 'images/empty-placeholder.png' | static_url }}" data-srcset="{{ 'featured_products_image.jpg' | static_url | settings_image_url('large') }} 480w, {{ 'featured_products_image.jpg' | static_url | settings_image_url('huge') }} 640w, {{ 'featured_products_image.jpg' | static_url | settings_image_url('original') }} 1024w" data-sizes="auto" data-expand="-10" {% if settings.featured_products_title %}alt="{{ featured_products_title }}"{% else %}alt="{{ 'Banner de' | translate }} {{ store.name }}"{% endif %} />
                </div>
            </div>
        {% endif %}
        <div class="col-12{% if has_featured_products_and_image and settings.featured_products_format != 'grid' %} col-md-4{% elseif new_products %} col-md-10{% endif %}{% if use_slider %} pr-0{% if not has_featured_products_and_image %} pr-md-3{% endif %}{% endif %}">
            {% if has_featured_products_and_image %}
                <div class="featured-product-container">
            {% endif %}
            {% if use_slider %}
                <div class="js-swiper-{% if featured_products %}featured{% elseif new_products %}new{% else %}sale{% endif %} swiper-container">
                    <div class="swiper-wrapper">
            {% else %}
                <div class="row row-grid">
            {% endif %}

            {% for product in sections_products %}
                {% if use_slider %}
                    {% include 'snipplets/grid/item.tpl' with {'slide_item': true, 'section_name': section_name, 'horizontal_item': sections_horizontal_item } %}
                {% else %}
                    {% include 'snipplets/grid/item.tpl' with {'horizontal_item': sections_horizontal_item } %}
                {% endif %}
            {% endfor %}

            {% if use_slider %}
                    </div>
                </div>
            {% else %}
                </div>
            {% endif %}
            {% if has_featured_products_and_image %}
                </div>
            {% endif %}
        </div>

        {% if show_help %}
            {% for i in 1..4 %}
                {% if loop.index % 4 == 1 %}
                    <div class="grid-row">
                {% endif %}

                <div class="span3">
                    <div class="item">
                        <div class="item-image-container">
                            <a href="/admin/products/new" target="_top">{{'placeholder-product.png' | static_url | img_tag}}</a>
                        </div>
                        <div class="item-info-container">
                            <div class="title"><a href="/admin/products/new" target="_top">{{"Producto" | translate}}</a></div>
                            <div class="price">{{"$0.00" | translate}}</div>
                        </div>
                    </div>
                </div>

                {% if loop.index % 4 == 0 or loop.last %}
                    </div>
                {% endif %}
            {% endfor %}
        {% endif %}
    {% if not new_products %}
    </div>
    {% endif %}
</div>
