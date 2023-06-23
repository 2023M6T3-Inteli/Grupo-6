export class Post {
    id: string;
    title: string;
    description: string;
    category: string;
    createdAt: string;
    creator: string;
  
    constructor(data: Partial<Post>) {
      Object.assign(this, data);
    }
  }
  