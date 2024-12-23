{% if product.compare_at_price > product.price %}
{% set price_discount_percentage = ((product.compare_at_price) - (product.price)) * 100 / (product.compare_at_price) %}
{% endif %}

{% if shipping %}
  {% set show_free_shipping_label = product.free_shipping %}
{% else %}
  {% set show_labels = not product.has_stock or product.compare_at_price or product.promotional_offer %}
{% endif %}

{% set has_multiple_slides = product.images_count > 1 or product.video_url %}


<div class="{% if product.video_url and product %}js-labels-group{% endif %} labels{% if shipping %}-absolute{% endif %} {% if product_detail %}labels-product-slider{% endif %}" data-store="product-{% if shipping %}shipping-{% endif %}item-labels">
  {% if show_free_shipping_label %}
    <div class="label">{% include "snipplets/svg/truck.tpl" with {svg_custom_class: "icon-inline mr-1 icon-lg svg-icon-text"} %}{{ "Gratis" | translate }}</div>
  {% elseif show_labels %}
    {% if not product.has_stock %}
      <div class="{% if product_detail %}js-stock-label {% endif %}label label-default">{{ "Sin stock" | translate }}</div>
    {% else %}
      {% if product_detail %}
        <div class="js-stock-label label label-default" {% if product.has_stock %}style="display:none;"{% endif %}>{{ "Sin stock" | translate }}</div>
      {% endif %}
      {% if product.compare_at_price or product.promotional_offer %}
        <div class="{% if not product.promotional_offer and product %}js-offer-label{% endif %} label label-accent" {% if (not product.compare_at_price and not product.promotional_offer) or not product.display_price %}style="display:none;"{% endif %} data-store="product-item-{% if product.compare_at_price %}offer{% else %}promotion{% endif %}-label">
          {% if product.promotional_offer.script.is_percentage_off %}
            {{ product.promotional_offer.parameters.percent * 100 }}% OFF
          {% elseif product.promotional_offer.script.is_discount_for_quantity %}
            <div>-{{ product.promotional_offer.selected_threshold.discount_decimal_percentage * 100 }}%</div>
            <div class="font-smallest">{{ "Comprando {1} o más" | translate(product.promotional_offer.selected_threshold.quantity) }}</div>
          {% elseif product.promotional_offer %}
            {% if store.country == 'BR' %}
              {{ "Leve {1} Pague {2}" | translate(product.promotional_offer.script.quantity_to_take, product.promotional_offer.script.quantity_to_pay) }}
            {% else %}
              {{ product.promotional_offer.script.type }} 
            {% endif %}
          {% else %}
            -<span class="js-offer-percentage">{{ price_discount_percentage |round }}</span>%
          {% endif %}
        </div>
      {% endif %}
    {% endif %}
  {% endif %}
</div>
<span class="hidden" data-store="stock-product-{{ product.id }}-{% if product.has_stock %}{% if product.stock %}{{ product.stock }}{% else %}infinite{% endif %}{% else %}0{% endif %}"></span>