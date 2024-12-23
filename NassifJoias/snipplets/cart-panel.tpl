<div class="js-ajax-cart-list container-fluid">
    {# Cart panel items #}
    {% if cart.items %}
      {% for item in cart.items %}
        {% include "snipplets/cart-item-ajax.tpl" %}
      {% endfor %}
    {% endif %}
</div>
<div class="js-empty-ajax-cart" {% if cart.items_count > 0 %}style="display:none;"{% endif %}>
    {# Cart panel empty #}
    <div class="alert alert-info" data-component="cart.empty-message">{{ "El carrito de compras está vacío." | translate }} </div>
</div>
<div id="error-ajax-stock" class="row" style="display: none;">
    <div class="alert alert-warning">
        {{ "¡Uy! No tenemos más stock de este producto para agregarlo al carrito. Si querés podés" | translate }}<a href="{{ store.products_url }}" class="btn-link font-small ml-1">{{ "ver otros acá" | translate }}</a>
    </div>
</div>

<div class="cart-row">
    {% include "snipplets/cart-totals.tpl" %}
    <!-- Mensagem fixa -->
    <div class="fixed-cart-message" style="margin-top: 15px; font-size: 14px; color: #333;">
        <p><strong>Nosso prazo de produção:</strong> até 15 dias úteis após a confirmação do pedido. O prazo de entrega dos Correios começa a ser contado após o envio do produto. Em caso de dúvidas nos contate pelo whatsapp.</p>
    </div>
</div>
