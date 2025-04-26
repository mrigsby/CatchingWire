<cfoutput>
	<div class="row wireOuterWrapper">
		<div class="col-md-12">
			<div class="progress-group mt-2">
				<span class="badge text-bg-primary mb-2 fs-5">Counter1 Progress Bar</span>
				<span class="float-end">
					<b>#counter1#%</b>
				</span>
				<div class="progress progress" style="height: 25px;">
					<div class="progress-bar text-bg-primary" style="width: #counter1#%"></div>
				</div>
			</div>

			<cfloop index="currentIndex" item="currentItem" array="#buttonValues#">
				<button class="btn btn-warning btn-sm" wire:click="decrement( 'counter1', #currentItem# )">-#currentItem#</button>
				<button class="btn btn-success btn-sm me-3" wire:click="increment( 'counter1', #currentItem# )">+#currentItem#</button>
			</cfloop>

			<div class="progress-group mt-5">
				<span class="badge text-bg-warning mb-2 fs-5">Counter2 Progress Bar</span>
				<span class="float-end">
					<b>#counter2#%</b>
				</span>
				<div class="progress progress" style="height: 25px;">
					<div class="progress-bar text-bg-warning" style="width: #counter2#%"></div>
				</div>
			</div>

			<cfloop index="currentIndex" item="currentItem" array="#buttonValues#">
				<button class="btn btn-warning btn-sm" wire:click="decrement( 'counter2', #currentItem# )">-#currentItem#</button>
				<button class="btn btn-success btn-sm me-3" wire:click="increment( 'counter2', #currentItem# )">+#currentItem#</button>
			</cfloop>

			<div class="row mt-5">
				<div class="col-auto">
					<label for="counter1" class="form-label fs-5 badge text-bg-primary">Counter1</label><br>
					<input type="number" class="form-control-lg" wire:model.live="counter1">
					<div class="form-text">databinding: wire:model.live=&quot;counter1&quot;</div>
				</div>

				<div class="col-auto">
					<label for="counter2" class="form-label fs-5 badge text-bg-warning">Counter2</label><br>
					<input type="number" class="form-control-lg" wire:model.live="counter2">
					<div class="form-text">databinding: wire:model.live=&quot;counter2&quot;</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		document.addEventListener('livewire:init', () => {
			Livewire.hook('component.init', ({ component, cleanup }) => {
				if( component.id === '#_getID()#' ){
					window.__Counter4 = component.$wire;
				}
			});
		});
	</script>
</cfoutput>
