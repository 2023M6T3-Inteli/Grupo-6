import { Injectable } from '@nestjs/common';
import axios from 'axios';
import { PrismaService } from 'src/prisma.service';
import { FindLoginDto } from './dto/find-login.dto';


@Injectable()
export class LoginService {
  constructor(private prisma: PrismaService) {}

  // API to find a login
  async findlogin(FindLoginDto: FindLoginDto) {
    const login = await this.prisma.user.findFirst({
      where: { email: FindLoginDto.email, password: FindLoginDto.password }
    });

    // Return page with login data
    try {
      const response = await axios({
        method: 'get',
        url: 'http://load-legado-289789458.us-east-1.elb.amazonaws.com/profile/'+ login.id,
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
          url: 'http://load-legado-289789458.us-east-1.elb.amazonaws.com/profile',
          headers: { 
            'Content-Type': 'application/json'
          },
          data : data
        };

        // Create profile
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