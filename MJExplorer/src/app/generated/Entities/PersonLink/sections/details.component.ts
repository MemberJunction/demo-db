import { Component, Input } from '@angular/core';
import { RegisterClass } from '@memberjunction/global';
import { BaseFormSectionComponent } from '@memberjunction/ng-base-forms';
import { PersonLinkEntity } from 'mj_generatedentities';

@RegisterClass(BaseFormSectionComponent, 'Person Links.details') // Tell MemberJunction about this class 
@Component({
    selector: 'gen-personlink-form-details',
    styleUrls: ['../../../../../shared/form-styles.css'],
    template: `<div *ngIf="this.record">
    <div *ngIf="this.EditMode" class="record-form">
                  
        <div class="record-form-row">
            <label class="fieldLabel">Person Link ID</label>
            <span >{{FormatValue('PersonLinkID', 0)}}</span>   
        </div>               
        <div class="record-form-row">
            <label class="fieldLabel">Membership Member ID</label>
            <kendo-numerictextbox [(value)]="record.MembershipMemberID!" ></kendo-numerictextbox>   
        </div>               
        <div class="record-form-row">
            <label class="fieldLabel">Events Attendee ID</label>
            <kendo-numerictextbox [(value)]="record.EventsAttendeeID!" ></kendo-numerictextbox>   
        </div>               
        <div class="record-form-row">
            <label class="fieldLabel">Education Student ID</label>
            <kendo-numerictextbox [(value)]="record.EducationStudentID!" ></kendo-numerictextbox>   
        </div>               
        <div class="record-form-row">
            <label class="fieldLabel">Community Author ID</label>
            <kendo-numerictextbox [(value)]="record.CommunityAuthorID!" ></kendo-numerictextbox>   
        </div>               
        <div class="record-form-row">
            <label class="fieldLabel">Created At</label>
            <span >{{FormatValue('CreatedAt', 0)}}</span>   
        </div>               
        <div class="record-form-row">
            <label class="fieldLabel">Updated At</label>
            <span >{{FormatValue('UpdatedAt', 0)}}</span>   
        </div> 
    </div>
    <div *ngIf="!this.EditMode" class="record-form">
                  
        <div class="record-form-row">
            <label class="fieldLabel">Person Link ID</label>
            <span >{{FormatValue('PersonLinkID', 0)}}</span>
        </div>              
        <div class="record-form-row">
            <label class="fieldLabel">Membership Member ID</label>
            <span mjFieldLink [record]="record" fieldName="MembershipMemberID" >{{FormatValue('MembershipMemberID', 0)}}</span>
        </div>              
        <div class="record-form-row">
            <label class="fieldLabel">Events Attendee ID</label>
            <span mjFieldLink [record]="record" fieldName="EventsAttendeeID" >{{FormatValue('EventsAttendeeID', 0)}}</span>
        </div>              
        <div class="record-form-row">
            <label class="fieldLabel">Education Student ID</label>
            <span mjFieldLink [record]="record" fieldName="EducationStudentID" >{{FormatValue('EducationStudentID', 0)}}</span>
        </div>              
        <div class="record-form-row">
            <label class="fieldLabel">Community Author ID</label>
            <span mjFieldLink [record]="record" fieldName="CommunityAuthorID" >{{FormatValue('CommunityAuthorID', 0)}}</span>
        </div>              
        <div class="record-form-row">
            <label class="fieldLabel">Created At</label>
            <span >{{FormatValue('CreatedAt', 0)}}</span>
        </div>              
        <div class="record-form-row">
            <label class="fieldLabel">Updated At</label>
            <span >{{FormatValue('UpdatedAt', 0)}}</span>
        </div>
    </div>
</div>
    `
})
export class PersonLinkDetailsComponent extends BaseFormSectionComponent {
    @Input() override record!: PersonLinkEntity;
    @Input() override EditMode: boolean = false;
}

export function LoadPersonLinkDetailsComponent() {
    // does nothing, but called in order to prevent tree-shaking from eliminating this component from the build
}
