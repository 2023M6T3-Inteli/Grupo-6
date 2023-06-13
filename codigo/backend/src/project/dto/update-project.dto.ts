import { PartialType } from '@nestjs/mapped-types';
import { CreateProjectDto } from './create-project.dto';

// Update project body definition
export class UpdateProjectDto extends PartialType(CreateProjectDto) {
    id: string;
    title: string;
    description: string;
    start_project: string;
    end_project: string;
    start_subscription: string;
    end_subscription: string;
    area: string;
    status: string;
}
