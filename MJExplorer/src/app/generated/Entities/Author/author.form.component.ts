import { Component } from '@angular/core';
import { AuthorEntity } from 'mj_generatedentities';
import { RegisterClass } from '@memberjunction/global';
import { BaseFormComponent } from '@memberjunction/ng-explorer-core';
import { LoadAuthorDetailsComponent } from "./sections/details.component"
@RegisterClass(BaseFormComponent, 'Authors') // Tell MemberJunction about this class
@Component({
    selector: 'gen-author-form',
    templateUrl: './author.form.component.html',
    styleUrls: ['../../../../shared/form-styles.css']
})
export class AuthorFormComponent extends BaseFormComponent {
    public record!: AuthorEntity;
} 

export function LoadAuthorFormComponent() {
    LoadAuthorDetailsComponent();
}
