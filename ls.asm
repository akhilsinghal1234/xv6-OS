
_ls:     file format elf32-i386


Disassembly of section .text:

00000000 <fmtname>:
#include "user.h"
#include "fs.h"

char*
fmtname(char *path)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	53                   	push   %ebx
   4:	83 ec 14             	sub    $0x14,%esp
  static char buf[DIRSIZ+1];
  char *p;
  
  // Find first character after last slash.
  for(p=path+strlen(path); p >= path && *p != '/'; p--)
   7:	83 ec 0c             	sub    $0xc,%esp
   a:	ff 75 08             	pushl  0x8(%ebp)
   d:	e8 c9 03 00 00       	call   3db <strlen>
  12:	83 c4 10             	add    $0x10,%esp
  15:	89 c2                	mov    %eax,%edx
  17:	8b 45 08             	mov    0x8(%ebp),%eax
  1a:	01 d0                	add    %edx,%eax
  1c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1f:	eb 04                	jmp    25 <fmtname+0x25>
  21:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
  25:	8b 45 f4             	mov    -0xc(%ebp),%eax
  28:	3b 45 08             	cmp    0x8(%ebp),%eax
  2b:	72 0a                	jb     37 <fmtname+0x37>
  2d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  30:	0f b6 00             	movzbl (%eax),%eax
  33:	3c 2f                	cmp    $0x2f,%al
  35:	75 ea                	jne    21 <fmtname+0x21>
    ;
  p++;
  37:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  
  // Return blank-padded name.
  if(strlen(p) >= DIRSIZ)
  3b:	83 ec 0c             	sub    $0xc,%esp
  3e:	ff 75 f4             	pushl  -0xc(%ebp)
  41:	e8 95 03 00 00       	call   3db <strlen>
  46:	83 c4 10             	add    $0x10,%esp
  49:	83 f8 0d             	cmp    $0xd,%eax
  4c:	76 05                	jbe    53 <fmtname+0x53>
    return p;
  4e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  51:	eb 60                	jmp    b3 <fmtname+0xb3>
  memmove(buf, p, strlen(p));
  53:	83 ec 0c             	sub    $0xc,%esp
  56:	ff 75 f4             	pushl  -0xc(%ebp)
  59:	e8 7d 03 00 00       	call   3db <strlen>
  5e:	83 c4 10             	add    $0x10,%esp
  61:	83 ec 04             	sub    $0x4,%esp
  64:	50                   	push   %eax
  65:	ff 75 f4             	pushl  -0xc(%ebp)
  68:	68 f0 0d 00 00       	push   $0xdf0
  6d:	e8 e6 04 00 00       	call   558 <memmove>
  72:	83 c4 10             	add    $0x10,%esp
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
  75:	83 ec 0c             	sub    $0xc,%esp
  78:	ff 75 f4             	pushl  -0xc(%ebp)
  7b:	e8 5b 03 00 00       	call   3db <strlen>
  80:	83 c4 10             	add    $0x10,%esp
  83:	ba 0e 00 00 00       	mov    $0xe,%edx
  88:	89 d3                	mov    %edx,%ebx
  8a:	29 c3                	sub    %eax,%ebx
  8c:	83 ec 0c             	sub    $0xc,%esp
  8f:	ff 75 f4             	pushl  -0xc(%ebp)
  92:	e8 44 03 00 00       	call   3db <strlen>
  97:	83 c4 10             	add    $0x10,%esp
  9a:	05 f0 0d 00 00       	add    $0xdf0,%eax
  9f:	83 ec 04             	sub    $0x4,%esp
  a2:	53                   	push   %ebx
  a3:	6a 20                	push   $0x20
  a5:	50                   	push   %eax
  a6:	e8 57 03 00 00       	call   402 <memset>
  ab:	83 c4 10             	add    $0x10,%esp
  return buf;
  ae:	b8 f0 0d 00 00       	mov    $0xdf0,%eax
}
  b3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  b6:	c9                   	leave  
  b7:	c3                   	ret    

000000b8 <ls>:

