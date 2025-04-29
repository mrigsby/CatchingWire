<cfoutput>
	#wire( "Counter4" )#

	<h3 class="mt-5">Javascript Outside The Wire!</h3>

	<div class="row mt-3">
		<label class="col-sm-2 col-form-label-lg">Counter1</label>
		<div class="col-sm-5">
			<button type="button" class="btn btn-primary" onclick="__Counter4.set( 'counter1', 0 );">
				<i class="bi bi-code-slash"></i> __Counter4.set( 'counter1', 0 )
			</button>
		</div>
		<div class="col-sm-5">
			<button type="button" class="btn btn-primary" onclick="alert( __Counter4.get( 'counter1' ) );">
				<i class="bi bi-code-slash"></i> alert( __Counter4.get( 'counter1' ) )
			</button>
		</div>
	</div>

	<div class="row mt-3 mb-3">
		<label class="col-sm-2 col-form-label-lg">Counter2</label>
		<div class="col-sm-5">
			<button type="button" class="btn btn-warning" onclick="__Counter4.set( 'counter2', 0 );">
				<i class="bi bi-code-slash"></i> __Counter4.set( 'counter2', 0 )
			</button>
		</div>
		<div class="col-sm-5">
			<button type="button" class="btn btn-warning" onclick="alert( __Counter4.get( 'counter2' ) );">
				<i class="bi bi-code-slash"></i> alert( __Counter4.get( 'counter2' ) )
			</button>
		</div>
	</div>

	<button type="button" class="btn btn-success" onclick="raceTheCounters();"><i class="bi bi-code-slash"></i> raceTheCounters()</button>

	<h4 class="" id="raceWinner"></h4>

	<script>
		async function raceTheCounters() {
			// Reset the counters to 0
			__Counter4.set( "counter1", 0 );
			__Counter4.set( "counter2", 0 );
			// reset the winner display
			const elRaceWinner     = document.getElementById('raceWinner');
			elRaceWinner.className = "";
			elRaceWinner.innerHTML = "";
			let raceWinnerLabel = "";
			// while loop adding random values between 1 and 7 until one of the counters exceeds 99
			while ( raceWinnerLabel.length === 0 ) {
				__Counter4.set( "counter1", __Counter4.counter1 + Math.floor( Math.random() * 7 ) + 1 );
				__Counter4.set( "counter2", __Counter4.counter2 + Math.floor( Math.random() * 7 ) + 1 );
				if( __Counter4.counter1 > 99 || __Counter4.counter2 > 99 ){
					if( __Counter4.counter1 < __Counter4.counter2 ) {
						elRaceWinner.className = "text-warning fw-bold mt-3";
						raceWinnerLabel = "Counter2 Wins!";
					} else if ( __Counter4.counter1 > __Counter4.counter2 ) {
						elRaceWinner.className = "text-primary fw-bold mt-3";
						raceWinnerLabel = "Counter1 Wins!";
					} else {
						elRaceWinner.className = "text-success fw-bold mt-3";
						raceWinnerLabel = "It was a tie!";
					}
				}else{
					await sleep( Math.floor( Math.random() * 500 ) + 1 );
				}
			}
			// display winner on the screen
			elRaceWinner.innerHTML = raceWinnerLabel
		}

		// add a sleep utility function
		function sleep(ms) {
			return new Promise(resolve => setTimeout(resolve, ms));
		}
	</script>
</cfoutput>
<!--- SHOWCODE : REMOVE BELOW --->
<cfoutput>
	#view(
		"wiredemos/showCode",
		{
			"codeIntro" : "/views/wiredemos/partials/codeIntro-counter4.cfm",
			"files" : [
				"/views/wiredemos/Counter4.cfm",
				"/wires/Counter4.cfc",
				"/wires/Counter4.cfm"
			]
		}
	)#
</cfoutput>
