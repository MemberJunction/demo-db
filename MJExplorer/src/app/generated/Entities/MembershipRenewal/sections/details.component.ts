import { Component, Input } from '@angular/core';
import { RegisterClass } from '@memberjunction/global';
import { BaseFormSectionComponent } from '@memberjunction/ng-explorer-core';
import { MembershipRenewalEntity } from 'mj_generatedentities';

@RegisterClass(BaseFormSectionComponent, 'Membership Renewals.details') // Tell MemberJunction about this class 
@Component({
    selector: 'gen-membershiprenewal-form-details',
    styleUrls: ['../../../../../shared/form-styles.css'],
    template: `<div *ngIf="this.record">
    <div *ngIf="this.EditMode" class="record-form">
                  
        <div class="record-form-row">
            <label class="fieldLabel">Renewal ID</label>
            <span >{{FormatValue('RenewalID', 0)}}</span>   
        </div>               
        <div class="record-form-row">
            <label class="fieldLabel">Member ID</label>
            <kendo-numerictextbox [(value)]="record.MemberID" ></kendo-numerictextbox>   
        </div>               
        <div class="record-form-row">
            <label class="fieldLabel">Renewal Date</label>
            <kendo-datepicker [(value)]="record.RenewalDate" ></kendo-datepicker>   
        </div>               
        <div class="record-form-row">
            <label class="fieldLabel">Payment Amount</label>
            <kendo-numerictextbox [(value)]="record.PaymentAmount" ></kendo-numerictextbox>   
        </div>               
        <div class="record-form-row">
            <label class="fieldLabel">Payment Status</label>
            <kendo-textarea [(ngModel)]="record.PaymentStatus" ></kendo-textarea>   
        </div> 
    </div>
    <div *ngIf="!this.EditMode" class="record-form">
                  
        <div class="record-form-row">
            <label class="fieldLabel">Renewal ID</label>
            <span >{{FormatValue('RenewalID', 0)}}</span>
        </div>              
        <div class="record-form-row">
            <label class="fieldLabel">Member ID</label>
            <span mjFieldLink [record]="record" fieldName="MemberID" >{{FormatValue('MemberID', 0)}}</span>
        </div>              
        <div class="record-form-row">
            <label class="fieldLabel">Renewal Date</label>
            <span >{{FormatValue('RenewalDate', 0)}}</span>
        </div>              
        <div class="record-form-row">
            <label class="fieldLabel">Payment Amount</label>
            <span >{{FormatValue('PaymentAmount', 0)}}</span>
        </div>              
        <div class="record-form-row">
            <label class="fieldLabel">Payment Status</label>
            <span >{{FormatValue('PaymentStatus', 0)}}</span>
        </div>
    </div>
</div>
    `
})
export class MembershipRenewalDetailsComponent extends BaseFormSectionComponent {
    @Input() override record!: MembershipRenewalEntity;
    @Input() override EditMode: boolean = false;
}

export function LoadMembershipRenewalDetailsComponent() {
    // does nothing, but called in order to prevent tree-shaking from eliminating this component from the build
}
