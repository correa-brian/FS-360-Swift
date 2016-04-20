var Question = require('../models/Question');

module.exports = {

	get: function(params, completion){ //completion takes an 'err' and 'response' arg
		Question.find(params, function(err, questions){
			if(err){

				completion(err, null);
				return;
			}


			completion(null, questions);
			return;
		});
	},

	getById: function(id, completion){
		Question.findById(id, function(err, question){
			if(err){

				completion(err, null);
				return;
			}


			completion(null, question);
			return;
		});
	},

	post: function(params, completion){
		Question.create(id, function(err, question){
			if(err){
				completion(err, null);
				return;
			}

			completion(null, profile);
			return;
		});
	}

}