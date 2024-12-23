{# Cookie validation #}

{% if show_cookie_banner and not params.preview %}
    <div class="js-notification js-notification-cookie-banner notification notification-fixed-bottom notification-above notification-primary text-left" style="display: none;">
        <div class="container-fluid p-0">
            <div class="row justify-content-center align-items-center">
                <div class="col col-md-auto pr-0">
                    <div class="font-small">{{ 'Al navegar por este sitio <strong>aceptás el uso de cookies</strong> para agilizar tu experiencia de compra.' | translate }}</div>
                </div>
                <div class="col-auto">
                    <a href="#" class="js-notification-close js-acknowledge-cookies btn btn-secondary btn-small" data-amplitude-event-name="cookie_banner_acknowledge_click">{{ "Entendido" | translate }}</a>
                </div>
            </div>
        </div>
    </div>
{% endif %}

{% if order_notification and status_page_url %}
    <div class="js-notification js-notification-status-page notification notification-primary notification-order w-100" style="display:none;" data-url="{{ status_page_url }}">
        <div class="container">
            <div class="row">
                <div class="col">
                    <a href="{{ status_page_url }}"><strong>{{ "Seguí acá" | translate }}</strong> {{ "tu última compra" | translate }}</a>
                    <a class="js-notification-close js-notification-status-page-close ml-2" href="#">
                        {% include "snipplets/svg/times.tpl" with {svg_custom_class: "icon-inline"} %}
                    </a>
                </div>
            </div>
        </div>
    </div>
{% endif %}

{% if add_to_cart %}
    <div class="js-alert-added-to-cart notification-floating notification-cart-container notification-hidden {% if add_to_cart_fixed %}notification-fixed{% endif %}" style="display: none;">
        <div class="notification notification-primary notification-cart position-relative">
            <div class="js-cart-notification-close notification-close">
                {% include "snipplets/svg/times.tpl" with {svg_custom_class: "icon-inline icon-lg notification-icon"} %}
            </div>
            <div class="js-cart-notification-item row" data-store="cart-notification-item">
                <div class="col-2 pr-0 notification-img">
                    <img src="" class="js-cart-notification-item-img img-fluid" />
                </div>
                <div class="col-10 text-left">
                    <div class="mb-1 mr-4">
                        <span class="js-cart-notification-item-name"></span>
                        <span class="js-cart-notification-item-variant-container" style="display: none;">
                            (<span class="js-cart-notification-item-variant"></span>)
                        </span>
                    </div>
                    <div class="mb-1">
                        <span class="js-cart-notification-item-quantity"></span>
                        <span> x </span>
                        <span class="js-cart-notification-item-price"></span>
                    </div>
                    <strong>{{ '¡Agregado al carrito con éxito!' | translate }}</strong>
                </div>
            </div>
            <div class="divider my-3"></div>
            <div class="row no-gutters h5 mb-3">
                <span class="col-auto text-left">
                    <span>{{ "Total" | translate }}</span> 
                    (<span class="js-cart-widget-amount">
                        {{ "{1}" | translate(cart.items_count ) }} 
                    </span>
                    <span class="js-cart-counts-plural" style="display: none;">
                        {{ 'productos' | translate }}):
                    </span>
                    <span class="js-cart-counts-singular" style="display: none;">
                        {{ 'producto' | translate }}):
                    </span>

                </span>
                <span class="js-cart-total col text-right">{{ cart.total | money }}</span>
            </div>
            <a href="#" class="js-modal-open js-open-cart js-cart-notification-close js-fullscreen-modal-open btn btn-primary btn-medium w-100 d-inline-block" data-toggle="#modal-cart" data-modal-url="modal-fullscreen-cart">
                {{'Ver carrito' | translate }}
            </a>
        </div>
    </div>
{% endif %}
