<cfoutput>
	<p>
		<h5>Key Points:</h5>
		<ul>
			<li>
				The only difference in the Wire itself from the <code>Counter + Data Bindings</code> demo (counter3) is the added combination of <code>livewire:init</code> & <code>component.init</code>
				hooks added to store a reference to the $wire object for this instance of the wire. #scLink("https://cbwire.ortusbooks.com/the-essentials/javascript##javascript-hooks")#
			</li>
			<li>
				All other functionality and code is added in the standard ColdBox view outside the wire and uses the reference to the $wire object 
				for this instance.
			</li>
			<li>
				<code>__Counter4</code> is the reference to the $wire object for this instance of the wire. This is set in the <code>component.init</code> hook.
			</li>
			<li>
				<code>__Counter4.set()</code> and <code>__Counter4.get()</code> functions are used directly in the buttons <code>onClick</code> to set and get the data 
				properties from outside the wire.
			<li>
				<code>raceTheCounters()</code> function exists for 2 purposes:
				<ol>
					<li>
						Entertainment! It will randomly increment the counters at random intervals and let you know which one got to 100 or more first!
					</li>
					<li>
						Demonstrate the reactive nature of the wire and how it can be used to update the data properties and interact with the wire from Javascript outside the wire itself.
					</li>
				</ol>
			</li>
			<li>
				Template Directives used:
				<ol>
					<li><code>wire:model.live</code> - to bind the input field to the data property. The <code>.live</code> adds live updating #scLink("https://cbwire.ortusbooks.com/template-directives/wire-model##live-updating")#</li>
				</ol>
			</li>
		</ul>
	</p>
</cfoutput>