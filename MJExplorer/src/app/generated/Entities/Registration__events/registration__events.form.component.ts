import { Component } from '@angular/core';
import { Registration__eventsEntity } from 'mj_generatedentities';
import { RegisterClass } from '@memberjunction/global';
import { BaseFormComponent } from '@memberjunction/ng-explorer-core';
import { LoadRegistration__eventsDetailsComponent } from "./sections/details.component"
@RegisterClass(BaseFormComponent, 'Registrations__events') // Tell MemberJunction about this class
@Component({
    selector: 'gen-registration__events-form',
    templateUrl: './registration__events.form.component.html',
    styleUrls: ['../../../../shared/form-styles.css']
})
export class Registration__eventsFormComponent extends BaseFormComponent {
    public record!: Registration__eventsEntity;
} 

export function LoadRegistration__eventsFormComponent() {
    LoadRegistration__eventsDetailsComponent();
}
