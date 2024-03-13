import { Component, Input } from '@angular/core';
import { RegisterClass } from '@memberjunction/global';
import { BaseFormSectionComponent } from '@memberjunction/ng-explorer-core';
import { Company__communityEntity } from 'mj_generatedentities';

@RegisterClass(BaseFormSectionComponent, 'Companies__community.details') // Tell MemberJunction about this class 
@Component({
    selector: 'gen-company__community-form-details',
    styleUrls: ['../../../../../shared/form-styles.css'],
    template: `<div *ngIf="this.record">
    <div *ngIf="this.EditMode" class="record-form">
                  
        <div class="record-form-row">
            <label class="fieldLabel">Company ID</label>
            <span >{{FormatValue('CompanyID', 0)}}</span>   
        </div>               
        <div class="record-form-row">
            <label class="fieldLabel">Company Name</label>
            <kendo-textarea [(ngModel)]="record.CompanyName" ></kendo-textarea>   
        </div>               
        <div class="record-form-row">
            <label class="fieldLabel">Website</label>
            <kendo-textarea [(ngModel)]="record.Website" ></kendo-textarea>   
        </div>               
        <div class="record-form-row">
            <label class="fieldLabel">Industry</label>
            <kendo-textbox [(ngModel)]="record.Industry"  />   
        </div>               
        <div class="record-form-row">
            <label class="fieldLabel">Size</label>
            <kendo-textbox [(ngModel)]="record.Size"  />   
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
            <label class="fieldLabel">Company ID</label>
            <span >{{FormatValue('CompanyID', 0)}}</span>
        </div>              
        <div class="record-form-row">
            <label class="fieldLabel">Company Name</label>
            <span >{{FormatValue('CompanyName', 0)}}</span>
        </div>              
        <div class="record-form-row">
            <label class="fieldLabel">Website</label>
            <span >{{FormatValue('Website', 0)}}</span>
        </div>              
        <div class="record-form-row">
            <label class="fieldLabel">Industry</label>
            <span >{{FormatValue('Industry', 0)}}</span>
        </div>              
        <div class="record-form-row">
            <label class="fieldLabel">Size</label>
            <span >{{FormatValue('Size', 0)}}</span>
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
export class Company__communityDetailsComponent extends BaseFormSectionComponent {
    @Input() override record!: Company__communityEntity;
    @Input() override EditMode: boolean = false;
}

export function LoadCompany__communityDetailsComponent() {
    // does nothing, but called in order to prevent tree-shaking from eliminating this component from the build
}
