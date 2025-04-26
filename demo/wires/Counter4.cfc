component extends="cbwire.models.Component" {

	// Data properties
	data = {
		"counter1"     : 0,
		"counter2"     : 0,
		"buttonValues" : [ 1, 5, 10, 20 ]
	};

	// Action
	function increment( incrementCounter = "counter1", incrementValue = 1 ){
		data[ incrementCounter ] += incrementValue;
		if ( data[ incrementCounter ] > 100 ) data[ incrementCounter ] = 100;
	}

	function decrement( incrementCounter = "counter1", incrementValue = 1 ){
		data[ incrementCounter ] -= incrementValue;
		if ( data[ incrementCounter ] < 0 ) data[ incrementCounter ] = 0;
	}

}
