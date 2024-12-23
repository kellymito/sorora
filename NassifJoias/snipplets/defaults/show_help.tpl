{# Only remove this if you want to take away the theme onboarding advices #}

{% if not params.preview %}
	{% if is_theme_draft %}
		{% set admin_link = '/admin/themes/settings/draft/' %}
	{% else %}
		{% set admin_link = '/admin/themes/settings/active/' %}
	{% endif %}
{% endif %}

{# Slider that work as example #}

<section class="js-home-slider-container" data-store="home-slider">
	<div class="container-fluid">
		<div class="row">
			<div class="col section-slider p-0">
				<div class="js-home-empty-slider nube-slider-home swiper-container">
					<div class="swiper-wrapper">
						<div class="swiper-slide slide-container">
							{% include "snipplets/svg/help/help-slider.tpl" %}
						</div>
						<div class="swiper-slide slide-container">
							{% include "snipplets/svg/help/help-slider.tpl" %}
						</div>
						<div class="swiper-slide slide-container">
							{% include "snipplets/svg/help/help-slider.tpl" %}
						</div>
					</div>
					<div class="placeholder-overlay placeholder-slider transition-soft">
						<div class="placeholder-info">
							{% include "snipplets/svg/edit.tpl" with {svg_custom_class: "icon-inline icon-3x"} %}
							<div class="placeholder-description font-small-xs">
								{{ "Podés subir imágenes principales desde" | translate }} <strong>"{{ "Carrusel de imágenes" | translate }}"</strong>
							</div>
							{% if not params.preview %}
								<a href="{{ admin_link }}#instatheme=pagina-de-inicio" class="btn-primary btn btn-small placeholder-button">{{ "Editar" | translate }}</a>
							{% endif %}
						</div>
					</div>
					<div class="js-swiper-empty-home-pagination swiper-pagination swiper-pagination-bullets d-block"></div>
				</div>
				{% snipplet 'placeholders/home-slider-placeholder.tpl' %}
			</div>
		</div>
	</div>
</section>

{# Products featured that work as examples #}

<section class="section-featured-home" data-store="home-products-featured">
	<div class="container">
		<div class="row mb-3 pb-2 align-items-center">
			<div class="col-12">
				<h3 class="mb-1">{{ "Destacados" | translate }}</h3>
			</div>
		</div>
		<div class="row">
			<div class="col-12 pr-0 pr-md-3">
				<div class="js-swiper-featured-demo swiper-container">
					<div class="swiper-wrapper">
						{% include 'snipplets/defaults/help_item.tpl' with {'slide_item': true, 'help_item_1': true}  %}
						{% include 'snipplets/defaults/help_item.tpl' with {'slide_item': true, 'help_item_2': true}  %}
						{% include 'snipplets/defaults/help_item.tpl' with {'slide_item': true, 'help_item_3': true}  %}
						{% include 'snipplets/defaults/help_item.tpl' with {'slide_item': true, 'help_item_4': true}  %}
						{% include 'snipplets/defaults/help_item.tpl' with {'slide_item': true, 'help_item_5': true}  %}
						{% include 'snipplets/defaults/help_item.tpl' with {'slide_item': true, 'help_item_6': true}  %}
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

{# Categories banners that work as examples #}

<section class="section-banners-home" data-store="home-banner-categories">
	<div class="container">
		<div class="row row-grid">
			<div class="col-md col-grid">
				<div class="textbanner text-center">
					<div class="textbanner-image overlay textbanner-image-empty">
					</div>
					<div class="textbanner-text">
						<div class="h5">{{ "Categoría" | translate }}</div>
					</div>
					<div class="placeholder-overlay transition-soft">
						<div class="placeholder-info">
							{% include "snipplets/svg/edit.tpl" with {svg_custom_class: "icon-inline icon-3x"} %}
							<div class="placeholder-description font-small-xs">
								{{ "Podés destacar categorías de tu tienda desde" | translate }} <strong>"{{ "Banners de categorías" | translate }}"</strong>
							</div>
							{% if not params.preview %}
								<a href="{{ admin_link }}#instatheme=pagina-de-inicio" class="btn-primary btn btn-small placeholder-button">{{ "Editar" | translate }}</a>
							{% endif %}
						</div>
					</div>
				</div>
			</div>
			<div class="col-md col-grid">
				<div class="textbanner text-center">
					<div class="textbanner-image overlay textbanner-image-empty">
					</div>
					<div class="textbanner-text">
						<div class="h5">{{ "Categoría" | translate }}</div>
					</div>
					<div class="placeholder-overlay transition-soft">
						<div class="placeholder-info">
							{% include "snipplets/svg/edit.tpl" with {svg_custom_class: "icon-inline icon-3x"} %}
							<div class="placeholder-description font-small-xs">
								{{ "Podés destacar categorías de tu tienda desde" | translate }} <strong>"{{ "Banners de categorías" | translate }}"</strong>
							</div>
							{% if not params.preview %}
								<a href="{{ admin_link }}#instatheme=pagina-de-inicio" class="btn-primary btn btn-small placeholder-button">{{ "Editar" | translate }}</a>
							{% endif %}
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

{# Informative banners that work as examples #}

<section class="section-informative-banners" data-store="banner-services">
	<div class="container">
		<div class="row">
			<div class="js-informative-banners swiper-container">
				<div class="swiper-wrapper">
					{% include 'snipplets/defaults/help_banner_services_item.tpl' with {'help_item_1': true} %}
					{% include 'snipplets/defaults/help_banner_services_item.tpl' with {'help_item_2': true} %}
					{% include 'snipplets/defaults/help_banner_services_item.tpl' with {'help_item_3': true} %}
				</div>
			</div>
		</div>
	</div>
	<div class="js-informative-banners-pagination service-pagination swiper-pagination"></div>
</section>

{# Products featured that work as examples #}

<section class="section-featured-home" data-store="home-products-new">
	<div class="container">
		<div class="row mb-3 pb-2 align-items-center">
			<div class="col-12">
				<h3 class="mb-1">{{ "Novedades" | translate }}</h3>
			</div>
		</div>
		<div class="row">
			<div class="col-12 pr-0 pr-md-3">
				<div class="js-swiper-featured-demo swiper-container swiper-products p-md-1">
					<div class="swiper-wrapper">
						{% include 'snipplets/defaults/help_item.tpl' with {'slide_item': true, 'help_item_6': true}  %}
						{% include 'snipplets/defaults/help_item.tpl' with {'slide_item': true, 'help_item_7': true}  %}
						{% include 'snipplets/defaults/help_item.tpl' with {'slide_item': true, 'help_item_8': true}  %}
						{% include 'snipplets/defaults/help_item.tpl' with {'slide_item': true, 'help_item_6': true}  %}
						{% include 'snipplets/defaults/help_item.tpl' with {'slide_item': true, 'help_item_4': true}  %}
						{% include 'snipplets/defaults/help_item.tpl' with {'slide_item': true, 'help_item_5': true}  %}
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

{# Video that work as examples #}

<section class="section-video-home" data-store="home-video">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<div class="home-video embed-responsive embed-responsive-16by9">
					{% include "snipplets/svg/help/help-video.tpl" %}
					<div class="placeholder-overlay transition-soft">
					<div class="placeholder-info">
							{% include "snipplets/svg/edit.tpl" with {svg_custom_class: "icon-inline icon-3x"} %}
							<div class="placeholder-description font-small-xs">
								{{ "Podés subir tu video de YouTube" | translate }} <strong>"{{ "Video" | translate }}"</strong>
							</div>
							{% if not params.preview %}
								<a href="{{ admin_link }}#instatheme=pagina-de-inicio" class="btn-primary btn btn-small placeholder-button">{{ "Editar" | translate }}</a>
							{% endif %}
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

{# Products featured that work as examples #}

<section class="section-featured-home" data-store="home-products-sale">
	<div class="container">
		<div class="row mb-3 pb-2 align-items-center">
			<div class="col-12">
				<h3 class="mb-1">{{ "Ofertas" | translate }}</h3>
			</div>
		</div>
		<div class="row">
			<div class="col-12 pr-0 pr-md-3">
				<div class="js-swiper-featured-demo swiper-container swiper-products p-md-1">
					<div class="swiper-wrapper">
						{% include 'snipplets/defaults/help_item.tpl' with {'slide_item': true, 'help_item_3': true}  %}
						{% include 'snipplets/defaults/help_item.tpl' with {'slide_item': true, 'help_item_4': true}  %}
						{% include 'snipplets/defaults/help_item.tpl' with {'slide_item': true, 'help_item_5': true}  %}
						{% include 'snipplets/defaults/help_item.tpl' with {'slide_item': true, 'help_item_6': true}  %}
						{% include 'snipplets/defaults/help_item.tpl' with {'slide_item': true, 'help_item_7': true}  %}
						{% include 'snipplets/defaults/help_item.tpl' with {'slide_item': true, 'help_item_8': true}  %}
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

{# Promotional banners that work as examples #}

<section class="section-banners-home" data-store="home-banner-promotional"">
	<div class="container">
		<div class="row row-grid">
			<div class="col-md col-grid">
				<div class="textbanner text-center">
					<div class="textbanner-image overlay textbanner-image-empty">
					</div>
					<div class="textbanner-text">
						<div class="h5">{{ "Promoción" | translate }}</div>
					</div>
					<div class="placeholder-overlay transition-soft">
						<div class="placeholder-info">
							{% include "snipplets/svg/edit.tpl" with {svg_custom_class: "icon-inline icon-3x"} %}
							<div class="placeholder-description font-small-xs">
								{{ "Podés mostrar tus promociones desde" | translate }} <strong>"{{ "Banners promocionales" | translate }}"</strong>
							</div>
							{% if not params.preview %}
								<a href="{{ admin_link }}#instatheme=pagina-de-inicio" class="btn-primary btn btn-small placeholder-button">{{ "Editar" | translate }}</a>
							{% endif %}
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

{# Instagram feed that work as examples #}

<section class="section-instafeed-home" data-store="home-instagram-feed">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<div class="instafeed-title">
					{% include "snipplets/svg/instagram.tpl" with {svg_custom_class: "icon-inline icon-lg mr-1 svg-icon-text"} %}
					<h3 class="instafeed-user h5 mb-0">{{ 'Instagram' | translate }}</h3>
				</div>
				<div id="instafeed" class="row position-relative">
					{% include 'snipplets/defaults/help_instagram.tpl' with {'help_item_1': true} %}
					{% include 'snipplets/defaults/help_instagram.tpl' with {'help_item_2': true} %}
					{% include 'snipplets/defaults/help_instagram.tpl' with {'help_item_1': true} %}
					{% include 'snipplets/defaults/help_instagram.tpl' with {'help_item_2': true} %}
					{% include 'snipplets/defaults/help_instagram.tpl' with {'help_item_1': true} %}
					{% include 'snipplets/defaults/help_instagram.tpl' with {'help_item_2': true} %}
					<div class="placeholder-overlay transition-soft">
						<div class="placeholder-info">
							{% include "snipplets/svg/edit.tpl" with {svg_custom_class: "icon-inline icon-3x"} %}
							<div class="placeholder-description font-small-xs">
								{{ "Podés mostrar tus últimas novedades desde" | translate }} <strong>"{{ "Publicaciones de Instagram" | translate }}"</strong>
							</div>
							{% if not params.preview %}
								<a href="{{ admin_link }}#instatheme=redes-sociales" class="btn-primary btn btn-small placeholder-button">{{ "Editar" | translate }}</a>
							{% endif %}
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
