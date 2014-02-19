var dyatelCommon = angular.module('dyatelCommon', [ ]);

dyatelCommon.filter('unsafe', function($sce) {
	return function(val) {
		return $sce.trustAsHtml(val);
	};
});

ctrlrModule.directive('focusMe', function ($timeout) {
	return {
		link: function (scope, element, attrs, model) {
			$timeout(function () {
				element[0].focus();
			});
		}
	};
});

ctrlrModule.filter('capitalize', function() {
	return function(input, scope) {
		return input.substring(0,1).toUpperCase()+input.substring(1);
	}
});

