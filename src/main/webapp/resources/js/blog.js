
 console.log("aa");
 
 var loginservice = (function(){
 	function login(user, callback, error){
 	
 		$.ajax({
			type:'post',
			url:'/loginCheck',
			data: JSON.stringify(user),
			contentType : "application/json;charset=UTF-8",
			success : function(result, status, xhr){
					if(callback){
						callback(result);
					}
			},
			error : function(xhr, status, er){
					if(error){
						error(er);
					}
			}
			
		});
	}
		
	return{
	 login:login
	};
 
 })();