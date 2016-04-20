var express = require('express');
var router = express.Router();
var ProfileController = require('../controllers/ProfileController');

var controllers = {
	'profile': ProfileController
}

/* GET users listing. */
router.get('/:resource', function(req, res, next) {

	var resource = req.params.resource;
	var controller = controllers[resource];

	if(controller == null){
		res.json({
			confirmation: 'fail',
			message: 'Invalid Resource Request'
		});
		
		return;

	}

	controller.get(req.query, function(err, results) {
		if(err){
			res.json({
				confirmation: 'fail',
				message: err
			});

			return;
		}

		res.json({
			confirmation: 'success',
			results: results
		});

		return;
	});

});

router.post('/:resource', function(req, res, next) {
	var resource = req.params.resource;
	var controller = controllers[resource];

	if(controller == null){
		res.json({
			confirmation: 'fail',
			message: 'Invalid Resource Request'
		});

		return;
	}

	controller.post(req.body, function(err, result){
		if(err){
			res.json({
				confirmation: 'fail',
				message: err
			});
			return;
		}

		res.json({
			confirmation: 'success',
			result: result
		});

		return;		
	});

});

module.exports = router;