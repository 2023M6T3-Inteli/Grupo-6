import { Test, TestingModule } from '@nestjs/testing';
import { UserController } from './user.controller';
import { UserService } from './user.service';
import { CreateBadgeDto } from 'src/badge/dto/create-badge.dto';
import { User } from './entities/user.entity';
import { CreatePostDto } from 'src/post/dto/create-post.dto';
import { CreateUserDto } from './dto/create-user.dto';

const userList = [
  new User({
    name: "string",
    role: "string",
    about_me: "string",
    email: "string",
    password: "string",
    createdAt: new Date,
    updatedAt: new Date,
    badges: new CreateBadgeDto,
    posts: new CreatePostDto,
    projects: "string",
    hard_skills: "string",
    soft_skills: "string"
    }),
  new User({    
    name: "string2",
    role: "string2",
    about_me: "string2",
    email: "string2",
    password: "string2",
    createdAt: new Date,
    updatedAt: new Date,
    badges: new CreateBadgeDto,
    posts: new CreatePostDto,
    projects: "string2",
    hard_skills: "string2",
    soft_skills: "string2"
    })
]

const newUserEntity = new User({
    name: "string",
    role: "string",
    about_me: "string",
    email: "string",
    password: "string",
    createdAt: new Date,
    updatedAt: new Date,
    badges: new CreateBadgeDto,
    posts: new CreatePostDto,
    projects: "string",
    hard_skills: "string",
    soft_skills: "string"
});

const updatedUserEntity = new User({
    name: "stringee",
    role: "stringee",
    about_me: "stringee",
    email: "stringee",
    password: "string",
    createdAt: new Date,
    updatedAt: new Date,
    badges: new CreateBadgeDto,
    posts: new CreatePostDto,
    projects: "stringee",
    hard_skills: "stringee",
    soft_skills: "stringee"
});

describe('PostController', () => {
  let userController: UserController;
  let userService: UserService;

  beforeEach(async () => {
      const module: TestingModule = await Test.createTestingModule({
      controllers: [UserController],
      providers: [
        {
          provide: UserService,
          useValue: {
            findAll: jest.fn().mockResolvedValue(userList),
            create: jest.fn().mockResolvedValue(newUserEntity),
            findOneById: jest.fn().mockResolvedValue(newUserEntity[0]),
            findOneByTitle: jest.fn().mockResolvedValue(newUserEntity[0]),
            findPostsByCreator: jest.fn().mockResolvedValue(userList[0]),
            update: jest.fn().mockResolvedValue(updatedUserEntity),
          },
        }
      ]
    }).compile();

    userController = module.get<UserController>(UserController);
  });


  describe('findAll', () => {
    it('should return an array of objects with all the users', async () => {
      // act
      const result = await userController.findAll();

      // assert
      expect(result).toEqual(userList);
      expect(typeof result).toEqual('object');
      expect(userService.findAll).toHaveBeenCalledTimes(1);
      // jest.spyOn(badgeService, 'findAll').mockImplementation(() => result);

      // expect(await badgeController.getAllPosts()).toBe(result);
    });

    it('should return an exception', () => {
      // arrange
      jest.spyOn(userService, 'findAll').mockRejectedValueOnce(new Error('Error'));

      // assert
      expect(userController.findAll()).rejects.toThrowError('Error');
    })
  });

  describe('create', () => {
    it('should return an object with the created user', async () => {
      // arrange
      const body: CreateUserDto = {
        id: "string",
        name: "string",
        role: "string",
        about_me: "string",
        email: "string",
        password: "string",
        createdAt: new Date,
        updatedAt: new Date,
        badges: new CreateBadgeDto,
        posts: new CreatePostDto,
        projects: "string",
        hard_skills: "string",
        soft_skills: "string"
      };

      // act
      const result = await userController.create(body);

      // assert
      expect(result).toEqual(newUserEntity);
    });

    it('should return an exception', () => {
      // arrange
      const body: CreateUserDto = {
        id: "string",
        name: "string",
        role: "string",
        about_me: "string",
        email: "string",
        password: "string",
        createdAt: new Date,
        updatedAt: new Date,
        badges: new CreateBadgeDto,
        posts: new CreatePostDto,
        projects: "string",
        hard_skills: "string",
        soft_skills: "string"
      };

      // act
      jest.spyOn(userService, 'create').mockRejectedValueOnce(new Error('Error'));
      
      // assert
      expect(userController.create(body)).rejects.toThrowError('Error');
    });
  });

  describe('findOne', () => { 
    it('should return an object with the user', async () => {
      //act
      const result = await userController.findOne('string');

      // assert
      expect(result).toEqual(userList[0]);
      expect(userService.findOne).toHaveBeenCalledTimes(1);
      expect(userService.findOne).toHaveBeenCalledWith('string');
    });

    it('should return an exception', () => {
      // arrange
      jest
        .spyOn(userService, 'findOne')
        .mockRejectedValueOnce(new Error('Error'));
      
      // assert
      expect(userController.findOne('string')).rejects.toThrowError('Error');
    });
  });
  
  describe('update', () => {
    it('should return an object with the updated user', async () => {
      // arrange
      const body: CreateUserDto = {
        id: "string",
        name: "stringee",
        role: "stringee",
        about_me: "stringee",
        email: "stringee",
        password: "string",
        createdAt: new Date,
        updatedAt: new Date,
        badges: new CreateBadgeDto,
        posts: new CreatePostDto,
        projects: "stringee",
        hard_skills: "stringee",
        soft_skills: "stringee"
      };

      // act
      const result = await userController.update('string', body);

      // assert
      expect(result).toEqual(updatedUserEntity);
      expect(userService.update).toHaveBeenCalledTimes(1);
      expect(userService.update).toHaveBeenCalledWith('string', body);
    });

    it('should return an exception', () => {
      // arrange
      const body: CreateUserDto = {
        id: "string",
        name: "stringee",
        role: "stringee",
        about_me: "stringee",
        email: "stringee",
        password: "string",
        createdAt: new Date,
        updatedAt: new Date,
        badges: new CreateBadgeDto,
        posts: new CreatePostDto,
        projects: "stringee",
        hard_skills: "stringee",
        soft_skills: "stringee"
      };

      // act
      jest.spyOn(userService, 'update').mockRejectedValueOnce(new Error('Error'));
      
      // assert
      expect(userController.update('string', body)).rejects.toThrowError('Error');
    });
  });

  describe('remove', () => {
    it('should delete a post', async () => {
      // act
      const result = await userController.remove('string');

      // assert
      expect(result).toBeUndefined();
    });

    it('should return an exception', () => {
      // arrange
      jest.spyOn(userService, 'delete').mockRejectedValueOnce(new Error('Error'));
      
      // assert
      expect(userController.remove('string')).rejects.toThrowError('Error');
    });
  });
});