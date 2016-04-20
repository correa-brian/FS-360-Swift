var Profile = require('../models/Profile');

module.exports = {

	get: function(params, completion){ //completion takes an 'err' and 'response' arg
		Profile.find(params, function(err, profiles){
			if(err){

				completion(err, null);
				return;
			}


			completion(null, profiles);
			return;
		});
	},

	getById: function(id, completion){
		Profile.findById(id, function(err, profile){
			if(err){

				completion(err, null);
				return;
			}


			completion(null, profile);
			return;
		});
	},

	post: function(params, completion){
		Profile.create(params, function(err, profile){
			if(err){
				completion(err, null);
				return;
			}

			completion(null, profile);
			return;
		});
	}
}