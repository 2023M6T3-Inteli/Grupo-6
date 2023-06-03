import { Injectable } from '@nestjs/common';
import axios from 'axios';
import { PrismaService } from 'src/prisma.service';
import { FindLoginDto } from './dto/find-login.dto';


@Injectable()
export class LoginService {
  constructor(private prisma: PrismaService) {}

  async findlogin(FindLoginDto: FindLoginDto) {
    const login = await this.prisma.user.findFirst({
      where: { email: FindLoginDto.email, password: FindLoginDto.password }
    });

    
    try {
      const response = await axios({
        method: 'get',
        url: 'http://localhost:3001/profile/'+ login.id,
      });


    } catch (error) {
      if (error.response && error.response.status === 404) {
        var data = JSON.stringify({
          "id_profile": login.id,
          "name": login.name,
          "email": login.email
        });
        
        var config = {
          method: 'post',
          url: 'http://localhost:3001/profile',
          headers: { 
            'Content-Type': 'application/json'
          },
          data : data
        };
        
        const creatUser = await axios(config)
        .then(function (response) {
          console.log(JSON.stringify(response.data));
        })
        .catch(function (error) {
          console.log(error);
        });
      }
    }
    return login.id;
  }
}