import { Component, Input } from '@angular/core';
import { RegisterClass } from '@memberjunction/global';
import { BaseFormSectionComponent } from '@memberjunction/ng-base-forms';
import { ReplySeedEntity } from 'mj_generatedentities';

@RegisterClass(BaseFormSectionComponent, 'Reply Seeds.details') // Tell MemberJunction about this class 
@Component({
    selector: 'gen-replyseed-form-details',
    styleUrls: ['../../../../../shared/form-styles.css'],
    template: `<div *ngIf="this.record">
    <div *ngIf="this.EditMode" class="record-form">
                  
        <div class="record-form-row">
            <label class="fieldLabel">Reply Seed ID</label>
            <span >{{FormatValue('ReplySeedID', 0)}}</span>   
        </div>               
        <div class="record-form-row">
            <label class="fieldLabel">Content</label>
            <kendo-textbox [(ngModel)]="record.Content"  />   
        </div> 
    </div>
    <div *ngIf="!this.EditMode" class="record-form">
                  
        <div class="record-form-row">
            <label class="fieldLabel">Reply Seed ID</label>
            <span >{{FormatValue('ReplySeedID', 0)}}</span>
        </div>              
        <div class="record-form-row">
            <label class="fieldLabel">Content</label>
            <span >{{FormatValue('Content', 0)}}</span>
        </div>
    </div>
</div>
    `
})
export class ReplySeedDetailsComponent extends BaseFormSectionComponent {
    @Input() override record!: ReplySeedEntity;
    @Input() override EditMode: boolean = false;
}

export function LoadReplySeedDetailsComponent() {
    // does nothing, but called in order to prevent tree-shaking from eliminating this component from the build
}
