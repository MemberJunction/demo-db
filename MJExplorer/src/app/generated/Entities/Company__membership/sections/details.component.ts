import { Component, Input } from '@angular/core';
import { RegisterClass } from '@memberjunction/global';
import { BaseFormSectionComponent } from '@memberjunction/ng-base-forms';
import { Company__membershipEntity } from 'mj_generatedentities';

@RegisterClass(BaseFormSectionComponent, 'Companies__membership.details') // Tell MemberJunction about this class 
@Component({
    selector: 'gen-company__membership-form-details',
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
        <div class="record-form-row">
            <label class="fieldLabel">Tax ID</label>
            <kendo-textbox [(ngModel)]="record.TaxID"  />   
        </div>               
        <div class="record-form-row">
            <label class="fieldLabel">Subsection</label>
            <kendo-numerictextbox [(value)]="record.Subsection!" ></kendo-numerictextbox>   
        </div>               
        <div class="record-form-row">
            <label class="fieldLabel">Total Revenue</label>
            <kendo-numerictextbox [(value)]="record.TotalRevenue!" ></kendo-numerictextbox>   
        </div>               
        <div class="record-form-row">
            <label class="fieldLabel">Information Technology Expense</label>
            <kendo-numerictextbox [(value)]="record.InformationTechnologyExpense!" ></kendo-numerictextbox>   
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
        <div class="record-form-row">
            <label class="fieldLabel">Tax ID</label>
            <span >{{FormatValue('TaxID', 0)}}</span>
        </div>              
        <div class="record-form-row">
            <label class="fieldLabel">Subsection</label>
            <span >{{FormatValue('Subsection', 0)}}</span>
        </div>              
        <div class="record-form-row">
            <label class="fieldLabel">Total Revenue</label>
            <span >{{FormatValue('TotalRevenue', 0)}}</span>
        </div>              
        <div class="record-form-row">
            <label class="fieldLabel">Information Technology Expense</label>
            <span >{{FormatValue('InformationTechnologyExpense', 0)}}</span>
        </div>
    </div>
</div>
    `
})
export class Company__membershipDetailsComponent extends BaseFormSectionComponent {
    @Input() override record!: Company__membershipEntity;
    @Input() override EditMode: boolean = false;
}

export function LoadCompany__membershipDetailsComponent() {
    // does nothing, but called in order to prevent tree-shaking from eliminating this component from the build
}
