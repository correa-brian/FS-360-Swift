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
		console.log('Create Question: ' +JSON.stringify(params));
		var options = params['options[]']
		
		if (options != null){
			// console.log('TEST 1')
			params['options'] = params['options[]']
		}

		// params['options'] = options

		Question.create(params, function(err, question){
			if(err){
				completion(err, null);
				return;
			}

			completion(null, question);
			return;
		});
	}

}