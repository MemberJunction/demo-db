import { Component, Input } from '@angular/core';
import { RegisterClass } from '@memberjunction/global';
import { BaseFormSectionComponent } from '@memberjunction/ng-base-forms';
import { NameSeedEntity } from 'mj_generatedentities';

@RegisterClass(BaseFormSectionComponent, 'Name Seeds.details') // Tell MemberJunction about this class 
@Component({
    selector: 'gen-nameseed-form-details',
    styleUrls: ['../../../../../shared/form-styles.css'],
    template: `<div *ngIf="this.record">
    <div *ngIf="this.EditMode" class="record-form">
                  
        <div class="record-form-row">
            <label class="fieldLabel">Name ID</label>
            <span >{{FormatValue('NameID', 0)}}</span>   
        </div>               
        <div class="record-form-row">
            <label class="fieldLabel">Name</label>
            <kendo-textbox [(ngModel)]="record.Name"  />   
        </div>               
        <div class="record-form-row">
            <label class="fieldLabel">Name Type</label>
            <kendo-dropdownlist [data]="['Middle', 'Last', 'First']" [(ngModel)]="record.NameType!" ></kendo-dropdownlist>   
        </div> 
    </div>
    <div *ngIf="!this.EditMode" class="record-form">
                  
        <div class="record-form-row">
            <label class="fieldLabel">Name ID</label>
            <span >{{FormatValue('NameID', 0)}}</span>
        </div>              
        <div class="record-form-row">
            <label class="fieldLabel">Name</label>
            <span >{{FormatValue('Name', 0)}}</span>
        </div>              
        <div class="record-form-row">
            <label class="fieldLabel">Name Type</label>
            <span >{{FormatValue('NameType', 0)}}</span>
        </div>
    </div>
</div>
    `
})
export class NameSeedDetailsComponent extends BaseFormSectionComponent {
    @Input() override record!: NameSeedEntity;
    @Input() override EditMode: boolean = false;
}

export function LoadNameSeedDetailsComponent() {
    // does nothing, but called in order to prevent tree-shaking from eliminating this component from the build
}
