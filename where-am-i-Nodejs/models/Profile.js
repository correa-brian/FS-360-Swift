var mongoose = require('mongoose');

var ProfileSchema = new mongoose.Schema({
	firstName: {type:String, trim:true, lowercase:true, default:''},
	lastName: {type:String, trim:true, lowercase:true, default:''},
	username: {type:String, trim:true, default:''},
	password: {type:String, default:''},
	timestamp: {type:Date, default:Date.now}
});

ProfileSchema.methods.summary = function() {
	var summary = {
		'firstName':this.firstName,
		'lastName':this.lastName,
		'username':this.username,
		'timestamp':this.timestamp,
		'id':this._id
	};
	
	return summary;
};

module.exports = mongoose.model('ProfileSchema', ProfileSchema);