class ToastManager {
    constructor( {
			icon = 'bi bi-circle',
			title = 'Notification',
			body = '',
			delay = 600000
		}={} ) {
		this.toastContainer = document.getElementById('catchingwire-toast-container');
		if (! this.toastContainer) {
			this.toastContainer = document.createElement('div');
			this.toastContainer.id = 'catchingwire-toast-container';
			this.toastContainer.className = 'toast-container position-fixed bottom-0 end-0 p-3';
			this.toastContainer.style.zIndex = '11';

			// document.body.appendChild(this.toastContainer);

			const appWrapper = document.querySelector('.app-wrapper');
			appWrapper.appendChild(this.toastContainer);
		}
		this.toastId = `toast-${Date.now()}`;
        this.icon = icon;
        this.title = title;
        this.body = body;
		this.delay = delay;
    }

    setIcon(iconHtml) {
        this.icon = iconHtml;
        return this;
    }

    setTitle(title) {
        this.title = title;
        return this;
    }

	setDelay(delay) {
		this.delay = delay;
		return this;
	}

    setBody(body) {
        this.body = body;
        return this;
    }

    show( body = '' ) {

		if( body.length > 0 ) this.body = body;

        const toastElement = document.createElement('div');
        toastElement.className = 'toast toast-success fade hide';
        toastElement.id = this.toastId;
        toastElement.setAttribute('role', 'alert');
        toastElement.setAttribute('aria-live', 'assertive');
        toastElement.setAttribute('aria-atomic', 'true');
        const toastInnerHtml = `
            <div class="toast-header">
                <i class="${this.icon} me-2"></i>
                <strong class="me-auto">${this.title}</strong>
				<small>&nbsp;</small>
                <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
            </div>
            <div class="toast-body">
                ${this.body || htmlContent}
            </div>
        `;

        toastElement.innerHTML = toastInnerHtml;
        this.toastContainer.appendChild(toastElement);

        const bootstrapToast = new bootstrap.Toast(toastElement, {
            autohide: true,
            delay: this.delay
        });
        bootstrapToast.show();
        toastElement.addEventListener('hidden.bs.toast', () => {
            toastElement.remove();
        });
		
        return this;
    }
}