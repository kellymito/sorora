{# Product labels #}
{% set show_labels = not product.has_stock or product.compare_at_price or product.promotional_offer %}

{% include 'snipplets/labels.tpl' with {'product_detail': true} %}


{# Product name and breadcrumbs #}

{% if home_main_product %}
    <h2 class="h1 pt-2 mb-3">{{ product.name }}</h2>
{% else %}
    {% embed "snipplets/page-header.tpl" %}
        {% block page_header_text %}{{ product.name }}{% endblock page_header_text %}
    {% endembed %}
{% endif %}

{# SKU #}

{% if settings.product_sku and product.sku %}
    <div class="font-smallest opacity-60 mt-1 mb-3">
        {{ "SKU" | translate }}: <span class="js-product-sku">{{ product.sku }}</span>
    </div>
{% endif %}

{# Product price #}

<div class="price-container mb-4" data-store="product-price-{{ product.id }}">
    <div class="mb-2">
        <span class="d-inline-block">
		
        	<div class="js-price-display h1" id="price_display" {% if not product.display_price %}style="display:none;"{% endif %} data-product-price="{{ product.price }}">{% if product.display_price %}{{ product.price | money }}{% endif %}</div>
 {# Preço com desconto no Pix - Corrigido para exibir apenas duas casas decimais #}
            <div class="pix-price" style="margin-top: 5px; font-size: 18px; color: #333;">
                ou <strong id="precopix"></strong> no Pix
            </div>
       
	   </span>
        <span class="d-inline-block">
           <div id="compare_price_display" class="js-compare-price-display price-compare h3" {% if not product.compare_at_price or not product.display_price %}style="display:none;"{% else %} style="display:block;"{% endif %}>{% if product.compare_at_price and product.display_price %}{{ product.compare_at_price | money }}{% endif %}</div>
        </span>
    </div>
    {% if settings.product_detail_installments %}
        <div class="d-block">
            {{ component('installments', {'location' : 'product_detail', short_wording: true}) }}
        </div>
    {% endif %}
</div>
{# Script para calcular o desconto e corrigir o formato #}
<script>
    document.addEventListener('DOMContentLoaded', function () {
        // Obtém o preço original diretamente do elemento ou atributo
        let precoOriginal = parseFloat(document.getElementById('price_display').getAttribute('data-product-price'));

        // Corrige valores que podem estar em centavos (dividindo por 100 se necessário)
        if (precoOriginal > 1000) {
            precoOriginal = precoOriginal / 100; // Corrige para reais
        }

        // Calcula o preço com desconto
        const precoPix = (precoOriginal * 0.95).toFixed(2); // Aplicando 5% de desconto e limitando a duas casas decimais

        // Atualiza o texto com o preço formatado corretamente
        document.getElementById('precopix').textContent = parseFloat(precoPix).toLocaleString('pt-BR', {
            style: 'currency',
            currency: 'BRL'
        });
    });
</script>

{# Promotional text #}

{% if product.promotional_offer and not product.promotional_offer.script.is_percentage_off and product.display_price %}
    <div class="js-product-promo-container mb-4" data-store="product-promotion-info">
        {% if product.promotional_offer.script.is_discount_for_quantity %}
            {% for threshold in product.promotional_offer.parameters %}
                <h4 class="mb-2 h6 text-accent">{{ "¡{1}% OFF comprando {2} o más!" | translate(threshold.discount_decimal_percentage * 100, threshold.quantity) }}</h4>
            {% endfor %}
        {% else %}
            <h4 class="mb-2 h6 text-accent">{{ "¡Llevá {1} y pagá {2}!" | translate(product.promotional_offer.script.quantity_to_take, product.promotional_offer.script.quantity_to_pay) }}</h4>
        {% endif %}
        {% if product.promotional_offer.scope_type == 'categories' %}
            <p class="font-small">{{ "Válido para" | translate }} {{ "este producto y todos los de la categoría" | translate }}:
            {% for scope_value in product.promotional_offer.scope_value_info %}
               {{ scope_value.name }}{% if not loop.last %}, {% else %}.{% endif %}
            {% endfor %}</br>{{ "Podés combinar esta promoción con otros productos de la misma categoría." | translate }}</p>
        {% elseif product.promotional_offer.scope_type == 'all'  %}
            <p class="font-small">{{ "Vas a poder aprovechar esta promoción en cualquier producto de la tienda." | translate }}</p>
        {% endif %}
    </div>
{% endif %}

{# Product form, includes: Variants, CTA and Shipping calculator #}

 <form id="product_form" class="js-product-form" method="post" action="{{ store.cart_url }}" data-store="product-form-{{ product.id }}">
	<input type="hidden" name="add_to_cart" value="{{product.id}}" />
 	{% if template == "product" %}
        {% set show_size_guide = true %}
    {% endif %}
    {% if product.variations %}
        {% include "snipplets/product/product-variants.tpl" with {show_size_guide: show_size_guide} %}
    {% endif %}

    {% set show_product_quantity = product.available and product.display_price %}

    {% if settings.last_product and show_product_quantity %}
        <div class="{% if product.variations %}js-last-product {% endif %}text-accent font-weight-bold mb-4"{% if product.selected_or_first_available_variant.stock != 1 %} style="display: none;"{% endif %}>
            {{ settings.last_product_text }}
        </div>
    {% endif %}

    <div class="form-row mb-4">
        {% if show_product_quantity %}
            {% include "snipplets/product/product-quantity.tpl" %}
        {% endif %}
        {% set state = store.is_catalog ? 'catalog' : (product.available ? product.display_price ? 'cart' : 'contact' : 'nostock') %}
        {% set texts = {'cart': "Agregar al carrito", 'contact': "Consultar precio", 'nostock': "Sin stock", 'catalog': "Consultar"} %}
        <div class="{% if show_product_quantity %}col-8{% else %}col-12{% endif %}">

            {# Add to cart CTA #}

            <input type="submit" class="js-addtocart js-prod-submit-form btn btn-primary btn-block mb-4 {{ state }}" value="{{ texts[state] | translate }}" {% if state == 'nostock' %}disabled{% endif %} data-store="product-buy-button" data-component="product.add-to-cart"/>

            {# Fake add to cart CTA visible during add to cart event #}

            {% include 'snipplets/placeholders/button-placeholder.tpl' with {custom_class: "mb-4"} %}

        </div>

        {% if settings.ajax_cart %}
            <div class="col-12">
                <div class="js-added-to-cart-product-message font-small {% if settings.product_stock %}mt-4{% endif %}" style="display: none;">
                    {% include "snipplets/svg/check.tpl" with {svg_custom_class: "icon-inline icon-lg svg-icon-text mr-2 d-table float-left"} %}
                    <span>
                        {{'Ya agregaste este producto.' | translate }}<a href="#" class="js-modal-open js-open-cart js-fullscreen-modal-open btn-link float-right ml-1" data-toggle="#modal-cart" data-modal-url="modal-fullscreen-cart">{{ 'Ver carrito' | translate }}</a>
                    </span>
                </div>
            </div>
        {% endif %}
    </div>

    {% if template == 'product' %}
        <div class="row m-md-0">

            {# Product installments #}

            {% set installments_info = product.installments_info_from_any_variant %}
            {% set hasDiscount = product.maxPaymentDiscount.value > 0 %}
            {% set show_payments_info = settings.product_detail_installments and product.show_installments and product.display_price and installments_info %}

            {% if show_payments_info or hasDiscount %}

                <div class="js-accordion-container accordion px-3 col-12">
                    <a href="#" class="js-accordion-toggle py-3 row">
                        <div class="col">
                            <span class="h5">{{ 'Medios de pago' | translate }}</span>
                        </div>
                        <div class="col-auto">
                            <span class="js-accordion-toggle-inactive">
                                {% include "snipplets/svg/plus.tpl" with {svg_custom_class: "icon-inline svg-icon-text"} %}
                            </span>
                            <span class="js-accordion-toggle-active" style="display: none;">
                            {% include "snipplets/svg/minus.tpl" with {svg_custom_class: "icon-inline svg-icon-text"} %}
                            </span>
                        </div>
                    </a>
                    <div class="js-accordion-content pt-3" style="display: none;">
                        <div {% if installments_info %}data-toggle="#installments-modal" data-modal-url="modal-fullscreen-payments"{% endif %} class="{% if installments_info %}js-modal-open js-fullscreen-modal-open{% endif %} js-product-payments-container row mb-4" {% if not (product.get_max_installments and product.get_max_installments(false)) %}style="display: none;"{% endif %}>

                            {% if show_payments_info %}
                                {{ component('installments', {'location' : 'product_detail', short_wording: true, container_classes: { installment: "col-12 mb-2"}}) }}
                            {% endif %}

                            {# Max Payment Discount #}

                            {% if hasDiscount %}
                                <span class="col-12 mb-2">
                                    <span class="text-accent">{{ product.maxPaymentDiscount.value }}% {{'de descuento' | translate }}</span> {{'pagando con' | translate }} {{ product.maxPaymentDiscount.paymentProviderName }}
                                </span>
                            {% endif %}

                            <a id="btn-installments" class="btn-link font-small col mt-1" {% if not (product.get_max_installments and product.get_max_installments(false)) %}style="display: none;"{% endif %}>
                                <span class="d-table">
                                    {% if not hasDiscount and not settings.product_detail_installments %}
                                        {{ "Ver medios de pago" | translate }}
                                    {% else %}
                                        {{ "Ver más detalles" | translate }}
                                    {% endif %}
                                </span>
                            </a>
                        </div>
                    </div>
                </div>
            {% endif %}

            {# Define contitions to show shipping calculator and store branches on product page #}

            {% set show_product_fulfillment = settings.shipping_calculator_product_page and (store.has_shipping or store.branches) and not product.free_shipping and not product.is_non_shippable %}

            {% if show_product_fulfillment %}

                {# Shipping calculator and branch link #}

                <div id="product-shipping-container" class="product-shipping-calculator list accordion px-3 col-12" {% if not product.display_price or not product.has_stock %}style="display:none;"{% endif %} data-shipping-url="{{ store.shipping_calculator_url }}">
                    {% if store.has_shipping %}
                        {% include "snipplets/shipping/shipping-calculator.tpl" with {'shipping_calculator_variant' : product.selected_or_first_available_variant, 'product_detail': true} %}
                    {% endif %}
                </div>

                {% if store.branches %} 
                    {# Link for branches #}
                    {% include "snipplets/shipping/branches.tpl" with {'product_detail': true} %}
                {% endif %}

            {% endif %}
        </div>
    {% endif %}

 </form>

{# Product payments details #}

{% include 'snipplets/product/product-payment-details.tpl' %}
