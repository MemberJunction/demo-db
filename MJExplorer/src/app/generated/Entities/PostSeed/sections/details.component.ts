import { Component, Input } from '@angular/core';
import { RegisterClass } from '@memberjunction/global';
import { BaseFormSectionComponent } from '@memberjunction/ng-explorer-core';
import { PostSeedEntity } from 'mj_generatedentities';

@RegisterClass(BaseFormSectionComponent, 'Post Seeds.details') // Tell MemberJunction about this class 
@Component({
    selector: 'gen-postseed-form-details',
    styleUrls: ['../../../../../shared/form-styles.css'],
    template: `<div *ngIf="this.record">
    <div *ngIf="this.EditMode" class="record-form">
                  
        <div class="record-form-row">
            <label class="fieldLabel">Post Seed ID</label>
            <span >{{FormatValue('PostSeedID', 0)}}</span>   
        </div>               
        <div class="record-form-row">
            <label class="fieldLabel">Content</label>
            <kendo-textbox [(ngModel)]="record.Content"  />   
        </div>               
        <div class="record-form-row">
            <label class="fieldLabel">Type</label>
            <kendo-textbox [(ngModel)]="record.Type"  />   
        </div> 
    </div>
    <div *ngIf="!this.EditMode" class="record-form">
                  
        <div class="record-form-row">
            <label class="fieldLabel">Post Seed ID</label>
            <span >{{FormatValue('PostSeedID', 0)}}</span>
        </div>              
        <div class="record-form-row">
            <label class="fieldLabel">Content</label>
            <span >{{FormatValue('Content', 0)}}</span>
        </div>              
        <div class="record-form-row">
            <label class="fieldLabel">Type</label>
            <span >{{FormatValue('Type', 0)}}</span>
        </div>
    </div>
</div>
    `
})
export class PostSeedDetailsComponent extends BaseFormSectionComponent {
    @Input() override record!: PostSeedEntity;
    @Input() override EditMode: boolean = false;
}

export function LoadPostSeedDetailsComponent() {
    // does nothing, but called in order to prevent tree-shaking from eliminating this component from the build
}