void
ls(char *path)
{
  b8:	55                   	push   %ebp
  b9:	89 e5                	mov    %esp,%ebp
  bb:	57                   	push   %edi
  bc:	56                   	push   %esi
  bd:	53                   	push   %ebx
  be:	81 ec 3c 02 00 00    	sub    $0x23c,%esp
  char buf[512], *p;
  int fd;
  struct dirent de;
  struct stat st;
  
  if((fd = open(path, 0)) < 0){
  c4:	83 ec 08             	sub    $0x8,%esp
  c7:	6a 00                	push   $0x0
  c9:	ff 75 08             	pushl  0x8(%ebp)
  cc:	e8 0c 05 00 00       	call   5dd <open>
  d1:	83 c4 10             	add    $0x10,%esp
  d4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  d7:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  db:	79 1a                	jns    f7 <ls+0x3f>
    printf(2, "ls: cannot open %s\n", path);
  dd:	83 ec 04             	sub    $0x4,%esp
  e0:	ff 75 08             	pushl  0x8(%ebp)
  e3:	68 ea 0a 00 00       	push   $0xaea
  e8:	6a 02                	push   $0x2
  ea:	e8 45 06 00 00       	call   734 <printf>
  ef:	83 c4 10             	add    $0x10,%esp
    return;
  f2:	e9 e3 01 00 00       	jmp    2da <ls+0x222>
  }
  
  if(fstat(fd, &st) < 0){
  f7:	83 ec 08             	sub    $0x8,%esp
  fa:	8d 85 bc fd ff ff    	lea    -0x244(%ebp),%eax
 100:	50                   	push   %eax
 101:	ff 75 e4             	pushl  -0x1c(%ebp)
 104:	e8 ec 04 00 00       	call   5f5 <fstat>
 109:	83 c4 10             	add    $0x10,%esp
 10c:	85 c0                	test   %eax,%eax
 10e:	79 28                	jns    138 <ls+0x80>
    printf(2, "ls: cannot stat %s\n", path);
 110:	83 ec 04             	sub    $0x4,%esp
 113:	ff 75 08             	pushl  0x8(%ebp)
 116:	68 fe 0a 00 00       	push   $0xafe
 11b:	6a 02                	push   $0x2
 11d:	e8 12 06 00 00       	call   734 <printf>
 122:	83 c4 10             	add    $0x10,%esp
    close(fd);
 125:	83 ec 0c             	sub    $0xc,%esp
 128:	ff 75 e4             	pushl  -0x1c(%ebp)
 12b:	e8 95 04 00 00       	call   5c5 <close>
 130:	83 c4 10             	add    $0x10,%esp
    return;
 133:	e9 a2 01 00 00       	jmp    2da <ls+0x222>
  }
  
  switch(st.type){
 138:	0f b7 85 bc fd ff ff 	movzwl -0x244(%ebp),%eax
 13f:	98                   	cwtl   
 140:	83 f8 01             	cmp    $0x1,%eax
 143:	74 48                	je     18d <ls+0xd5>
 145:	83 f8 02             	cmp    $0x2,%eax
 148:	0f 85 7e 01 00 00    	jne    2cc <ls+0x214>
  case T_FILE:
    printf(1, "%s %d %d %d\n", fmtname(path), st.type, st.ino, st.size);
 14e:	8b bd cc fd ff ff    	mov    -0x234(%ebp),%edi
 154:	8b b5 c4 fd ff ff    	mov    -0x23c(%ebp),%esi
 15a:	0f b7 85 bc fd ff ff 	movzwl -0x244(%ebp),%eax
 161:	0f bf d8             	movswl %ax,%ebx
 164:	83 ec 0c             	sub    $0xc,%esp
 167:	ff 75 08             	pushl  0x8(%ebp)
 16a:	e8 91 fe ff ff       	call   0 <fmtname>
 16f:	83 c4 10             	add    $0x10,%esp
 172:	83 ec 08             	sub    $0x8,%esp
 175:	57                   	push   %edi
 176:	56                   	push   %esi
 177:	53                   	push   %ebx
 178:	50                   	push   %eax
 179:	68 12 0b 00 00       	push   $0xb12
 17e:	6a 01                	push   $0x1
 180:	e8 af 05 00 00       	call   734 <printf>
 185:	83 c4 20             	add    $0x20,%esp
    break;
 188:	e9 3f 01 00 00       	jmp    2cc <ls+0x214>
  
  case T_DIR:
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
 18d:	83 ec 0c             	sub    $0xc,%esp
 190:	ff 75 08             	pushl  0x8(%ebp)
 193:	e8 43 02 00 00       	call   3db <strlen>
 198:	83 c4 10             	add    $0x10,%esp
 19b:	83 c0 10             	add    $0x10,%eax
 19e:	3d 00 02 00 00       	cmp    $0x200,%eax
 1a3:	76 17                	jbe    1bc <ls+0x104>
      printf(1, "ls: path too long\n");
 1a5:	83 ec 08             	sub    $0x8,%esp
 1a8:	68 1f 0b 00 00       	push   $0xb1f
 1ad:	6a 01                	push   $0x1
 1af:	e8 80 05 00 00       	call   734 <printf>
 1b4:	83 c4 10             	add    $0x10,%esp
      break;
 1b7:	e9 10 01 00 00       	jmp    2cc <ls+0x214>
    }
    strcpy(buf, path);
 1bc:	83 ec 08             	sub    $0x8,%esp
 1bf:	ff 75 08             	pushl  0x8(%ebp)
 1c2:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
 1c8:	50                   	push   %eax
 1c9:	e8 9e 01 00 00       	call   36c <strcpy>
 1ce:	83 c4 10             	add    $0x10,%esp
    p = buf+strlen(buf);
 1d1:	83 ec 0c             	sub    $0xc,%esp
 1d4:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
 1da:	50                   	push   %eax
 1db:	e8 fb 01 00 00       	call   3db <strlen>
 1e0:	83 c4 10             	add    $0x10,%esp
 1e3:	89 c2                	mov    %eax,%edx
 1e5:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
 1eb:	01 d0                	add    %edx,%eax
 1ed:	89 45 e0             	mov    %eax,-0x20(%ebp)
    *p++ = '/';
 1f0:	8b 45 e0             	mov    -0x20(%ebp),%eax
 1f3:	8d 50 01             	lea    0x1(%eax),%edx
 1f6:	89 55 e0             	mov    %edx,-0x20(%ebp)
 1f9:	c6 00 2f             	movb   $0x2f,(%eax)
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 1fc:	e9 aa 00 00 00       	jmp    2ab <ls+0x1f3>
      if(de.inum == 0)
 201:	0f b7 85 d0 fd ff ff 	movzwl -0x230(%ebp),%eax
 208:	66 85 c0             	test   %ax,%ax
 20b:	75 05                	jne    212 <ls+0x15a>
        continue;
 20d:	e9 99 00 00 00       	jmp    2ab <ls+0x1f3>
      memmove(p, de.name, DIRSIZ);
 212:	83 ec 04             	sub    $0x4,%esp
 215:	6a 0e                	push   $0xe
 217:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
 21d:	83 c0 02             	add    $0x2,%eax
 220:	50                   	push   %eax
 221:	ff 75 e0             	pushl  -0x20(%ebp)
 224:	e8 2f 03 00 00       	call   558 <memmove>
 229:	83 c4 10             	add    $0x10,%esp
      p[DIRSIZ] = 0;
 22c:	8b 45 e0             	mov    -0x20(%ebp),%eax
 22f:	83 c0 0e             	add    $0xe,%eax
 232:	c6 00 00             	movb   $0x0,(%eax)
      if(stat(buf, &st) < 0){
 235:	83 ec 08             	sub    $0x8,%esp
 238:	8d 85 bc fd ff ff    	lea    -0x244(%ebp),%eax
 23e:	50                   	push   %eax
 23f:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
 245:	50                   	push   %eax
 246:	e8 73 02 00 00       	call   4be <stat>
 24b:	83 c4 10             	add    $0x10,%esp
 24e:	85 c0                	test   %eax,%eax
 250:	79 1b                	jns    26d <ls+0x1b5>
        printf(1, "ls: cannot stat %s\n", buf);
 252:	83 ec 04             	sub    $0x4,%esp
 255:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
 25b:	50                   	push   %eax
 25c:	68 fe 0a 00 00       	push   $0xafe
 261:	6a 01                	push   $0x1
 263:	e8 cc 04 00 00       	call   734 <printf>
 268:	83 c4 10             	add    $0x10,%esp
        continue;
 26b:	eb 3e                	jmp    2ab <ls+0x1f3>
      }
      printf(1, "%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
 26d:	8b bd cc fd ff ff    	mov    -0x234(%ebp),%edi
 273:	8b b5 c4 fd ff ff    	mov    -0x23c(%ebp),%esi
 279:	0f b7 85 bc fd ff ff 	movzwl -0x244(%ebp),%eax
 280:	0f bf d8             	movswl %ax,%ebx
 283:	83 ec 0c             	sub    $0xc,%esp
 286:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
 28c:	50                   	push   %eax
 28d:	e8 6e fd ff ff       	call   0 <fmtname>
 292:	83 c4 10             	add    $0x10,%esp
 295:	83 ec 08             	sub    $0x8,%esp
 298:	57                   	push   %edi
 299:	56                   	push   %esi
 29a:	53                   	push   %ebx
 29b:	50                   	push   %eax
 29c:	68 12 0b 00 00       	push   $0xb12
 2a1:	6a 01                	push   $0x1
 2a3:	e8 8c 04 00 00       	call   734 <printf>
 2a8:	83 c4 20             	add    $0x20,%esp
      break;
    }
    strcpy(buf, path);
    p = buf+strlen(buf);
    *p++ = '/';
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 2ab:	83 ec 04             	sub    $0x4,%esp
 2ae:	6a 10                	push   $0x10
 2b0:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
 2b6:	50                   	push   %eax
 2b7:	ff 75 e4             	pushl  -0x1c(%ebp)
 2ba:	e8 f6 02 00 00       	call   5b5 <read>
 2bf:	83 c4 10             	add    $0x10,%esp
 2c2:	83 f8 10             	cmp    $0x10,%eax
 2c5:	0f 84 36 ff ff ff    	je     201 <ls+0x149>
        printf(1, "ls: cannot stat %s\n", buf);
        continue;
      }
      printf(1, "%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
    }
    break;
 2cb:	90                   	nop
  }
  close(fd);
 2cc:	83 ec 0c             	sub    $0xc,%esp
 2cf:	ff 75 e4             	pushl  -0x1c(%ebp)
 2d2:	e8 ee 02 00 00       	call   5c5 <close>
 2d7:	83 c4 10             	add    $0x10,%esp
}
 2da:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2dd:	5b                   	pop    %ebx
 2de:	5e                   	pop    %esi
 2df:	5f                   	pop    %edi
 2e0:	5d                   	pop    %ebp
 2e1:	c3                   	ret    

