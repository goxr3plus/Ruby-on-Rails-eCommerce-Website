// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require bootstrap
//= require jquery.nicescroll

// $(".add-to-basket").click(function(){
//   var productId = $(this).attr("productID");
//   $.post('/line_items_controller', {id: productId}).done(function(response){
//       if (response.status == "created"){
//        $('total_cart_items_badge').text(response.line_items_count);
//       }
//       else{
//          //your error handler
//       }
//   });
// });


/*!
    * Sidebar.js - Bootstrap Sidebar Hover Event toggle attribute
    * onHover

	* Version: v3.1.4

	* LGPL v3 LICENSE INFO
	* This file is part of a Sidebar Bootstrap Element. Copyright
	* 2015 Soldier-up Designs - Website Development Company.

	* sidebar.js is a free software: you can redistribute it and/or modify
	* it under the terms of the GNU Lesser General Public License as published by
	* the Free Software Foundation, either version 3 of the License, or
	* (at your option) any later version.

	* sidebar.js is distributed as a free tool that can help you
	* add a few extra dynamics to your Web Design code. However,
	* this code and any associated code "IS" "WITHOUT ANY WARRANTY";
	* without even the implied warranty of "MERCHANTABILITY" or
	* "FITNESS FOR A PARTICULAR PURPOSE".  See the GNU Lesser
	* General Public License for more details.
*/

/*!
	======================= Notes ===============================
	* Used to close Sidebar on jQuery Element "Mouseleave" Event
	* This was a pain in the Ass to create
	* and to not break the rest of the jQuery
	* and Bootstrap API Script ()Did that once or twice in
	- Development)
	========== END Crude Vocabulary (...and notes) ==============
*/

/*!
	================= ^ Ranting Stops Here ^ ====================
	==================== Code Starts Below ======================
*/

// Open the Sidebar-wrapper on Hover
/* $("#menu-toggle").hover(function(e)							//declare the element event ...'(e)' = event (shorthand)
{
	$("#sidebar-wrapper").toggleClass("active",true);		//instead on click event toggle active CSS element
	e.preventDefault();										//prevent the default action ("Do not remove as the code
});

$("#menu-toggle").bind('click',function(e)							//declare the element event ...'(e)' = event (shorthand)
{
	$("#sidebar-wrapper").toggleClass("active",true);		//instead on click event toggle active CSS element
	e.preventDefault();										//prevent the default action ("Do not remove as the code
});														//Close 'function()'

$('#sidebar-wrapper').mouseleave(function(e)				//declare the jQuery: mouseleave() event
															// - see: ('//api.jquery.com/mouseleave/' for details)
{
	/*! .toggleClass( className, state ) */
	/* $('#sidebar-wrapper').toggleClass('active',false); *//* toggleClass: Add or remove one or more classes from each element
															in the set of matched elements, depending on either the class's
															presence or the value of the state argument */
	/*e.stopPropagation();*/								//Prevents the event from bubbling up the DOM tree
															// - see: ('//api.jquery.com/event.stopPropagation/' for details)

	/*e.preventDefault();								    // Prevent the default action of the event will not be triggered
															// - see: ('//api.jquery.com/event.preventDefault/' for details)
}); */
/*!


Simply:

	a[href*=#]

		* get all anchors (a) that contains # in href but with:

	:not([href=#])

		* exclude anchors with href exaclty equals to #

example:

	<a href="#step1">yes</a>
	<a href="page.php#step2">yes</a>
	<a href="#">no</a>

		* the selectors get first two anchor but it exclude the last
		source: http://stackoverflow.com/questions/20947529/what-does-ahref-nothref-code-mean

*/

$(document).ready(function()
{
    /* smooth scrolling for scroll to top */
	$('#to-top').bind('click', function()
	{
		$('body,html').animate({
			scrollTop: 0},
			2500);
	});

	//Easing Scroll replace Anchor name in URL and Offset Position
	$(function(){
		$('a[href*=#]:not([href=#])').click(function()
		{
			if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {

				var target = $(this.hash);
				target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
				if (target.length) {
					$('html,body').animate({
						scrollTop: target.offset().top -420
					}, 3500, 'easeOutBounce');
					return false;
				}
			}
		});
	});
});
$(document).ready(function(){
    $(".dropdown").hover(
        function() {
            $('.dropdown-menu', this).not('.in .dropdown-menu').stop(true,true).slideDown("400");
            $(this).toggleClass('open');
        },
        function() {
            $('.dropdown-menu', this).not('.in .dropdown-menu').stop(true,true).slideUp("400");
            $(this).toggleClass('open');
        }
    );
});

/*!
    * Sidebar.js - Bootstrap Sidebar Hover Event toggle attribute
	* onHover

	* Version: v2.5.8

	* LGPL v3 LICENSE INFO
	* This file is part of a Sidebar Bootstrap Element. Copyright
	* 2015 Soldier-up Designs - Website Development Company.

	* sidebar.js is a free software: you can redistribute it and/or modify
	* it under the terms of the GNU Lesser General Public License as published by
	* the Free Software Foundation, either version 3 of the License, or
	* (at your option) any later version.

	* sidebar.js is distributed as a free tool that can help you
	* add a few extra dynamics to your Web Design code. However,
	* this code and any associated code "IS" "WITHOUT ANY WARRANTY";
	* without even the implied warranty of "MERCHANTABILITY" or
	* "FITNESS FOR A PARTICULAR PURPOSE".  See the GNU Lesser
	* General Public License for more details.
*/

