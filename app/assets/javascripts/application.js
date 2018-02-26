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
//= require rails-ujs
//= require materialize
//= require_tree .

function calcFood(food){
	var protein = food.data('food_protein');
	var carb 	= food.data('food_carb');
	var fat 	= food.data('food_fat');
	var kcal 	= food.data('food_kcal');
	var qtd 	= food.val();

	total_protein = protein * qtd;
	total_carb 	= carb * qtd;
	total_fat 	= fat * qtd;
	total_kcal 	= kcal * qtd;

	food.parent().siblings('.td_food_protein').text(total_protein.toFixed(2));
	food.parent().siblings('.td_food_carb').text(total_carb.toFixed(2));
	food.parent().siblings('.td_food_fat').text(total_fat.toFixed(2));
	food.parent().siblings('.td_food_kcal').text(total_kcal.toFixed(2));
}

$(document).ready(function(){
	$('#a_add_meal').click(function(){
		
		var diet_id = $(this).data('diet_id');
		
		$.ajax({
			url: '/diets/'+diet_id+'/meals/add.js',
			type: 'get',
			dataType: 'script',
			data: {diet_id: diet_id},
		});
		
		e.preventFalse();
	});

	$('.modal').modal();

	$('.selectModalTd').click(function(){
		$('#select-food').modal('open');
	});

	$('.search_food').keyup(function(){
		var key = $(this).val();
		$('#food-list-search').html(' ');

		$.ajax({
			url: '/foods/search.js',
			type: 'get',
			data: {key: key},
			dataType: 'script'
		});

	});

	$('.input_cell').change(function(){	
		calcFood($(this));
	});

});