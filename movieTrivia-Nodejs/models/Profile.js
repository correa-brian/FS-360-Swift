var mongoose = require('mongoose');

var ProfileSchema = new mongoose.Schema({
	score: {type:Number, default:0},
	username: {type:String, trim:true, default:''},
	timestamp: {type:Date, default:Date.now}
});

ProfileSchema.methods.summary = function() {
	var summary = {
		'score':this.score,
		'username':this.username,
		'timestamp':this.timestamp,
		'id':this._id
	};
	
	return summary;
};

module.exports = mongoose.model('ProfileSchema', ProfileSchema);