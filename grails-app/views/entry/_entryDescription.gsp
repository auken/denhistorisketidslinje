<g:each in="${entries}" var="entry">
    <div class="simple_overlay" id="entry-${entry.id}">
        <div class="overlay_details">
            <div class="overlay_heading">
                ${entry.region.name + " - " + (entry.heading.length() < 50 ? entry.heading : entry.heading.toString().subSequence(0, 50)) + "-" + entry.year}
            </div>

            <div class="overlay_content">
                ${entry.description}
            </div>
        </div>
    </div>
</g:each>


