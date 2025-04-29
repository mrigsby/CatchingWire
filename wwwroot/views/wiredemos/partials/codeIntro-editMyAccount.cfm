<cfoutput>
	<p>
		<h5>Key Points:</h5>
		<ul>
			<li>
				Dependency Injection of CBSecurity #scLink("https://coldbox-security.ortusbooks.com/")#
			</li>
			<li>
				Locked data properties to prevent modification from incoming client payloads #scLink("https://cbwire.ortusbooks.com/the-essentials/properties")#
			</li>
			<li>
				Two forms & two actions, <code>saveAccount()</code> and <code>changePassword()</code> #scLink("https://cbwire.ortusbooks.com/the-essentials/actions")#
			</li>
			<li>
				Success & Failure UI alerts are added to the response from the server using the <code>js()</code> function added in CBWIRE 4. #scLink("https://cbwire.ortusbooks.com/release-history/whats-new-with-4.0##new-features")#
			</li>
			<li>
				Storing a global reference to the $wire object for this instance of the wire using the <code>livewire:init</code> & <code>component.init</code> events #scLink("https://cbwire.ortusbooks.com/the-essentials/javascript##javascript-hooks")#
			</li>
			<li>
				Template Directives used:
				<ol>
					<li><code>wire:submit</code> - to submit the form and call the action #scLink("https://cbwire.ortusbooks.com/template-directives/wire-submit")#</li>
					<li><code>wire:model</code> - to bind the input field to the data property #scLink("https://cbwire.ortusbooks.com/template-directives/wire-model")#</li>
				</ol>
			</li>
		</ul>
	</p>
</cfoutput>