/*!
	======================= Notes ===============================
	* Used to close Sidebar on jQuery Element "Mouseleave" Event
	* This was a pain in the Ass to create
	* and to not break the rest of the jQuery
	* and Bootstrap API Script ()Did that once or twice in
	- Development)
	========== END Crude Vocabulary (...and notes) ==============
*/

/*!
	================= ^ Ranting Stops Here ^ ====================
	==================== Code Starts Below ======================
*/

$(document).ready(function()
{

	// Closes the sidebar menu on menu-close button click event
	$("#menu-close").click(function(e)							//declare the element event ...'(e)' = event (shorthand)
	{
																// - will not work otherwise")
		$("#sidebar-wrapper").toggleClass("active");			//instead on click event toggle active CSS element
		e.preventDefault(); 									//prevent the default action ("Do not remove as the code

		/*!
		======================= Notes ===============================
		* see: .sidebar-wrapper.active in: style.css
		==================== END Notes ==============================
		*/
	});															//Close 'function()'

	// Open the Sidebar-wrapper on Hover
	$("#menu-toggle").hover(function(e)							//declare the element event ...'(e)' = event (shorthand)
	{
		$("#sidebar-wrapper").toggleClass("active",true);		//instead on click event toggle active CSS element
		e.preventDefault();										//prevent the default action ("Do not remove as the code
	});

	$("#menu-toggle").bind('click',function(e)					//declare the element event ...'(e)' = event (shorthand)
	{
		$("#sidebar-wrapper").toggleClass("active",true);		//instead on click event toggle active CSS element
		e.preventDefault();										//prevent the default action ("Do not remove as the code
	});															//Close 'function()'

	$('#sidebar-wrapper').mouseleave(function(e)				//declare the jQuery: mouseleave() event
																// - see: ('//api.jquery.com/mouseleave/' for details)
	{
		/*! .toggleClass( className, state ) */
		$('#sidebar-wrapper').toggleClass('active',false);		/* toggleClass: Add or remove one or more classes from each element
																in the set of matched elements, depending on either the class's
																presence or the value of the state argument */
		e.stopPropagation();									//Prevents the event from bubbling up the DOM tree
																// - see: ('//api.jquery.com/event.stopPropagation/' for details)

		e.preventDefault();										// Prevent the default action of the event will not be triggered
																// - see: ('//api.jquery.com/event.preventDefault/' for details)
	});
});
// Closes the sidebar menu on menu-close button click event
$("#menu-close").click(function(e)							//declare the element event ...'(e)' = event (shorthand)
{
															// - will not work otherwise")
	$("#sidebar-wrapper").toggleClass("active");			//instead on click event toggle active CSS element
	e.preventDefault(); 									//prevent the default action ("Do not remove as the code

	/*!
	======================= Notes ===============================
	* see: .sidebar-wrapper.active in: style.css
	==================== END Notes ==============================
	*/
});															//Close 'function()'


// Anchor URL Rewrite
/* $(document).ready(function()
{
	function filterPath(string)
	{
		return string.replace(/^\//,'').replace(/(index|default).[a-zA-Z]{3,4}$/,'').replace(/\/$/,'');
	}

	var locationPath = filterPath(location.pathname);
	var scrollElem = scrollableElement('html', 'body');

	$('a[href*=#]').each(function()
	{
		var thisPath = filterPath(this.pathname) || locationPath;
		if (  locationPath == thisPath
		&& (location.hostname == this.hostname || !this.hostname)
		&& this.hash.replace(/#/,''))
		{
			var $target = $(this.hash), target = this.hash;
			if (target)
			{
				var targetOffset = $target.offset().top -420;
				$(this).bind('click',function(event)
				{
					$(scrollElem).animate({scrollTop: targetOffset}, 1500,'easeOutBounce');
					event.preventDefault();
				});
			}
		}
	});

	// use the first element that is "scrollable"
	function scrollableElement(els)
	{
		for (var i = 0, argLength = arguments.length; i <argLength; i++)
		{
			var el = arguments[i],
			$scrollElement = $(el);
			if ($scrollElement.scrollTop()> 0)
			{
				return el;
			}

			else
			{
				$scrollElement.scrollTop(1);
				var isScrollable = $scrollElement.scrollTop()> 0;
				$scrollElement.scrollTop(0);
				if (isScrollable)
				{
					return el;
				}
			}
		}

		return [];
	}
});*/

// Anchor URL Rewrite
/*$(function()
{
	$('a[href*=#]:not([href=#])').bind('click', function(evt)
	{
		if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') || location.hostname == this.hostname)
		{
			var target = $(this.hash);
			target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
			if (target.length)
			{
				$('html,body').animate({
					scrollTop: target.offset().top
				}, 1500, 'easeInOutExpo');//jQuery easing required for animation effects
				evt.preventDefault();
			}
		}
	});
});*/

/*!


Simply:

	a[href*=#]

		* get all anchors (a) that contains # in href but with:

	:not([href=#])

		* exclude anchors with href exaclty equals to #

example:

	<a href="#step1">yes</a>
	<a href="page.php#step2">yes</a>
	<a href="#">no</a>

		* the selectors get first two anchor but it exclude the last
		source: http://stackoverflow.com/questions/20947529/what-does-ahref-nothref-code-mean

*/
