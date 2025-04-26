<cfoutput>
	<a wire:click.prevent="setSort( 'asc', '#args.column#' )" class="ms-2" style="cursor:n-resize;">
		<i
			class="bi bi-arrow-up-circle-fill <cfif args.data.sort EQ 'asc' AND args.data.sort_col EQ args.column>text-success<cfelse>text-black</cfif>"
		></i>
	</a>
	<a wire:click.prevent="setSort( 'desc', '#args.column#' )" style="cursor:s-resize;">
		<i
			class="bi bi-arrow-down-circle-fill <cfif args.data.sort EQ 'desc' AND args.data.sort_col EQ args.column>text-success<cfelse>text-black</cfif>"
		></i>
	</a>
</cfoutput>
