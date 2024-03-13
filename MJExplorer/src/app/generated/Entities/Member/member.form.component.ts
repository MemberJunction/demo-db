import { Component } from '@angular/core';
import { MemberEntity } from 'mj_generatedentities';
import { RegisterClass } from '@memberjunction/global';
import { BaseFormComponent } from '@memberjunction/ng-explorer-core';
import { LoadMemberDetailsComponent } from "./sections/details.component"
@RegisterClass(BaseFormComponent, 'Members') // Tell MemberJunction about this class
@Component({
    selector: 'gen-member-form',
    templateUrl: './member.form.component.html',
    styleUrls: ['../../../../shared/form-styles.css']
})
export class MemberFormComponent extends BaseFormComponent {
    public record!: MemberEntity;
} 

export function LoadMemberFormComponent() {
    LoadMemberDetailsComponent();
}
