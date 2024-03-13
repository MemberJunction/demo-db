import { Component, Input } from '@angular/core';
import { RegisterClass } from '@memberjunction/global';
import { BaseFormSectionComponent } from '@memberjunction/ng-explorer-core';
import { OrganizationLinkEntity } from 'mj_generatedentities';

@RegisterClass(BaseFormSectionComponent, 'Organization Links.details') // Tell MemberJunction about this class 
@Component({
    selector: 'gen-organizationlink-form-details',
    styleUrls: ['../../../../../shared/form-styles.css'],
    template: `<div *ngIf="this.record">
    <div *ngIf="this.EditMode" class="record-form">
                  
        <div class="record-form-row">
            <label class="fieldLabel">Organization Link ID</label>
            <span >{{FormatValue('OrganizationLinkID', 0)}}</span>   
        </div>               
        <div class="record-form-row">
            <label class="fieldLabel">Membership Company ID</label>
            <kendo-numerictextbox [(value)]="record.MembershipCompanyID" ></kendo-numerictextbox>   
        </div>               
        <div class="record-form-row">
            <label class="fieldLabel">Events Organization ID</label>
            <kendo-numerictextbox [(value)]="record.EventsOrganizationID" ></kendo-numerictextbox>   
        </div>               
        <div class="record-form-row">
            <label class="fieldLabel">Education Company ID</label>
            <kendo-numerictextbox [(value)]="record.EducationCompanyID" ></kendo-numerictextbox>   
        </div>               
        <div class="record-form-row">
            <label class="fieldLabel">Community Company ID</label>
            <kendo-numerictextbox [(value)]="record.CommunityCompanyID" ></kendo-numerictextbox>   
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
            <label class="fieldLabel">Organization Link ID</label>
            <span >{{FormatValue('OrganizationLinkID', 0)}}</span>
        </div>              
        <div class="record-form-row">
            <label class="fieldLabel">Membership Company ID</label>
            <span mjFieldLink [record]="record" fieldName="MembershipCompanyID" >{{FormatValue('MembershipCompanyID', 0)}}</span>
        </div>              
        <div class="record-form-row">
            <label class="fieldLabel">Events Organization ID</label>
            <span mjFieldLink [record]="record" fieldName="EventsOrganizationID" >{{FormatValue('EventsOrganizationID', 0)}}</span>
        </div>              
        <div class="record-form-row">
            <label class="fieldLabel">Education Company ID</label>
            <span mjFieldLink [record]="record" fieldName="EducationCompanyID" >{{FormatValue('EducationCompanyID', 0)}}</span>
        </div>              
        <div class="record-form-row">
            <label class="fieldLabel">Community Company ID</label>
            <span mjFieldLink [record]="record" fieldName="CommunityCompanyID" >{{FormatValue('CommunityCompanyID', 0)}}</span>
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
export class OrganizationLinkDetailsComponent extends BaseFormSectionComponent {
    @Input() override record!: OrganizationLinkEntity;
    @Input() override EditMode: boolean = false;
}

export function LoadOrganizationLinkDetailsComponent() {
    // does nothing, but called in order to prevent tree-shaking from eliminating this component from the build
}
