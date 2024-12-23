{% if settings.welcome_message or settings.welcome_text %}
	<section class="section-welcome-home" data-store="home-welcome-message">
		<div class="container">
			<div class="row justify-content-md-center">
				<div class="col-md-6 text-center">
					{% if settings.welcome_message %}
						<h2 class="h1">{{ settings.welcome_message }}</h2>
					{% endif %}
					{% if settings.welcome_text %}
						<p>{{ settings.welcome_text }}</p>
					{% endif %}
				</div>
			</div>
		</div>
	</section>
{% endif %}
