import { LightningElement, api } from 'lwc';
import FlowModal from 'c/flowModal';

export default class FlowLauncherButton extends LightningElement {
    @api recordId;
    @api flowName;
    @api flowLabel;
    @api buttonLabel;
    @api buttonVariant;
    @api buttonStretch = false;
    @api showButtonIcon = false;
    @api buttonIconName = 'utility:flow';
    @api buttonIconPosition = 'left';
    @api modalSize;
    @api hideOnCompletedFlow = false;
    @api includeRecordId = false;

    flowIsComplete = false;

    get showButton() {
        return (!this.hideOnCompletedFlow || !this.flowIsComplete);
    }

    async handleButtonClick() {
        const result = await FlowModal.open({
            size: this.modalSize,
            description: 'Run flow in modal window',
            flowLabel: this.flowLabel,
            flowName: this.flowName,
            includeRecordId: this.includeRecordId,
            recordId: this.recordId
        });
        if (result == 'success') {
            this.flowIsComplete = true;
        } else if (result == 'undefined') {
            console.log('::::: flow was not completed');
        }
    }
}