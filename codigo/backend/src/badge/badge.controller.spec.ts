import { Test, TestingModule } from '@nestjs/testing';
import { BadgeController } from './badge.controller';
import { BadgeService } from './badge.service';
import { CreateBadgeDto } from './dto/create-badge.dto';
import { Badge } from './entities/badge.entity';

const badgeList = [
  new Badge({
    id: "string",
    picture: "string",
    type: "string",
    description: "string"
    }),
  new Badge({    
    id: "string2",
    picture: "string2",
    type: "string2",
    description: "string2"
    }),
  new Badge({
    id: "string3",
    picture: "string3",
    type: "string3",
    description: "string3"
  }),
]

const newBadgeEntity = new Badge({
    id: "string",
    picture: "string",
    type: "string",
    description: "string"
});

const updatedBadgeEntity = new Badge({
  id: "string",
  picture: "stringeee",
  type: "stringeee",
  description: "stringeee"
});

describe('BadgeController', () => {
  let badgeController: BadgeController;
  let badgeService: BadgeService;

  beforeEach(async () => {
      const module: TestingModule = await Test.createTestingModule({
      controllers: [BadgeController],
      providers: [
        {
          provide: BadgeService,
          useValue: {
            findAll: jest.fn().mockResolvedValue(badgeList),
            create: jest.fn().mockResolvedValue(newBadgeEntity),
            findOneById: jest.fn().mockResolvedValue(newBadgeEntity[0]),
            findOneByTitle: jest.fn().mockResolvedValue(newBadgeEntity[0]),
            findPostsByCreator: jest.fn().mockResolvedValue(badgeList[0]),
            update: jest.fn().mockResolvedValue(updatedBadgeEntity),
          },
        }
      ]
    }).compile();

    badgeController = module.get<BadgeController>(BadgeController);
  });


  describe('findAll', () => {
    it('should return an array of objects with all the posts', async () => {
      // act
      const result = await badgeController.findAll();

      // assert
      expect(result).toEqual(badgeList);
      expect(typeof result).toEqual('object');
      expect(badgeService.findAll).toHaveBeenCalledTimes(1);
      // jest.spyOn(badgeService, 'findAll').mockImplementation(() => result);

      // expect(await badgeController.getAllPosts()).toBe(result);
    });

    it('should return an exception', () => {
      // arrange
      jest.spyOn(badgeService, 'findAll').mockRejectedValueOnce(new Error('Error'));

      // assert
      expect(badgeController.findAll()).rejects.toThrowError('Error');
    })
  });

  describe('create', () => {
    it('should return an object with the created post', async () => {
      // arrange
      const body: CreateBadgeDto = {
        id: "string",
        picture: "string",
        type: "string",
        description: "string"
      };

      // act
      const result = await badgeController.create(body);

      // assert
      expect(result).toEqual(newBadgeEntity);
    });

    it('should return an exception', () => {
      // arrange
      const body: CreateBadgeDto = {
        id: "string",
        picture: "string",
        type: "string",
        description: "string"
      };

      // act
      jest.spyOn(badgeService, 'create').mockRejectedValueOnce(new Error('Error'));
      
      // assert
      expect(badgeController.create(body)).rejects.toThrowError('Error');
    });
  });

  describe('findOne', () => { 
    it('should return an object with the post', async () => {
      //act
      const result = await badgeController.findOne('string');

      // assert
      expect(result).toEqual(badgeList[0]);
      expect(badgeService.findOne).toHaveBeenCalledTimes(1);
      expect(badgeService.findOne).toHaveBeenCalledWith('string');
    });

    it('should return an exception', () => {
      // arrange
      jest
        .spyOn(badgeService, 'findOne')
        .mockRejectedValueOnce(new Error('Error'));
      
      // assert
      expect(badgeController.findOne('string')).rejects.toThrowError('Error');
    });
  });
  
  describe('update', () => {
    it('should return an object with the updated post', async () => {
      // arrange
      const body: CreateBadgeDto = {
        id: "string",
        picture: "stringeee",
        type: "stringeee",
        description: "stringeee"
      };

      // act
      const result = await badgeController.update('string', body);

      // assert
      expect(result).toEqual(updatedBadgeEntity);
      expect(badgeService.update).toHaveBeenCalledTimes(1);
      expect(badgeService.update).toHaveBeenCalledWith('string', body);
    });

    it('should return an exception', () => {
      // arrange
      const body: CreateBadgeDto = {
        id: "string",
        picture: "stringeee",
        type: "stringeee",
        description: "stringeee"
      };

      // act
      jest.spyOn(badgeService, 'update').mockRejectedValueOnce(new Error('Error'));
      
      // assert
      expect(badgeController.update('string', body)).rejects.toThrowError('Error');
    });
  });

  describe('remove', () => {
    it('should delete a post', async () => {
      // act
      const result = await badgeController.remove('string');

      // assert
      expect(result).toBeUndefined();
    });

    it('should return an exception', () => {
      // arrange
      jest.spyOn(badgeService, 'remove').mockRejectedValueOnce(new Error('Error'));
      
      // assert
      expect(badgeController.remove('string')).rejects.toThrowError('Error');
    });
  });
});