/**
 * 
 */

$(function(){	
	$("#update-form option").each(function(){
		if($(this).text() == "<%= b.getBoardCategory() %>"){
		}	
	});
});