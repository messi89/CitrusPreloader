# Preloader for StarlingCitrusEngine 

When your have a big SWF running in web or mobile, it makes a time to be loaded, so you should make a preloader for your SWF. This an example to show you how you can create a preloader for a CitrusEngine with Starling app.

1. Extend `flash.display.MovieClip` when creating the document class (on Example: CitrusPreloader.as).

2. Add this argument to your ActionScript Compiler to put a StarlingCitrusEngine class on frame 2.

	-frame two Main

3. Override the setUpStarling function to put the parent.stage on our `starling.stage`.


For more detailed explanation see the comments in the example code .

Ressources:

1. https://github.com/alamboley/Citrus-Engine.

2. https://github.com/joshtynjala/starling-preloader.
