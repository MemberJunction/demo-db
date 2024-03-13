import { Component, Input } from '@angular/core';
import { RegisterClass } from '@memberjunction/global';
import { BaseFormSectionComponent } from '@memberjunction/ng-explorer-core';
import { AuthorEntity } from 'mj_generatedentities';

@RegisterClass(BaseFormSectionComponent, 'Authors.details') // Tell MemberJunction about this class 
@Component({
    selector: 'gen-author-form-details',
    styleUrls: ['../../../../../shared/form-styles.css'],
    template: `<div *ngIf="this.record">
    <div *ngIf="this.EditMode" class="record-form">
                  
        <div class="record-form-row">
            <label class="fieldLabel">Author ID</label>
            <span >{{FormatValue('AuthorID', 0)}}</span>   
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
            <label class="fieldLabel">Zip Code</label>
            <kendo-textbox [(ngModel)]="record.ZipCode"  />   
        </div>               
        <div class="record-form-row">
            <label class="fieldLabel">Country</label>
            <kendo-textbox [(ngModel)]="record.Country"  />   
        </div> 
    </div>
    <div *ngIf="!this.EditMode" class="record-form">
                  
        <div class="record-form-row">
            <label class="fieldLabel">Author ID</label>
            <span >{{FormatValue('AuthorID', 0)}}</span>
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
            <label class="fieldLabel">Zip Code</label>
            <span >{{FormatValue('ZipCode', 0)}}</span>
        </div>              
        <div class="record-form-row">
            <label class="fieldLabel">Country</label>
            <span >{{FormatValue('Country', 0)}}</span>
        </div>
    </div>
</div>
    `
})
export class AuthorDetailsComponent extends BaseFormSectionComponent {
    @Input() override record!: AuthorEntity;
    @Input() override EditMode: boolean = false;
}

export function LoadAuthorDetailsComponent() {
    // does nothing, but called in order to prevent tree-shaking from eliminating this component from the build
}
