export class Badge {
    id: string;
    picture: string;
    type: string;
    description: string;
    
    constructor(data: Partial<Badge>) {
        Object.assign(this, data);
      }
}
