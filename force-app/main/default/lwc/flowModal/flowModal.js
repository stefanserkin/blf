/**********************************************************
 * @author SerkinSolutions
 * @date 2023
 **********************************************************/
import { api } from 'lwc';
import LightningModal from 'lightning/modal';

export default class FlowModal extends LightningModal {
    /**
     * flowLabel: friendly name for the flow
     * flowName: api name of the flow to run
     * includeRecordId: whether or not to pass the record id to a recordId input variable in the flow
     * recordId: record id to pass to the flow
     */
    @api flowLabel;
    @api flowName;
    @api includeRecordId = false;
    @api recordId;

    get inputVariables() {
        if (this.includeRecordId) {
            return [
                {
                    name: 'recordId',
                    type: 'String',
                    value: this.recordId,
                }
            ];
        } else {
            return;
        }
    }

    // Handle flow status events
    handleStatusChange(event) {
        if (event.detail.status === "FINISHED") {
            this.close('success');
        }
    }

}