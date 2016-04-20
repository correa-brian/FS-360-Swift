var mongoose = require('mongoose');

var QuestionSchema = new mongoose.Schema({
	image: {type:String, default:''},
	answer: {type:String, trim:true, lowercase:true, default:''},
	options: {type:Array, default:[]},
	timestamp: {type:Date, default:Date.now}
});

QuestionSchema.methods.summary = function() {
	var summary = {
		'image':this.image,
		'answer':this.answer,
		'options':this.options,
		'timestamp':this.timestamp,
		'id':this._id
	};
	
	return summary;
};

module.exports = mongoose.model('QuestionSchema', QuestionSchema);