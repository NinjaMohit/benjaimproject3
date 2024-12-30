import { Content } from './models/entities/content.entity';
import { Repository } from 'typeorm';
export declare class ContentService {
    private contentRepositiry;
    constructor(contentRepositiry: Repository<Content>);
    findContentByID(id: number): Promise<Content>;
}
