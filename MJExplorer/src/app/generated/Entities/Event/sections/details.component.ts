import { Component, Input } from '@angular/core';
import { RegisterClass } from '@memberjunction/global';
import { BaseFormSectionComponent } from '@memberjunction/ng-explorer-core';
import { EventEntity } from 'mj_generatedentities';

@RegisterClass(BaseFormSectionComponent, 'Events.details') // Tell MemberJunction about this class 
@Component({
    selector: 'gen-event-form-details',
    styleUrls: ['../../../../../shared/form-styles.css'],
    template: `<div *ngIf="this.record">
    <div *ngIf="this.EditMode" class="record-form">
                  
        <div class="record-form-row">
            <label class="fieldLabel">Event ID</label>
            <span >{{FormatValue('EventID', 0)}}</span>   
        </div>               
        <div class="record-form-row">
            <label class="fieldLabel">Event Name</label>
            <kendo-textarea [(ngModel)]="record.EventName" ></kendo-textarea>   
        </div>               
        <div class="record-form-row">
            <label class="fieldLabel">Location</label>
            <kendo-textarea [(ngModel)]="record.Location" ></kendo-textarea>   
        </div>               
        <div class="record-form-row">
            <label class="fieldLabel">Description</label>
            <kendo-textbox [(ngModel)]="record.Description"  />   
        </div>               
        <div class="record-form-row">
            <label class="fieldLabel">Start Date</label>
            <kendo-datepicker [(value)]="record.StartDate" ></kendo-datepicker>   
        </div>               
        <div class="record-form-row">
            <label class="fieldLabel">End Date</label>
            <kendo-datepicker [(value)]="record.EndDate" ></kendo-datepicker>   
        </div>               
        <div class="record-form-row">
            <label class="fieldLabel">Address</label>
            <kendo-textarea [(ngModel)]="record.Address" ></kendo-textarea>   
        </div>               
        <div class="record-form-row">
            <label class="fieldLabel">City</label>
            <kendo-textbox [(ngModel)]="record.City"  />   
        </div>               
        <div class="record-form-row">
            <label class="fieldLabel">State</label>
            <kendo-textbox [(ngModel)]="record.State"  />   
        </div>               
        <div class="record-form-row">
            <label class="fieldLabel">Zip</label>
            <kendo-textbox [(ngModel)]="record.Zip"  />   
        </div>               
        <div class="record-form-row">
            <label class="fieldLabel">Country</label>
            <kendo-textbox [(ngModel)]="record.Country"  />   
        </div>               
        <div class="record-form-row">
            <label class="fieldLabel">Event Type</label>
            <kendo-textbox [(ngModel)]="record.EventType"  />   
        </div>               
        <div class="record-form-row">
            <label class="fieldLabel">Member Price</label>
            <kendo-numerictextbox [(value)]="record.MemberPrice" ></kendo-numerictextbox>   
        </div>               
        <div class="record-form-row">
            <label class="fieldLabel">Non Member Price</label>
            <kendo-numerictextbox [(value)]="record.NonMemberPrice" ></kendo-numerictextbox>   
        </div>               
        <div class="record-form-row">
            <label class="fieldLabel">Speaker Price</label>
            <kendo-numerictextbox [(value)]="record.SpeakerPrice" ></kendo-numerictextbox>   
        </div> 
    </div>
    <div *ngIf="!this.EditMode" class="record-form">
                  
        <div class="record-form-row">
            <label class="fieldLabel">Event ID</label>
            <span >{{FormatValue('EventID', 0)}}</span>
        </div>              
        <div class="record-form-row">
            <label class="fieldLabel">Event Name</label>
            <span >{{FormatValue('EventName', 0)}}</span>
        </div>              
        <div class="record-form-row">
            <label class="fieldLabel">Location</label>
            <span >{{FormatValue('Location', 0)}}</span>
        </div>              
        <div class="record-form-row">
            <label class="fieldLabel">Description</label>
            <span >{{FormatValue('Description', 0)}}</span>
        </div>              
        <div class="record-form-row">
            <label class="fieldLabel">Start Date</label>
            <span >{{FormatValue('StartDate', 0)}}</span>
        </div>              
        <div class="record-form-row">
            <label class="fieldLabel">End Date</label>
            <span >{{FormatValue('EndDate', 0)}}</span>
        </div>              
        <div class="record-form-row">
            <label class="fieldLabel">Address</label>
            <span >{{FormatValue('Address', 0)}}</span>
        </div>              
        <div class="record-form-row">
            <label class="fieldLabel">City</label>
            <span >{{FormatValue('City', 0)}}</span>
        </div>              
        <div class="record-form-row">
            <label class="fieldLabel">State</label>
            <span >{{FormatValue('State', 0)}}</span>
        </div>              
        <div class="record-form-row">
            <label class="fieldLabel">Zip</label>
            <span >{{FormatValue('Zip', 0)}}</span>
        </div>              
        <div class="record-form-row">
            <label class="fieldLabel">Country</label>
            <span >{{FormatValue('Country', 0)}}</span>
        </div>              
        <div class="record-form-row">
            <label class="fieldLabel">Event Type</label>
            <span >{{FormatValue('EventType', 0)}}</span>
        </div>              
        <div class="record-form-row">
            <label class="fieldLabel">Member Price</label>
            <span >{{FormatValue('MemberPrice', 0)}}</span>
        </div>              
        <div class="record-form-row">
            <label class="fieldLabel">Non Member Price</label>
            <span >{{FormatValue('NonMemberPrice', 0)}}</span>
        </div>              
        <div class="record-form-row">
            <label class="fieldLabel">Speaker Price</label>
            <span >{{FormatValue('SpeakerPrice', 0)}}</span>
        </div>
    </div>
</div>
    `
})
export class EventDetailsComponent extends BaseFormSectionComponent {
    @Input() override record!: EventEntity;
    @Input() override EditMode: boolean = false;
}

export function LoadEventDetailsComponent() {
    // does nothing, but called in order to prevent tree-shaking from eliminating this component from the build
}
