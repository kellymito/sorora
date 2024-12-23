{% set has_banner = has_banner | default(false) and settings.banner %}
{% set has_banner_promotional = has_banner_promotional | default(false) and settings.banner_promotional %}
{% set has_banner_news = has_banner_news | default(false) and settings.banner_news %}

{% if has_banner %}
    {% set data_store_name = 'categories' %}
{% elseif has_banner_promotional %}
    {% set data_store_name = 'promotional' %}
{% else %}
    {% set data_store_name = 'news' %}
{% endif %}

{% if has_banner or has_banner_promotional or has_banner_news %}
    <section class="section-banners-home position-relative" data-store="home-banner-{{ data_store_name }}">
        {% if has_banner %}
            {% include 'snipplets/home/home-banners-grid.tpl' with {'banner': true} %}
        {% endif %}
        {% if has_banner_promotional %}
            {% include 'snipplets/home/home-banners-grid.tpl' with {'banner_promotional': true} %}
        {% endif %}
        {% if has_banner_news %}
            {% include 'snipplets/home/home-banners-grid.tpl' with {'banner_news': true} %}
        {% endif %}
    </section>
{% endif %}