000002e2 <main>:

int
main(int argc, char *argv[])
{
 2e2:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 2e6:	83 e4 f0             	and    $0xfffffff0,%esp
 2e9:	ff 71 fc             	pushl  -0x4(%ecx)
 2ec:	55                   	push   %ebp
 2ed:	89 e5                	mov    %esp,%ebp
 2ef:	53                   	push   %ebx
 2f0:	51                   	push   %ecx
 2f1:	83 ec 10             	sub    $0x10,%esp
 2f4:	89 cb                	mov    %ecx,%ebx
  int i;

  if(argc < 2){
 2f6:	83 3b 01             	cmpl   $0x1,(%ebx)
 2f9:	7f 15                	jg     310 <main+0x2e>
    ls(".");
 2fb:	83 ec 0c             	sub    $0xc,%esp
 2fe:	68 32 0b 00 00       	push   $0xb32
 303:	e8 b0 fd ff ff       	call   b8 <ls>
 308:	83 c4 10             	add    $0x10,%esp
    exit();
 30b:	e8 8d 02 00 00       	call   59d <exit>
  }
  for(i=1; i<argc; i++)
 310:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
 317:	eb 21                	jmp    33a <main+0x58>
    ls(argv[i]);
 319:	8b 45 f4             	mov    -0xc(%ebp),%eax
 31c:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 323:	8b 43 04             	mov    0x4(%ebx),%eax
 326:	01 d0                	add    %edx,%eax
 328:	8b 00                	mov    (%eax),%eax
 32a:	83 ec 0c             	sub    $0xc,%esp
 32d:	50                   	push   %eax
 32e:	e8 85 fd ff ff       	call   b8 <ls>
 333:	83 c4 10             	add    $0x10,%esp

  if(argc < 2){
    ls(".");
    exit();
  }
  for(i=1; i<argc; i++)
 336:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
 33a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 33d:	3b 03                	cmp    (%ebx),%eax
 33f:	7c d8                	jl     319 <main+0x37>
    ls(argv[i]);
  exit();
 341:	e8 57 02 00 00       	call   59d <exit>

00000346 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 346:	55                   	push   %ebp
 347:	89 e5                	mov    %esp,%ebp
 349:	57                   	push   %edi
 34a:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 34b:	8b 4d 08             	mov    0x8(%ebp),%ecx
 34e:	8b 55 10             	mov    0x10(%ebp),%edx
 351:	8b 45 0c             	mov    0xc(%ebp),%eax
 354:	89 cb                	mov    %ecx,%ebx
 356:	89 df                	mov    %ebx,%edi
 358:	89 d1                	mov    %edx,%ecx
 35a:	fc                   	cld    
 35b:	f3 aa                	rep stos %al,%es:(%edi)
 35d:	89 ca                	mov    %ecx,%edx
 35f:	89 fb                	mov    %edi,%ebx
 361:	89 5d 08             	mov    %ebx,0x8(%ebp)
 364:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 367:	90                   	nop
 368:	5b                   	pop    %ebx
 369:	5f                   	pop    %edi
 36a:	5d                   	pop    %ebp
 36b:	c3                   	ret    

0000036c <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 36c:	55                   	push   %ebp
 36d:	89 e5                	mov    %esp,%ebp
 36f:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 372:	8b 45 08             	mov    0x8(%ebp),%eax
 375:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 378:	90                   	nop
 379:	8b 45 08             	mov    0x8(%ebp),%eax
 37c:	8d 50 01             	lea    0x1(%eax),%edx
 37f:	89 55 08             	mov    %edx,0x8(%ebp)
 382:	8b 55 0c             	mov    0xc(%ebp),%edx
 385:	8d 4a 01             	lea    0x1(%edx),%ecx
 388:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 38b:	0f b6 12             	movzbl (%edx),%edx
 38e:	88 10                	mov    %dl,(%eax)
 390:	0f b6 00             	movzbl (%eax),%eax
 393:	84 c0                	test   %al,%al
 395:	75 e2                	jne    379 <strcpy+0xd>
    ;
  return os;
 397:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 39a:	c9                   	leave  
 39b:	c3                   	ret    

0000039c <strcmp>:

int
strcmp(const char *p, const char *q)
{
 39c:	55                   	push   %ebp
 39d:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 39f:	eb 08                	jmp    3a9 <strcmp+0xd>
    p++, q++;
 3a1:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 3a5:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 3a9:	8b 45 08             	mov    0x8(%ebp),%eax
 3ac:	0f b6 00             	movzbl (%eax),%eax
 3af:	84 c0                	test   %al,%al
 3b1:	74 10                	je     3c3 <strcmp+0x27>
 3b3:	8b 45 08             	mov    0x8(%ebp),%eax
 3b6:	0f b6 10             	movzbl (%eax),%edx
 3b9:	8b 45 0c             	mov    0xc(%ebp),%eax
 3bc:	0f b6 00             	movzbl (%eax),%eax
 3bf:	38 c2                	cmp    %al,%dl
 3c1:	74 de                	je     3a1 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 3c3:	8b 45 08             	mov    0x8(%ebp),%eax
 3c6:	0f b6 00             	movzbl (%eax),%eax
 3c9:	0f b6 d0             	movzbl %al,%edx
 3cc:	8b 45 0c             	mov    0xc(%ebp),%eax
 3cf:	0f b6 00             	movzbl (%eax),%eax
 3d2:	0f b6 c0             	movzbl %al,%eax
 3d5:	29 c2                	sub    %eax,%edx
 3d7:	89 d0                	mov    %edx,%eax
}
 3d9:	5d                   	pop    %ebp
 3da:	c3                   	ret    

000003db <strlen>:

uint
strlen(char *s)
{
 3db:	55                   	push   %ebp
 3dc:	89 e5                	mov    %esp,%ebp
 3de:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 3e1:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 3e8:	eb 04                	jmp    3ee <strlen+0x13>
 3ea:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 3ee:	8b 55 fc             	mov    -0x4(%ebp),%edx
 3f1:	8b 45 08             	mov    0x8(%ebp),%eax
 3f4:	01 d0                	add    %edx,%eax
 3f6:	0f b6 00             	movzbl (%eax),%eax
 3f9:	84 c0                	test   %al,%al
 3fb:	75 ed                	jne    3ea <strlen+0xf>
    ;
  return n;
 3fd:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 400:	c9                   	leave  
 401:	c3                   	ret    

00000402 <memset>:

void*
memset(void *dst, int c, uint n)
{
 402:	55                   	push   %ebp
 403:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
 405:	8b 45 10             	mov    0x10(%ebp),%eax
 408:	50                   	push   %eax
 409:	ff 75 0c             	pushl  0xc(%ebp)
 40c:	ff 75 08             	pushl  0x8(%ebp)
 40f:	e8 32 ff ff ff       	call   346 <stosb>
 414:	83 c4 0c             	add    $0xc,%esp
  return dst;
 417:	8b 45 08             	mov    0x8(%ebp),%eax
}
 41a:	c9                   	leave  
 41b:	c3                   	ret    

0000041c <strchr>:

char*
strchr(const char *s, char c)
{
 41c:	55                   	push   %ebp
 41d:	89 e5                	mov    %esp,%ebp
 41f:	83 ec 04             	sub    $0x4,%esp
 422:	8b 45 0c             	mov    0xc(%ebp),%eax
 425:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 428:	eb 14                	jmp    43e <strchr+0x22>
    if(*s == c)
 42a:	8b 45 08             	mov    0x8(%ebp),%eax
 42d:	0f b6 00             	movzbl (%eax),%eax
 430:	3a 45 fc             	cmp    -0x4(%ebp),%al
 433:	75 05                	jne    43a <strchr+0x1e>
      return (char*)s;
 435:	8b 45 08             	mov    0x8(%ebp),%eax
 438:	eb 13                	jmp    44d <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 43a:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 43e:	8b 45 08             	mov    0x8(%ebp),%eax
 441:	0f b6 00             	movzbl (%eax),%eax
 444:	84 c0                	test   %al,%al
 446:	75 e2                	jne    42a <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 448:	b8 00 00 00 00       	mov    $0x0,%eax
}
 44d:	c9                   	leave  
 44e:	c3                   	ret    

0000044f <gets>:

char*
gets(char *buf, int max)
{
 44f:	55                   	push   %ebp
 450:	89 e5                	mov    %esp,%ebp
 452:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 455:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 45c:	eb 42                	jmp    4a0 <gets+0x51>
    cc = read(0, &c, 1);
 45e:	83 ec 04             	sub    $0x4,%esp
 461:	6a 01                	push   $0x1
 463:	8d 45 ef             	lea    -0x11(%ebp),%eax
 466:	50                   	push   %eax
 467:	6a 00                	push   $0x0
 469:	e8 47 01 00 00       	call   5b5 <read>
 46e:	83 c4 10             	add    $0x10,%esp
 471:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 474:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 478:	7e 33                	jle    4ad <gets+0x5e>
      break;
    buf[i++] = c;
 47a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 47d:	8d 50 01             	lea    0x1(%eax),%edx
 480:	89 55 f4             	mov    %edx,-0xc(%ebp)
 483:	89 c2                	mov    %eax,%edx
 485:	8b 45 08             	mov    0x8(%ebp),%eax
 488:	01 c2                	add    %eax,%edx
 48a:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 48e:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 490:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 494:	3c 0a                	cmp    $0xa,%al
 496:	74 16                	je     4ae <gets+0x5f>
 498:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 49c:	3c 0d                	cmp    $0xd,%al
 49e:	74 0e                	je     4ae <gets+0x5f>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 4a0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4a3:	83 c0 01             	add    $0x1,%eax
 4a6:	3b 45 0c             	cmp    0xc(%ebp),%eax
 4a9:	7c b3                	jl     45e <gets+0xf>
 4ab:	eb 01                	jmp    4ae <gets+0x5f>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 4ad:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 4ae:	8b 55 f4             	mov    -0xc(%ebp),%edx
 4b1:	8b 45 08             	mov    0x8(%ebp),%eax
 4b4:	01 d0                	add    %edx,%eax
 4b6:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 4b9:	8b 45 08             	mov    0x8(%ebp),%eax
}
 4bc:	c9                   	leave  
 4bd:	c3                   	ret    

000004be <stat>:

int
stat(char *n, struct stat *st)
{
 4be:	55                   	push   %ebp
 4bf:	89 e5                	mov    %esp,%ebp
 4c1:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4c4:	83 ec 08             	sub    $0x8,%esp
 4c7:	6a 00                	push   $0x0
 4c9:	ff 75 08             	pushl  0x8(%ebp)
 4cc:	e8 0c 01 00 00       	call   5dd <open>
 4d1:	83 c4 10             	add    $0x10,%esp
 4d4:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 4d7:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 4db:	79 07                	jns    4e4 <stat+0x26>
    return -1;
 4dd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 4e2:	eb 25                	jmp    509 <stat+0x4b>
  r = fstat(fd, st);
 4e4:	83 ec 08             	sub    $0x8,%esp
 4e7:	ff 75 0c             	pushl  0xc(%ebp)
 4ea:	ff 75 f4             	pushl  -0xc(%ebp)
 4ed:	e8 03 01 00 00       	call   5f5 <fstat>
 4f2:	83 c4 10             	add    $0x10,%esp
 4f5:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 4f8:	83 ec 0c             	sub    $0xc,%esp
 4fb:	ff 75 f4             	pushl  -0xc(%ebp)
 4fe:	e8 c2 00 00 00       	call   5c5 <close>
 503:	83 c4 10             	add    $0x10,%esp
  return r;
 506:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 509:	c9                   	leave  
 50a:	c3                   	ret    

0000050b <atoi>:

int
atoi(const char *s)
{
 50b:	55                   	push   %ebp
 50c:	89 e5                	mov    %esp,%ebp
 50e:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 511:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 518:	eb 25                	jmp    53f <atoi+0x34>
    n = n*10 + *s++ - '0';
 51a:	8b 55 fc             	mov    -0x4(%ebp),%edx
 51d:	89 d0                	mov    %edx,%eax
 51f:	c1 e0 02             	shl    $0x2,%eax
 522:	01 d0                	add    %edx,%eax
 524:	01 c0                	add    %eax,%eax
 526:	89 c1                	mov    %eax,%ecx
 528:	8b 45 08             	mov    0x8(%ebp),%eax
 52b:	8d 50 01             	lea    0x1(%eax),%edx
 52e:	89 55 08             	mov    %edx,0x8(%ebp)
 531:	0f b6 00             	movzbl (%eax),%eax
 534:	0f be c0             	movsbl %al,%eax
 537:	01 c8                	add    %ecx,%eax
 539:	83 e8 30             	sub    $0x30,%eax
 53c:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 53f:	8b 45 08             	mov    0x8(%ebp),%eax
 542:	0f b6 00             	movzbl (%eax),%eax
 545:	3c 2f                	cmp    $0x2f,%al
 547:	7e 0a                	jle    553 <atoi+0x48>
 549:	8b 45 08             	mov    0x8(%ebp),%eax
 54c:	0f b6 00             	movzbl (%eax),%eax
 54f:	3c 39                	cmp    $0x39,%al
 551:	7e c7                	jle    51a <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 553:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 556:	c9                   	leave  
 557:	c3                   	ret    

00000558 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 558:	55                   	push   %ebp
 559:	89 e5                	mov    %esp,%ebp
 55b:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 55e:	8b 45 08             	mov    0x8(%ebp),%eax
 561:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 564:	8b 45 0c             	mov    0xc(%ebp),%eax
 567:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 56a:	eb 17                	jmp    583 <memmove+0x2b>
    *dst++ = *src++;
 56c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 56f:	8d 50 01             	lea    0x1(%eax),%edx
 572:	89 55 fc             	mov    %edx,-0x4(%ebp)
 575:	8b 55 f8             	mov    -0x8(%ebp),%edx
 578:	8d 4a 01             	lea    0x1(%edx),%ecx
 57b:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 57e:	0f b6 12             	movzbl (%edx),%edx
 581:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 583:	8b 45 10             	mov    0x10(%ebp),%eax
 586:	8d 50 ff             	lea    -0x1(%eax),%edx
 589:	89 55 10             	mov    %edx,0x10(%ebp)
 58c:	85 c0                	test   %eax,%eax
 58e:	7f dc                	jg     56c <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 590:	8b 45 08             	mov    0x8(%ebp),%eax
}
 593:	c9                   	leave  
 594:	c3                   	ret    

00000595 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 595:	b8 01 00 00 00       	mov    $0x1,%eax
 59a:	cd 40                	int    $0x40
 59c:	c3                   	ret    

0000059d <exit>:
SYSCALL(exit)
 59d:	b8 02 00 00 00       	mov    $0x2,%eax
 5a2:	cd 40                	int    $0x40
 5a4:	c3                   	ret    

000005a5 <wait>:
SYSCALL(wait)
 5a5:	b8 03 00 00 00       	mov    $0x3,%eax
 5aa:	cd 40                	int    $0x40
 5ac:	c3                   	ret    

000005ad <pipe>:
SYSCALL(pipe)
 5ad:	b8 04 00 00 00       	mov    $0x4,%eax
 5b2:	cd 40                	int    $0x40
 5b4:	c3                   	ret    

000005b5 <read>:
SYSCALL(read)
 5b5:	b8 05 00 00 00       	mov    $0x5,%eax
 5ba:	cd 40                	int    $0x40
 5bc:	c3                   	ret    

000005bd <write>:
SYSCALL(write)
 5bd:	b8 10 00 00 00       	mov    $0x10,%eax
 5c2:	cd 40                	int    $0x40
 5c4:	c3                   	ret    

000005c5 <close>:
SYSCALL(close)
 5c5:	b8 15 00 00 00       	mov    $0x15,%eax
 5ca:	cd 40                	int    $0x40
 5cc:	c3                   	ret    

000005cd <kill>:
SYSCALL(kill)
 5cd:	b8 06 00 00 00       	mov    $0x6,%eax
 5d2:	cd 40                	int    $0x40
 5d4:	c3                   	ret    

000005d5 <exec>:
SYSCALL(exec)
 5d5:	b8 07 00 00 00       	mov    $0x7,%eax
 5da:	cd 40                	int    $0x40
 5dc:	c3                   	ret    

000005dd <open>:
SYSCALL(open)
 5dd:	b8 0f 00 00 00       	mov    $0xf,%eax
 5e2:	cd 40                	int    $0x40
 5e4:	c3                   	ret    

000005e5 <mknod>:
SYSCALL(mknod)
 5e5:	b8 11 00 00 00       	mov    $0x11,%eax
 5ea:	cd 40                	int    $0x40
 5ec:	c3                   	ret    

000005ed <unlink>:
SYSCALL(unlink)
 5ed:	b8 12 00 00 00       	mov    $0x12,%eax
 5f2:	cd 40                	int    $0x40
 5f4:	c3                   	ret    

000005f5 <fstat>:
SYSCALL(fstat)
 5f5:	b8 08 00 00 00       	mov    $0x8,%eax
 5fa:	cd 40                	int    $0x40
 5fc:	c3                   	ret    

000005fd <link>:
SYSCALL(link)
 5fd:	b8 13 00 00 00       	mov    $0x13,%eax
 602:	cd 40                	int    $0x40
 604:	c3                   	ret    

00000605 <mkdir>:
SYSCALL(mkdir)
 605:	b8 14 00 00 00       	mov    $0x14,%eax
 60a:	cd 40                	int    $0x40
 60c:	c3                   	ret    

0000060d <chdir>:
SYSCALL(chdir)
 60d:	b8 09 00 00 00       	mov    $0x9,%eax
 612:	cd 40                	int    $0x40
 614:	c3                   	ret    

00000615 <dup>:
SYSCALL(dup)
 615:	b8 0a 00 00 00       	mov    $0xa,%eax
 61a:	cd 40                	int    $0x40
 61c:	c3                   	ret    

0000061d <getpid>:
SYSCALL(getpid)
 61d:	b8 0b 00 00 00       	mov    $0xb,%eax
 622:	cd 40                	int    $0x40
 624:	c3                   	ret    

00000625 <getppid>:
SYSCALL(getppid)
 625:	b8 18 00 00 00       	mov    $0x18,%eax
 62a:	cd 40                	int    $0x40
 62c:	c3                   	ret    

0000062d <getsyscallinfo>:
SYSCALL(getsyscallinfo)
 62d:	b8 19 00 00 00       	mov    $0x19,%eax
 632:	cd 40                	int    $0x40
 634:	c3                   	ret    

00000635 <getAllPids>:
SYSCALL(getAllPids)
 635:	b8 16 00 00 00       	mov    $0x16,%eax
 63a:	cd 40                	int    $0x40
 63c:	c3                   	ret    

0000063d <shutdown>:
SYSCALL(shutdown)
 63d:	b8 17 00 00 00       	mov    $0x17,%eax
 642:	cd 40                	int    $0x40
 644:	c3                   	ret    

00000645 <sbrk>:
SYSCALL(sbrk)
 645:	b8 0c 00 00 00       	mov    $0xc,%eax
 64a:	cd 40                	int    $0x40
 64c:	c3                   	ret    

0000064d <sleep>:
SYSCALL(sleep)
 64d:	b8 0d 00 00 00       	mov    $0xd,%eax
 652:	cd 40                	int    $0x40
 654:	c3                   	ret    

00000655 <uptime>:
SYSCALL(uptime)
 655:	b8 0e 00 00 00       	mov    $0xe,%eax
 65a:	cd 40                	int    $0x40
 65c:	c3                   	ret    

0000065d <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 65d:	55                   	push   %ebp
 65e:	89 e5                	mov    %esp,%ebp
 660:	83 ec 18             	sub    $0x18,%esp
 663:	8b 45 0c             	mov    0xc(%ebp),%eax
 666:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 669:	83 ec 04             	sub    $0x4,%esp
 66c:	6a 01                	push   $0x1
 66e:	8d 45 f4             	lea    -0xc(%ebp),%eax
 671:	50                   	push   %eax
 672:	ff 75 08             	pushl  0x8(%ebp)
 675:	e8 43 ff ff ff       	call   5bd <write>
 67a:	83 c4 10             	add    $0x10,%esp
}
 67d:	90                   	nop
 67e:	c9                   	leave  
 67f:	c3                   	ret    

00000680 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 680:	55                   	push   %ebp
 681:	89 e5                	mov    %esp,%ebp
 683:	53                   	push   %ebx
 684:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 687:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 68e:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 692:	74 17                	je     6ab <printint+0x2b>
 694:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 698:	79 11                	jns    6ab <printint+0x2b>
    neg = 1;
 69a:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 6a1:	8b 45 0c             	mov    0xc(%ebp),%eax
 6a4:	f7 d8                	neg    %eax
 6a6:	89 45 ec             	mov    %eax,-0x14(%ebp)
 6a9:	eb 06                	jmp    6b1 <printint+0x31>
  } else {
    x = xx;
 6ab:	8b 45 0c             	mov    0xc(%ebp),%eax
 6ae:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 6b1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 6b8:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 6bb:	8d 41 01             	lea    0x1(%ecx),%eax
 6be:	89 45 f4             	mov    %eax,-0xc(%ebp)
 6c1:	8b 5d 10             	mov    0x10(%ebp),%ebx
 6c4:	8b 45 ec             	mov    -0x14(%ebp),%eax
 6c7:	ba 00 00 00 00       	mov    $0x0,%edx
 6cc:	f7 f3                	div    %ebx
 6ce:	89 d0                	mov    %edx,%eax
 6d0:	0f b6 80 dc 0d 00 00 	movzbl 0xddc(%eax),%eax
 6d7:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 6db:	8b 5d 10             	mov    0x10(%ebp),%ebx
 6de:	8b 45 ec             	mov    -0x14(%ebp),%eax
 6e1:	ba 00 00 00 00       	mov    $0x0,%edx
 6e6:	f7 f3                	div    %ebx
 6e8:	89 45 ec             	mov    %eax,-0x14(%ebp)
 6eb:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 6ef:	75 c7                	jne    6b8 <printint+0x38>
  if(neg)
 6f1:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 6f5:	74 2d                	je     724 <printint+0xa4>
    buf[i++] = '-';
 6f7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6fa:	8d 50 01             	lea    0x1(%eax),%edx
 6fd:	89 55 f4             	mov    %edx,-0xc(%ebp)
 700:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 705:	eb 1d                	jmp    724 <printint+0xa4>
    putc(fd, buf[i]);
 707:	8d 55 dc             	lea    -0x24(%ebp),%edx
 70a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 70d:	01 d0                	add    %edx,%eax
 70f:	0f b6 00             	movzbl (%eax),%eax
 712:	0f be c0             	movsbl %al,%eax
 715:	83 ec 08             	sub    $0x8,%esp
 718:	50                   	push   %eax
 719:	ff 75 08             	pushl  0x8(%ebp)
 71c:	e8 3c ff ff ff       	call   65d <putc>
 721:	83 c4 10             	add    $0x10,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 724:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 728:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 72c:	79 d9                	jns    707 <printint+0x87>
    putc(fd, buf[i]);
}
 72e:	90                   	nop
 72f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 732:	c9                   	leave  
 733:	c3                   	ret    

00000734 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 734:	55                   	push   %ebp
 735:	89 e5                	mov    %esp,%ebp
 737:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 73a:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 741:	8d 45 0c             	lea    0xc(%ebp),%eax
 744:	83 c0 04             	add    $0x4,%eax
 747:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 74a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 751:	e9 59 01 00 00       	jmp    8af <printf+0x17b>
    c = fmt[i] & 0xff;
 756:	8b 55 0c             	mov    0xc(%ebp),%edx
 759:	8b 45 f0             	mov    -0x10(%ebp),%eax
 75c:	01 d0                	add    %edx,%eax
 75e:	0f b6 00             	movzbl (%eax),%eax
 761:	0f be c0             	movsbl %al,%eax
 764:	25 ff 00 00 00       	and    $0xff,%eax
 769:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 76c:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 770:	75 2c                	jne    79e <printf+0x6a>
      if(c == '%'){
 772:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 776:	75 0c                	jne    784 <printf+0x50>
        state = '%';
 778:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 77f:	e9 27 01 00 00       	jmp    8ab <printf+0x177>
      } else {
        putc(fd, c);
 784:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 787:	0f be c0             	movsbl %al,%eax
 78a:	83 ec 08             	sub    $0x8,%esp
 78d:	50                   	push   %eax
 78e:	ff 75 08             	pushl  0x8(%ebp)
 791:	e8 c7 fe ff ff       	call   65d <putc>
 796:	83 c4 10             	add    $0x10,%esp
 799:	e9 0d 01 00 00       	jmp    8ab <printf+0x177>
      }
    } else if(state == '%'){
 79e:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 7a2:	0f 85 03 01 00 00    	jne    8ab <printf+0x177>
      if(c == 'd'){
 7a8:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 7ac:	75 1e                	jne    7cc <printf+0x98>
        printint(fd, *ap, 10, 1);
 7ae:	8b 45 e8             	mov    -0x18(%ebp),%eax
 7b1:	8b 00                	mov    (%eax),%eax
 7b3:	6a 01                	push   $0x1
 7b5:	6a 0a                	push   $0xa
 7b7:	50                   	push   %eax
 7b8:	ff 75 08             	pushl  0x8(%ebp)
 7bb:	e8 c0 fe ff ff       	call   680 <printint>
 7c0:	83 c4 10             	add    $0x10,%esp
        ap++;
 7c3:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 7c7:	e9 d8 00 00 00       	jmp    8a4 <printf+0x170>
      } else if(c == 'x' || c == 'p'){
 7cc:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 7d0:	74 06                	je     7d8 <printf+0xa4>
 7d2:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 7d6:	75 1e                	jne    7f6 <printf+0xc2>
        printint(fd, *ap, 16, 0);
 7d8:	8b 45 e8             	mov    -0x18(%ebp),%eax
 7db:	8b 00                	mov    (%eax),%eax
 7dd:	6a 00                	push   $0x0
 7df:	6a 10                	push   $0x10
 7e1:	50                   	push   %eax
 7e2:	ff 75 08             	pushl  0x8(%ebp)
 7e5:	e8 96 fe ff ff       	call   680 <printint>
 7ea:	83 c4 10             	add    $0x10,%esp
        ap++;
 7ed:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 7f1:	e9 ae 00 00 00       	jmp    8a4 <printf+0x170>
      } else if(c == 's'){
 7f6:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 7fa:	75 43                	jne    83f <printf+0x10b>
        s = (char*)*ap;
 7fc:	8b 45 e8             	mov    -0x18(%ebp),%eax
 7ff:	8b 00                	mov    (%eax),%eax
 801:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 804:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 808:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 80c:	75 25                	jne    833 <printf+0xff>
          s = "(null)";
 80e:	c7 45 f4 34 0b 00 00 	movl   $0xb34,-0xc(%ebp)
        while(*s != 0){
 815:	eb 1c                	jmp    833 <printf+0xff>
          putc(fd, *s);
 817:	8b 45 f4             	mov    -0xc(%ebp),%eax
 81a:	0f b6 00             	movzbl (%eax),%eax
 81d:	0f be c0             	movsbl %al,%eax
 820:	83 ec 08             	sub    $0x8,%esp
 823:	50                   	push   %eax
 824:	ff 75 08             	pushl  0x8(%ebp)
 827:	e8 31 fe ff ff       	call   65d <putc>
 82c:	83 c4 10             	add    $0x10,%esp
          s++;
 82f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 833:	8b 45 f4             	mov    -0xc(%ebp),%eax
 836:	0f b6 00             	movzbl (%eax),%eax
 839:	84 c0                	test   %al,%al
 83b:	75 da                	jne    817 <printf+0xe3>
 83d:	eb 65                	jmp    8a4 <printf+0x170>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 83f:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 843:	75 1d                	jne    862 <printf+0x12e>
        putc(fd, *ap);
 845:	8b 45 e8             	mov    -0x18(%ebp),%eax
 848:	8b 00                	mov    (%eax),%eax
 84a:	0f be c0             	movsbl %al,%eax
 84d:	83 ec 08             	sub    $0x8,%esp
 850:	50                   	push   %eax
 851:	ff 75 08             	pushl  0x8(%ebp)
 854:	e8 04 fe ff ff       	call   65d <putc>
 859:	83 c4 10             	add    $0x10,%esp
        ap++;
 85c:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 860:	eb 42                	jmp    8a4 <printf+0x170>
      } else if(c == '%'){
 862:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 866:	75 17                	jne    87f <printf+0x14b>
        putc(fd, c);
 868:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 86b:	0f be c0             	movsbl %al,%eax
 86e:	83 ec 08             	sub    $0x8,%esp
 871:	50                   	push   %eax
 872:	ff 75 08             	pushl  0x8(%ebp)
 875:	e8 e3 fd ff ff       	call   65d <putc>
 87a:	83 c4 10             	add    $0x10,%esp
 87d:	eb 25                	jmp    8a4 <printf+0x170>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 87f:	83 ec 08             	sub    $0x8,%esp
 882:	6a 25                	push   $0x25
 884:	ff 75 08             	pushl  0x8(%ebp)
 887:	e8 d1 fd ff ff       	call   65d <putc>
 88c:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
 88f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 892:	0f be c0             	movsbl %al,%eax
 895:	83 ec 08             	sub    $0x8,%esp
 898:	50                   	push   %eax
 899:	ff 75 08             	pushl  0x8(%ebp)
 89c:	e8 bc fd ff ff       	call   65d <putc>
 8a1:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 8a4:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 8ab:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 8af:	8b 55 0c             	mov    0xc(%ebp),%edx
 8b2:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8b5:	01 d0                	add    %edx,%eax
 8b7:	0f b6 00             	movzbl (%eax),%eax
 8ba:	84 c0                	test   %al,%al
 8bc:	0f 85 94 fe ff ff    	jne    756 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 8c2:	90                   	nop
 8c3:	c9                   	leave  
 8c4:	c3                   	ret    

000008c5 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 8c5:	55                   	push   %ebp
 8c6:	89 e5                	mov    %esp,%ebp
 8c8:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 8cb:	8b 45 08             	mov    0x8(%ebp),%eax
 8ce:	83 e8 08             	sub    $0x8,%eax
 8d1:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8d4:	a1 08 0e 00 00       	mov    0xe08,%eax
 8d9:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8dc:	eb 24                	jmp    902 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8de:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8e1:	8b 00                	mov    (%eax),%eax
 8e3:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 8e6:	77 12                	ja     8fa <free+0x35>
 8e8:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8eb:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 8ee:	77 24                	ja     914 <free+0x4f>
 8f0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8f3:	8b 00                	mov    (%eax),%eax
 8f5:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 8f8:	77 1a                	ja     914 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8fa:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8fd:	8b 00                	mov    (%eax),%eax
 8ff:	89 45 fc             	mov    %eax,-0x4(%ebp)
 902:	8b 45 f8             	mov    -0x8(%ebp),%eax
 905:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 908:	76 d4                	jbe    8de <free+0x19>
 90a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 90d:	8b 00                	mov    (%eax),%eax
 90f:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 912:	76 ca                	jbe    8de <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 914:	8b 45 f8             	mov    -0x8(%ebp),%eax
 917:	8b 40 04             	mov    0x4(%eax),%eax
 91a:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 921:	8b 45 f8             	mov    -0x8(%ebp),%eax
 924:	01 c2                	add    %eax,%edx
 926:	8b 45 fc             	mov    -0x4(%ebp),%eax
 929:	8b 00                	mov    (%eax),%eax
 92b:	39 c2                	cmp    %eax,%edx
 92d:	75 24                	jne    953 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 92f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 932:	8b 50 04             	mov    0x4(%eax),%edx
 935:	8b 45 fc             	mov    -0x4(%ebp),%eax
 938:	8b 00                	mov    (%eax),%eax
 93a:	8b 40 04             	mov    0x4(%eax),%eax
 93d:	01 c2                	add    %eax,%edx
 93f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 942:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 945:	8b 45 fc             	mov    -0x4(%ebp),%eax
 948:	8b 00                	mov    (%eax),%eax
 94a:	8b 10                	mov    (%eax),%edx
 94c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 94f:	89 10                	mov    %edx,(%eax)
 951:	eb 0a                	jmp    95d <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 953:	8b 45 fc             	mov    -0x4(%ebp),%eax
 956:	8b 10                	mov    (%eax),%edx
 958:	8b 45 f8             	mov    -0x8(%ebp),%eax
 95b:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 95d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 960:	8b 40 04             	mov    0x4(%eax),%eax
 963:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 96a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 96d:	01 d0                	add    %edx,%eax
 96f:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 972:	75 20                	jne    994 <free+0xcf>
    p->s.size += bp->s.size;
 974:	8b 45 fc             	mov    -0x4(%ebp),%eax
 977:	8b 50 04             	mov    0x4(%eax),%edx
 97a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 97d:	8b 40 04             	mov    0x4(%eax),%eax
 980:	01 c2                	add    %eax,%edx
 982:	8b 45 fc             	mov    -0x4(%ebp),%eax
 985:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 988:	8b 45 f8             	mov    -0x8(%ebp),%eax
 98b:	8b 10                	mov    (%eax),%edx
 98d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 990:	89 10                	mov    %edx,(%eax)
 992:	eb 08                	jmp    99c <free+0xd7>
  } else
    p->s.ptr = bp;
 994:	8b 45 fc             	mov    -0x4(%ebp),%eax
 997:	8b 55 f8             	mov    -0x8(%ebp),%edx
 99a:	89 10                	mov    %edx,(%eax)
  freep = p;
 99c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 99f:	a3 08 0e 00 00       	mov    %eax,0xe08
}
 9a4:	90                   	nop
 9a5:	c9                   	leave  
 9a6:	c3                   	ret    

000009a7 <morecore>:

static Header*
morecore(uint nu)
{
 9a7:	55                   	push   %ebp
 9a8:	89 e5                	mov    %esp,%ebp
 9aa:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 9ad:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 9b4:	77 07                	ja     9bd <morecore+0x16>
    nu = 4096;
 9b6:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 9bd:	8b 45 08             	mov    0x8(%ebp),%eax
 9c0:	c1 e0 03             	shl    $0x3,%eax
 9c3:	83 ec 0c             	sub    $0xc,%esp
 9c6:	50                   	push   %eax
 9c7:	e8 79 fc ff ff       	call   645 <sbrk>
 9cc:	83 c4 10             	add    $0x10,%esp
 9cf:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 9d2:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 9d6:	75 07                	jne    9df <morecore+0x38>
    return 0;
 9d8:	b8 00 00 00 00       	mov    $0x0,%eax
 9dd:	eb 26                	jmp    a05 <morecore+0x5e>
  hp = (Header*)p;
 9df:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9e2:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 9e5:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9e8:	8b 55 08             	mov    0x8(%ebp),%edx
 9eb:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 9ee:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9f1:	83 c0 08             	add    $0x8,%eax
 9f4:	83 ec 0c             	sub    $0xc,%esp
 9f7:	50                   	push   %eax
 9f8:	e8 c8 fe ff ff       	call   8c5 <free>
 9fd:	83 c4 10             	add    $0x10,%esp
  return freep;
 a00:	a1 08 0e 00 00       	mov    0xe08,%eax
}
 a05:	c9                   	leave  
 a06:	c3                   	ret    

00000a07 <malloc>:

void*
malloc(uint nbytes)
{
 a07:	55                   	push   %ebp
 a08:	89 e5                	mov    %esp,%ebp
 a0a:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a0d:	8b 45 08             	mov    0x8(%ebp),%eax
 a10:	83 c0 07             	add    $0x7,%eax
 a13:	c1 e8 03             	shr    $0x3,%eax
 a16:	83 c0 01             	add    $0x1,%eax
 a19:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 a1c:	a1 08 0e 00 00       	mov    0xe08,%eax
 a21:	89 45 f0             	mov    %eax,-0x10(%ebp)
 a24:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 a28:	75 23                	jne    a4d <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 a2a:	c7 45 f0 00 0e 00 00 	movl   $0xe00,-0x10(%ebp)
 a31:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a34:	a3 08 0e 00 00       	mov    %eax,0xe08
 a39:	a1 08 0e 00 00       	mov    0xe08,%eax
 a3e:	a3 00 0e 00 00       	mov    %eax,0xe00
    base.s.size = 0;
 a43:	c7 05 04 0e 00 00 00 	movl   $0x0,0xe04
 a4a:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a4d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a50:	8b 00                	mov    (%eax),%eax
 a52:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 a55:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a58:	8b 40 04             	mov    0x4(%eax),%eax
 a5b:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 a5e:	72 4d                	jb     aad <malloc+0xa6>
      if(p->s.size == nunits)
 a60:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a63:	8b 40 04             	mov    0x4(%eax),%eax
 a66:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 a69:	75 0c                	jne    a77 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 a6b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a6e:	8b 10                	mov    (%eax),%edx
 a70:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a73:	89 10                	mov    %edx,(%eax)
 a75:	eb 26                	jmp    a9d <malloc+0x96>
      else {
        p->s.size -= nunits;
 a77:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a7a:	8b 40 04             	mov    0x4(%eax),%eax
 a7d:	2b 45 ec             	sub    -0x14(%ebp),%eax
 a80:	89 c2                	mov    %eax,%edx
 a82:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a85:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 a88:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a8b:	8b 40 04             	mov    0x4(%eax),%eax
 a8e:	c1 e0 03             	shl    $0x3,%eax
 a91:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 a94:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a97:	8b 55 ec             	mov    -0x14(%ebp),%edx
 a9a:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 a9d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 aa0:	a3 08 0e 00 00       	mov    %eax,0xe08
      return (void*)(p + 1);
 aa5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 aa8:	83 c0 08             	add    $0x8,%eax
 aab:	eb 3b                	jmp    ae8 <malloc+0xe1>
    }
    if(p == freep)
 aad:	a1 08 0e 00 00       	mov    0xe08,%eax
 ab2:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 ab5:	75 1e                	jne    ad5 <malloc+0xce>
      if((p = morecore(nunits)) == 0)
 ab7:	83 ec 0c             	sub    $0xc,%esp
 aba:	ff 75 ec             	pushl  -0x14(%ebp)
 abd:	e8 e5 fe ff ff       	call   9a7 <morecore>
 ac2:	83 c4 10             	add    $0x10,%esp
 ac5:	89 45 f4             	mov    %eax,-0xc(%ebp)
 ac8:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 acc:	75 07                	jne    ad5 <malloc+0xce>
        return 0;
 ace:	b8 00 00 00 00       	mov    $0x0,%eax
 ad3:	eb 13                	jmp    ae8 <malloc+0xe1>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 ad5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ad8:	89 45 f0             	mov    %eax,-0x10(%ebp)
 adb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ade:	8b 00                	mov    (%eax),%eax
 ae0:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 ae3:	e9 6d ff ff ff       	jmp    a55 <malloc+0x4e>
}
 ae8:	c9                   	leave  
 ae9:	c3                   	ret    
