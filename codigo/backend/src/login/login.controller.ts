import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { LoginService } from './login.service';
import { FindLoginDto } from './dto/find-login.dto';


@Controller('login')
export class LoginController {
  constructor(private readonly loginService: LoginService) {}
  
// API to find a login
  @Post()
  create(@Body() FindLoginDto: FindLoginDto) {
    return this.loginService.findlogin(FindLoginDto);
  }

}
