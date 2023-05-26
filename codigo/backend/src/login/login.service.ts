import { Injectable } from '@nestjs/common';
import { PrismaService } from 'src/prisma.service';
import { FindLoginDto } from './dto/find-login.dto';


@Injectable()
export class LoginService {
  constructor(private prisma: PrismaService) {}

  async findlogin(FindLoginDto: FindLoginDto) {
    const login = await this.prisma.user.findFirst({
      where: { email: FindLoginDto.email, password: FindLoginDto.password }
    });
    return login.id;
  }
}
