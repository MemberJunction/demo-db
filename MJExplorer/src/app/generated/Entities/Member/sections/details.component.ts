import { Component, Input } from '@angular/core';
import { RegisterClass } from '@memberjunction/global';
import { BaseFormSectionComponent } from '@memberjunction/ng-explorer-core';
import { MemberEntity } from 'mj_generatedentities';

@RegisterClass(BaseFormSectionComponent, 'Members.details') // Tell MemberJunction about this class 
@Component({
    selector: 'gen-member-form-details',
    styleUrls: ['../../../../../shared/form-styles.css'],
    template: `<div *ngIf="this.record">
    <div *ngIf="this.EditMode" class="record-form">
                  
        <div class="record-form-row">
            <label class="fieldLabel">Member ID</label>
            <span >{{FormatValue('MemberID', 0)}}</span>   
        </div>               
        <div class="record-form-row">
            <label class="fieldLabel">Company ID</label>
            <kendo-numerictextbox [(value)]="record.CompanyID" ></kendo-numerictextbox>   
        </div>               
        <div class="record-form-row">
            <label class="fieldLabel">Email</label>
            <kendo-textarea [(ngModel)]="record.Email" ></kendo-textarea>   
        </div>               
        <div class="record-form-row">
            <label class="fieldLabel">First Name</label>
            <kendo-textbox [(ngModel)]="record.FirstName"  />   
        </div>               
        <div class="record-form-row">
            <label class="fieldLabel">Last Name</label>
            <kendo-textbox [(ngModel)]="record.LastName"  />   
        </div>               
        <div class="record-form-row">
            <label class="fieldLabel">Job Title</label>
            <kendo-textbox [(ngModel)]="record.JobTitle"  />   
        </div>               
        <div class="record-form-row">
            <label class="fieldLabel">Join Date</label>
            <kendo-datepicker [(value)]="record.JoinDate" ></kendo-datepicker>   
        </div>               
        <div class="record-form-row">
            <label class="fieldLabel">Member Type ID</label>
            <kendo-numerictextbox [(value)]="record.MemberTypeID" ></kendo-numerictextbox>   
        </div> 
    </div>
    <div *ngIf="!this.EditMode" class="record-form">
                  
        <div class="record-form-row">
            <label class="fieldLabel">Member ID</label>
            <span >{{FormatValue('MemberID', 0)}}</span>
        </div>              
        <div class="record-form-row">
            <label class="fieldLabel">Company ID</label>
            <span mjFieldLink [record]="record" fieldName="CompanyID" >{{FormatValue('CompanyID', 0)}}</span>
        </div>              
        <div class="record-form-row">
            <label class="fieldLabel">Email</label>
            <span >{{FormatValue('Email', 0)}}</span>
        </div>              
        <div class="record-form-row">
            <label class="fieldLabel">First Name</label>
            <span >{{FormatValue('FirstName', 0)}}</span>
        </div>              
        <div class="record-form-row">
            <label class="fieldLabel">Last Name</label>
            <span >{{FormatValue('LastName', 0)}}</span>
        </div>              
        <div class="record-form-row">
            <label class="fieldLabel">Job Title</label>
            <span >{{FormatValue('JobTitle', 0)}}</span>
        </div>              
        <div class="record-form-row">
            <label class="fieldLabel">Join Date</label>
            <span >{{FormatValue('JoinDate', 0)}}</span>
        </div>              
        <div class="record-form-row">
            <label class="fieldLabel">Member Type ID</label>
            <span mjFieldLink [record]="record" fieldName="MemberTypeID" >{{FormatValue('MemberTypeID', 0)}}</span>
        </div>
    </div>
</div>
    `
})
export class MemberDetailsComponent extends BaseFormSectionComponent {
    @Input() override record!: MemberEntity;
    @Input() override EditMode: boolean = false;
}

export function LoadMemberDetailsComponent() {
    // does nothing, but called in order to prevent tree-shaking from eliminating this component from the build
}
