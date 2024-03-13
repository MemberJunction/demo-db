import { Component, Input } from '@angular/core';
import { RegisterClass } from '@memberjunction/global';
import { BaseFormSectionComponent } from '@memberjunction/ng-explorer-core';
import { Registration__eventsEntity } from 'mj_generatedentities';

@RegisterClass(BaseFormSectionComponent, 'Registrations__events.details') // Tell MemberJunction about this class 
@Component({
    selector: 'gen-registration__events-form-details',
    styleUrls: ['../../../../../shared/form-styles.css'],
    template: `<div *ngIf="this.record">
    <div *ngIf="this.EditMode" class="record-form">
                  
        <div class="record-form-row">
            <label class="fieldLabel">Registration ID</label>
            <span >{{FormatValue('RegistrationID', 0)}}</span>   
        </div>               
        <div class="record-form-row">
            <label class="fieldLabel">Event ID</label>
            <kendo-numerictextbox [(value)]="record.EventID" ></kendo-numerictextbox>   
        </div>               
        <div class="record-form-row">
            <label class="fieldLabel">Attendee ID</label>
            <kendo-numerictextbox [(value)]="record.AttendeeID" ></kendo-numerictextbox>   
        </div>               
        <div class="record-form-row">
            <label class="fieldLabel">Registration Date</label>
            <kendo-datepicker [(value)]="record.RegistrationDate" ></kendo-datepicker>   
        </div>               
        <div class="record-form-row">
            <label class="fieldLabel">Registration Fee</label>
            <kendo-numerictextbox [(value)]="record.RegistrationFee" ></kendo-numerictextbox>   
        </div>               
        <div class="record-form-row">
            <label class="fieldLabel">Payment Status</label>
            <kendo-textarea [(ngModel)]="record.PaymentStatus" ></kendo-textarea>   
        </div>               
        <div class="record-form-row">
            <label class="fieldLabel">Status</label>
            <kendo-textarea [(ngModel)]="record.Status" ></kendo-textarea>   
        </div>               
        <div class="record-form-row">
            <label class="fieldLabel">Registration Type</label>
            <kendo-textbox [(ngModel)]="record.RegistrationType"  />   
        </div> 
    </div>
    <div *ngIf="!this.EditMode" class="record-form">
                  
        <div class="record-form-row">
            <label class="fieldLabel">Registration ID</label>
            <span >{{FormatValue('RegistrationID', 0)}}</span>
        </div>              
        <div class="record-form-row">
            <label class="fieldLabel">Event ID</label>
            <span mjFieldLink [record]="record" fieldName="EventID" >{{FormatValue('EventID', 0)}}</span>
        </div>              
        <div class="record-form-row">
            <label class="fieldLabel">Attendee ID</label>
            <span mjFieldLink [record]="record" fieldName="AttendeeID" >{{FormatValue('AttendeeID', 0)}}</span>
        </div>              
        <div class="record-form-row">
            <label class="fieldLabel">Registration Date</label>
            <span >{{FormatValue('RegistrationDate', 0)}}</span>
        </div>              
        <div class="record-form-row">
            <label class="fieldLabel">Registration Fee</label>
            <span >{{FormatValue('RegistrationFee', 0)}}</span>
        </div>              
        <div class="record-form-row">
            <label class="fieldLabel">Payment Status</label>
            <span >{{FormatValue('PaymentStatus', 0)}}</span>
        </div>              
        <div class="record-form-row">
            <label class="fieldLabel">Status</label>
            <span >{{FormatValue('Status', 0)}}</span>
        </div>              
        <div class="record-form-row">
            <label class="fieldLabel">Registration Type</label>
            <span >{{FormatValue('RegistrationType', 0)}}</span>
        </div>
    </div>
</div>
    `
})
export class Registration__eventsDetailsComponent extends BaseFormSectionComponent {
    @Input() override record!: Registration__eventsEntity;
    @Input() override EditMode: boolean = false;
}

export function LoadRegistration__eventsDetailsComponent() {
    // does nothing, but called in order to prevent tree-shaking from eliminating this component from the build
}
