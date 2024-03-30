import { Component, Input } from '@angular/core';
import { RegisterClass } from '@memberjunction/global';
import { BaseFormSectionComponent } from '@memberjunction/ng-base-forms';
import { JobTitleSeedEntity } from 'mj_generatedentities';

@RegisterClass(BaseFormSectionComponent, 'Job Title Seeds.details') // Tell MemberJunction about this class 
@Component({
    selector: 'gen-jobtitleseed-form-details',
    styleUrls: ['../../../../../shared/form-styles.css'],
    template: `<div *ngIf="this.record">
    <div *ngIf="this.EditMode" class="record-form">
                  
        <div class="record-form-row">
            <label class="fieldLabel">Job Title ID</label>
            <span >{{FormatValue('JobTitleID', 0)}}</span>   
        </div>               
        <div class="record-form-row">
            <label class="fieldLabel">Job Title</label>
            <kendo-textbox [(ngModel)]="record.JobTitle"  />   
        </div> 
    </div>
    <div *ngIf="!this.EditMode" class="record-form">
                  
        <div class="record-form-row">
            <label class="fieldLabel">Job Title ID</label>
            <span >{{FormatValue('JobTitleID', 0)}}</span>
        </div>              
        <div class="record-form-row">
            <label class="fieldLabel">Job Title</label>
            <span >{{FormatValue('JobTitle', 0)}}</span>
        </div>
    </div>
</div>
    `
})
export class JobTitleSeedDetailsComponent extends BaseFormSectionComponent {
    @Input() override record!: JobTitleSeedEntity;
    @Input() override EditMode: boolean = false;
}

export function LoadJobTitleSeedDetailsComponent() {
    // does nothing, but called in order to prevent tree-shaking from eliminating this component from the build
}
