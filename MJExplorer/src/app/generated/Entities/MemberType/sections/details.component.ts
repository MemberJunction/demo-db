import { Component, Input } from '@angular/core';
import { RegisterClass } from '@memberjunction/global';
import { BaseFormSectionComponent } from '@memberjunction/ng-explorer-core';
import { MemberTypeEntity } from 'mj_generatedentities';

@RegisterClass(BaseFormSectionComponent, 'Member Types.details') // Tell MemberJunction about this class 
@Component({
    selector: 'gen-membertype-form-details',
    styleUrls: ['../../../../../shared/form-styles.css'],
    template: `<div *ngIf="this.record">
    <div *ngIf="this.EditMode" class="record-form">
                  
        <div class="record-form-row">
            <label class="fieldLabel">Member Type ID</label>
            <span >{{FormatValue('MemberTypeID', 0)}}</span>   
        </div>               
        <div class="record-form-row">
            <label class="fieldLabel">Type Name</label>
            <kendo-textbox [(ngModel)]="record.TypeName"  />   
        </div>               
        <div class="record-form-row">
            <label class="fieldLabel">Description</label>
            <kendo-textbox [(ngModel)]="record.Description"  />   
        </div>               
        <div class="record-form-row">
            <label class="fieldLabel">Annual Dues</label>
            <kendo-numerictextbox [(value)]="record.AnnualDues" ></kendo-numerictextbox>   
        </div> 
    </div>
    <div *ngIf="!this.EditMode" class="record-form">
                  
        <div class="record-form-row">
            <label class="fieldLabel">Member Type ID</label>
            <span >{{FormatValue('MemberTypeID', 0)}}</span>
        </div>              
        <div class="record-form-row">
            <label class="fieldLabel">Type Name</label>
            <span >{{FormatValue('TypeName', 0)}}</span>
        </div>              
        <div class="record-form-row">
            <label class="fieldLabel">Description</label>
            <span >{{FormatValue('Description', 0)}}</span>
        </div>              
        <div class="record-form-row">
            <label class="fieldLabel">Annual Dues</label>
            <span >{{FormatValue('AnnualDues', 0)}}</span>
        </div>
    </div>
</div>
    `
})
export class MemberTypeDetailsComponent extends BaseFormSectionComponent {
    @Input() override record!: MemberTypeEntity;
    @Input() override EditMode: boolean = false;
}

export function LoadMemberTypeDetailsComponent() {
    // does nothing, but called in order to prevent tree-shaking from eliminating this component from the build
}
