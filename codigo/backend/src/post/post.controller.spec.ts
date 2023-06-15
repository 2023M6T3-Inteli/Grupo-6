import { Test, TestingModule } from '@nestjs/testing';
import { PostController } from './post.controller';
import { PostService } from './post.service';
import { CreatePostDto } from './dto/create-post.dto';
import { Post } from './entities/post.entity';

const postList = [
  new Post({
    // id: string;
    title: "string",
    description: "string",
    category: "string",
    createdAt: "string",
    creator: "string"
  }),
  new Post({    
    title: "string2",
    description: "string2",
    category: "string2",
    createdAt: "string2",
    creator: "string2"}),
  new Post({
    title: "string3",
    description: "string3",
    category: "string3",
    createdAt: "string3",
    creator: "string3"
  }),
]

const newPostEntity = new Post({
  id: "string",
  title: "string",
  description: "string",
  category: "string",
  createdAt: "string",
  creator: "string"
});

const updatedPostEntity = new Post({
  id: "string",
  title: "stringeee",
  description: "stringeee",
  category: "stringeee",
  createdAt: "String",
  creator: "string"
});

describe('PostController', () => {
  let postController: PostController;
  let postService: PostService;

  beforeEach(async () => {
      const module: TestingModule = await Test.createTestingModule({
      controllers: [PostController],
      providers: [
        {
          provide: PostService,
          useValue: {
            findAll: jest.fn().mockResolvedValue(postList),
            create: jest.fn().mockResolvedValue(newPostEntity),
            findOneById: jest.fn().mockResolvedValue(newPostEntity[0]),
            findOneByTitle: jest.fn().mockResolvedValue(newPostEntity[0]),
            findPostsByCreator: jest.fn().mockResolvedValue(postList[0]),
            update: jest.fn().mockResolvedValue(updatedPostEntity),
          },
        }
      ]
    }).compile();

    postController = module.get<PostController>(PostController);
  });


  describe('getAllPosts', () => {
    it('should return an array of objects with all the posts', async () => {
      // act
      const result = await postController.findAll();

      // assert
      expect(result).toEqual(postList);
      expect(typeof result).toEqual('object');
      expect(postService.getAllPosts).toHaveBeenCalledTimes(1);
      // jest.spyOn(PostService, 'findAll').mockImplementation(() => result);

      // expect(await PostController.getAllPosts()).toBe(result);
    });

    it('should return an exception', () => {
      // arrange
      jest.spyOn(postService, 'getAllPosts').mockRejectedValueOnce(new Error('Error'));

      // assert
      expect(postController.findAll()).rejects.toThrowError('Error');
    })
  });

  describe('create', () => {
    it('should return an object with the created post', async () => {
      // arrange
      const body: CreatePostDto = {
        id: "string",
        title: "string",
        description: "string",
        category: "string",
        createdAt: "String",
        creator: "string"
      };

      // act
      const result = await postController.create(body);

      // assert
      expect(result).toEqual(newPostEntity);
    });

    it('should return an exception', () => {
      // arrange
      const body: CreatePostDto = {
        id: "string",
        title: "string",
        description: "string",
        category: "string",
        createdAt: "String",
        creator: "string"
      };

      // act
      jest.spyOn(postService, 'create').mockRejectedValueOnce(new Error('Error'));
      
      // assert
      expect(postController.create(body)).rejects.toThrowError('Error');
    });
  });

  describe('findOneById', () => { 
    it('should return an object with the post', async () => {
      //act
      const result = await postController.findOneById('string');

      // assert
      expect(result).toEqual(postList[0]);
      expect(postService.getPostById).toHaveBeenCalledTimes(1);
      expect(postService.getPostById).toHaveBeenCalledWith('string');
    });

    it('should return an exception', () => {
      // arrange
      jest
        .spyOn(postService, 'getPostById')
        .mockRejectedValueOnce(new Error('Error'));
      
      // assert
      expect(postController.findOneById('string')).rejects.toThrowError('Error');
    });
  });

  describe('findOneByTitle', () => { 
    it('should return an object with the post', async () => {
      //act
      const result = await postController.findOneByTitle('string', 'string');

      // assert
      expect(result).toEqual(postList[0]);
      expect(postService.getPostByTitle).toHaveBeenCalledTimes(1);
      expect(postService.getPostByTitle).toHaveBeenCalledWith('string');
    });

    it('should return an exception', () => {
      // arrange
      jest
        .spyOn(postService, 'getPostByTitle')
        .mockRejectedValueOnce(new Error('Error'));
      
      // assert
      expect(postController.findOneByTitle('string', 'string')).rejects.toThrowError('Error');
    });
  });

  describe('findPostsByCreator', () => { 
    it('should return an object with the post', async () => {
      //act
      const result = await postController.findPostsByCreator('string');

      // assert
      expect(result).toEqual(postList[0]);
      expect(postService.getPostByCreator).toHaveBeenCalledTimes(1);
      expect(postService.getPostByCreator).toHaveBeenCalledWith('string');
    });

    it('should return an exception', () => {
      // arrange
      jest
        .spyOn(postService, 'getPostByCreator')
        .mockRejectedValueOnce(new Error('Error'));
      
      // assert
      expect(postController.findPostsByCreator('string')).rejects.toThrowError('Error');
    });
  });

  // obs: update and delete are not available at the platform, but here are the tests for them
  describe('update', () => {
    it('should return an object with the updated post', async () => {
      // arrange
      const body: CreatePostDto = {
        id: "string",
        title: "stringeee",
        description: "stringeee",
        category: "stringeee",
        createdAt: "string",
        creator: "string"
      };

      // act
      const result = await postController.update('string', body);

      // assert
      expect(result).toEqual(updatedPostEntity);
      expect(postService.updatePost).toHaveBeenCalledTimes(1);
      expect(postService.updatePost).toHaveBeenCalledWith('string', body);
    });

    it('should return an exception', () => {
      // arrange
      const body: CreatePostDto = {
        id: "string",
        title: "stringeee",
        description: "stringeee",
        category: "stringeee",
        createdAt: "string",
        creator: "string"
      };

      // act
      jest.spyOn(postService, 'updatePost').mockRejectedValueOnce(new Error('Error'));
      
      // assert
      expect(postController.update('string', body)).rejects.toThrowError('Error');
    });
  });

  describe('remove', () => {
    it('should delete a post', async () => {
      // act
      const result = await postController.remove('string');

      // assert
      expect(result).toBeUndefined();
    });

    it('should return an exception', () => {
      // arrange
      jest.spyOn(postService, 'deletePost').mockRejectedValueOnce(new Error('Error'));
      
      // assert
      expect(postController.remove('string')).rejects.toThrowError('Error');
    });
  });
});