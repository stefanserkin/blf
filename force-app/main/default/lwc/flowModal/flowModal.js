import { api } from 'lwc';
import LightningModal from 'lightning/modal';

export default class FlowModal extends LightningModal {
    /**
     * flowLabel: friendly name for the flow
     * flowName: api name of the flow to run
     */
    @api flowLabel;
    @api flowName;

    // Handle flow status events
    handleStatusChange(event) {
        if (event.detail.status === "FINISHED") {
            this.dispatchEvent( new CustomEvent('success') );
        }
    }

}