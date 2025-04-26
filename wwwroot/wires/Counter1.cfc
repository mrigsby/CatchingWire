component extends="cbwire.models.Component" {

	// Data properties
	data = {
		"counter" : 0 // default value
	};

	// Action
	function increment(){
		data.counter++;
	}

}
