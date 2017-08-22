
_grep:     file format elf32-i386


Disassembly of section .text:

00000000 <grep>:
char buf[1024];
int match(char*, char*);

void
grep(char *pattern, int fd)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 18             	sub    $0x18,%esp
  int n, m;
  char *p, *q;
  
  m = 0;
   6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  while((n = read(fd, buf+m, sizeof(buf)-m-1)) > 0){
   d:	e9 b6 00 00 00       	jmp    c8 <grep+0xc8>
    m += n;
  12:	8b 45 ec             	mov    -0x14(%ebp),%eax
  15:	01 45 f4             	add    %eax,-0xc(%ebp)
    buf[m] = '\0';
  18:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1b:	05 20 0e 00 00       	add    $0xe20,%eax
  20:	c6 00 00             	movb   $0x0,(%eax)
    p = buf;
  23:	c7 45 f0 20 0e 00 00 	movl   $0xe20,-0x10(%ebp)
    while((q = strchr(p, '\n')) != 0){
  2a:	eb 4a                	jmp    76 <grep+0x76>
      *q = 0;
  2c:	8b 45 e8             	mov    -0x18(%ebp),%eax
  2f:	c6 00 00             	movb   $0x0,(%eax)
      if(match(pattern, p)){
  32:	83 ec 08             	sub    $0x8,%esp
  35:	ff 75 f0             	pushl  -0x10(%ebp)
  38:	ff 75 08             	pushl  0x8(%ebp)
  3b:	e8 9a 01 00 00       	call   1da <match>
  40:	83 c4 10             	add    $0x10,%esp
  43:	85 c0                	test   %eax,%eax
  45:	74 26                	je     6d <grep+0x6d>
        *q = '\n';
  47:	8b 45 e8             	mov    -0x18(%ebp),%eax
  4a:	c6 00 0a             	movb   $0xa,(%eax)
        write(1, p, q+1 - p);
  4d:	8b 45 e8             	mov    -0x18(%ebp),%eax
  50:	83 c0 01             	add    $0x1,%eax
  53:	89 c2                	mov    %eax,%edx
  55:	8b 45 f0             	mov    -0x10(%ebp),%eax
  58:	29 c2                	sub    %eax,%edx
  5a:	89 d0                	mov    %edx,%eax
  5c:	83 ec 04             	sub    $0x4,%esp
  5f:	50                   	push   %eax
  60:	ff 75 f0             	pushl  -0x10(%ebp)
  63:	6a 01                	push   $0x1
  65:	e8 43 05 00 00       	call   5ad <write>
  6a:	83 c4 10             	add    $0x10,%esp
      }
      p = q+1;
  6d:	8b 45 e8             	mov    -0x18(%ebp),%eax
  70:	83 c0 01             	add    $0x1,%eax
  73:	89 45 f0             	mov    %eax,-0x10(%ebp)
  m = 0;
  while((n = read(fd, buf+m, sizeof(buf)-m-1)) > 0){
    m += n;
    buf[m] = '\0';
    p = buf;
    while((q = strchr(p, '\n')) != 0){
  76:	83 ec 08             	sub    $0x8,%esp
  79:	6a 0a                	push   $0xa
  7b:	ff 75 f0             	pushl  -0x10(%ebp)
  7e:	e8 89 03 00 00       	call   40c <strchr>
  83:	83 c4 10             	add    $0x10,%esp
  86:	89 45 e8             	mov    %eax,-0x18(%ebp)
  89:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  8d:	75 9d                	jne    2c <grep+0x2c>
        *q = '\n';
        write(1, p, q+1 - p);
      }
      p = q+1;
    }
    if(p == buf)
  8f:	81 7d f0 20 0e 00 00 	cmpl   $0xe20,-0x10(%ebp)
  96:	75 07                	jne    9f <grep+0x9f>
      m = 0;
  98:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    if(m > 0){
  9f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  a3:	7e 23                	jle    c8 <grep+0xc8>
      m -= p - buf;
  a5:	8b 45 f0             	mov    -0x10(%ebp),%eax
  a8:	ba 20 0e 00 00       	mov    $0xe20,%edx
  ad:	29 d0                	sub    %edx,%eax
  af:	29 45 f4             	sub    %eax,-0xc(%ebp)
      memmove(buf, p, m);
  b2:	83 ec 04             	sub    $0x4,%esp
  b5:	ff 75 f4             	pushl  -0xc(%ebp)
  b8:	ff 75 f0             	pushl  -0x10(%ebp)
  bb:	68 20 0e 00 00       	push   $0xe20
  c0:	e8 83 04 00 00       	call   548 <memmove>
  c5:	83 c4 10             	add    $0x10,%esp
{
  int n, m;
  char *p, *q;
  
  m = 0;
  while((n = read(fd, buf+m, sizeof(buf)-m-1)) > 0){
  c8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  cb:	ba ff 03 00 00       	mov    $0x3ff,%edx
  d0:	29 c2                	sub    %eax,%edx
  d2:	89 d0                	mov    %edx,%eax
  d4:	89 c2                	mov    %eax,%edx
  d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
  d9:	05 20 0e 00 00       	add    $0xe20,%eax
  de:	83 ec 04             	sub    $0x4,%esp
  e1:	52                   	push   %edx
  e2:	50                   	push   %eax
  e3:	ff 75 0c             	pushl  0xc(%ebp)
  e6:	e8 ba 04 00 00       	call   5a5 <read>
  eb:	83 c4 10             	add    $0x10,%esp
  ee:	89 45 ec             	mov    %eax,-0x14(%ebp)
  f1:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
  f5:	0f 8f 17 ff ff ff    	jg     12 <grep+0x12>
    if(m > 0){
      m -= p - buf;
      memmove(buf, p, m);
    }
  }
}
  fb:	90                   	nop
  fc:	c9                   	leave  
  fd:	c3                   	ret    

000000fe <main>:

int
main(int argc, char *argv[])
{
  fe:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 102:	83 e4 f0             	and    $0xfffffff0,%esp
 105:	ff 71 fc             	pushl  -0x4(%ecx)
 108:	55                   	push   %ebp
 109:	89 e5                	mov    %esp,%ebp
 10b:	53                   	push   %ebx
 10c:	51                   	push   %ecx
 10d:	83 ec 10             	sub    $0x10,%esp
 110:	89 cb                	mov    %ecx,%ebx
  int fd, i;
  char *pattern;
  
  if(argc <= 1){
 112:	83 3b 01             	cmpl   $0x1,(%ebx)
 115:	7f 17                	jg     12e <main+0x30>
    printf(2, "usage: grep pattern [file ...]\n");
 117:	83 ec 08             	sub    $0x8,%esp
 11a:	68 dc 0a 00 00       	push   $0xadc
 11f:	6a 02                	push   $0x2
 121:	e8 fe 05 00 00       	call   724 <printf>
 126:	83 c4 10             	add    $0x10,%esp
    exit();
 129:	e8 5f 04 00 00       	call   58d <exit>
  }
  pattern = argv[1];
 12e:	8b 43 04             	mov    0x4(%ebx),%eax
 131:	8b 40 04             	mov    0x4(%eax),%eax
 134:	89 45 f0             	mov    %eax,-0x10(%ebp)
  
  if(argc <= 2){
 137:	83 3b 02             	cmpl   $0x2,(%ebx)
 13a:	7f 15                	jg     151 <main+0x53>
    grep(pattern, 0);
 13c:	83 ec 08             	sub    $0x8,%esp
 13f:	6a 00                	push   $0x0
 141:	ff 75 f0             	pushl  -0x10(%ebp)
 144:	e8 b7 fe ff ff       	call   0 <grep>
 149:	83 c4 10             	add    $0x10,%esp
    exit();
 14c:	e8 3c 04 00 00       	call   58d <exit>
  }

  for(i = 2; i < argc; i++){
 151:	c7 45 f4 02 00 00 00 	movl   $0x2,-0xc(%ebp)
 158:	eb 74                	jmp    1ce <main+0xd0>
    if((fd = open(argv[i], 0)) < 0){
 15a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 15d:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 164:	8b 43 04             	mov    0x4(%ebx),%eax
 167:	01 d0                	add    %edx,%eax
 169:	8b 00                	mov    (%eax),%eax
 16b:	83 ec 08             	sub    $0x8,%esp
 16e:	6a 00                	push   $0x0
 170:	50                   	push   %eax
 171:	e8 57 04 00 00       	call   5cd <open>
 176:	83 c4 10             	add    $0x10,%esp
 179:	89 45 ec             	mov    %eax,-0x14(%ebp)
 17c:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 180:	79 29                	jns    1ab <main+0xad>
      printf(1, "grep: cannot open %s\n", argv[i]);
 182:	8b 45 f4             	mov    -0xc(%ebp),%eax
 185:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 18c:	8b 43 04             	mov    0x4(%ebx),%eax
 18f:	01 d0                	add    %edx,%eax
 191:	8b 00                	mov    (%eax),%eax
 193:	83 ec 04             	sub    $0x4,%esp
 196:	50                   	push   %eax
 197:	68 fc 0a 00 00       	push   $0xafc
 19c:	6a 01                	push   $0x1
 19e:	e8 81 05 00 00       	call   724 <printf>
 1a3:	83 c4 10             	add    $0x10,%esp
      exit();
 1a6:	e8 e2 03 00 00       	call   58d <exit>
    }
    grep(pattern, fd);
 1ab:	83 ec 08             	sub    $0x8,%esp
 1ae:	ff 75 ec             	pushl  -0x14(%ebp)
 1b1:	ff 75 f0             	pushl  -0x10(%ebp)
 1b4:	e8 47 fe ff ff       	call   0 <grep>
 1b9:	83 c4 10             	add    $0x10,%esp
    close(fd);
 1bc:	83 ec 0c             	sub    $0xc,%esp
 1bf:	ff 75 ec             	pushl  -0x14(%ebp)
 1c2:	e8 ee 03 00 00       	call   5b5 <close>
 1c7:	83 c4 10             	add    $0x10,%esp
  if(argc <= 2){
    grep(pattern, 0);
    exit();
  }

  for(i = 2; i < argc; i++){
 1ca:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
 1ce:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1d1:	3b 03                	cmp    (%ebx),%eax
 1d3:	7c 85                	jl     15a <main+0x5c>
      exit();
    }
    grep(pattern, fd);
    close(fd);
  }
  exit();
 1d5:	e8 b3 03 00 00       	call   58d <exit>

000001da <match>:
int matchhere(char*, char*);
int matchstar(int, char*, char*);

int
match(char *re, char *text)
{
 1da:	55                   	push   %ebp
 1db:	89 e5                	mov    %esp,%ebp
 1dd:	83 ec 08             	sub    $0x8,%esp
  if(re[0] == '^')
 1e0:	8b 45 08             	mov    0x8(%ebp),%eax
 1e3:	0f b6 00             	movzbl (%eax),%eax
 1e6:	3c 5e                	cmp    $0x5e,%al
 1e8:	75 17                	jne    201 <match+0x27>
    return matchhere(re+1, text);
 1ea:	8b 45 08             	mov    0x8(%ebp),%eax
 1ed:	83 c0 01             	add    $0x1,%eax
 1f0:	83 ec 08             	sub    $0x8,%esp
 1f3:	ff 75 0c             	pushl  0xc(%ebp)
 1f6:	50                   	push   %eax
 1f7:	e8 38 00 00 00       	call   234 <matchhere>
 1fc:	83 c4 10             	add    $0x10,%esp
 1ff:	eb 31                	jmp    232 <match+0x58>
  do{  // must look at empty string
    if(matchhere(re, text))
 201:	83 ec 08             	sub    $0x8,%esp
 204:	ff 75 0c             	pushl  0xc(%ebp)
 207:	ff 75 08             	pushl  0x8(%ebp)
 20a:	e8 25 00 00 00       	call   234 <matchhere>
 20f:	83 c4 10             	add    $0x10,%esp
 212:	85 c0                	test   %eax,%eax
 214:	74 07                	je     21d <match+0x43>
      return 1;
 216:	b8 01 00 00 00       	mov    $0x1,%eax
 21b:	eb 15                	jmp    232 <match+0x58>
  }while(*text++ != '\0');
 21d:	8b 45 0c             	mov    0xc(%ebp),%eax
 220:	8d 50 01             	lea    0x1(%eax),%edx
 223:	89 55 0c             	mov    %edx,0xc(%ebp)
 226:	0f b6 00             	movzbl (%eax),%eax
 229:	84 c0                	test   %al,%al
 22b:	75 d4                	jne    201 <match+0x27>
  return 0;
 22d:	b8 00 00 00 00       	mov    $0x0,%eax
}
 232:	c9                   	leave  
 233:	c3                   	ret    

00000234 <matchhere>:

// matchhere: search for re at beginning of text
int matchhere(char *re, char *text)
{
 234:	55                   	push   %ebp
 235:	89 e5                	mov    %esp,%ebp
 237:	83 ec 08             	sub    $0x8,%esp
  if(re[0] == '\0')
 23a:	8b 45 08             	mov    0x8(%ebp),%eax
 23d:	0f b6 00             	movzbl (%eax),%eax
 240:	84 c0                	test   %al,%al
 242:	75 0a                	jne    24e <matchhere+0x1a>
    return 1;
 244:	b8 01 00 00 00       	mov    $0x1,%eax
 249:	e9 99 00 00 00       	jmp    2e7 <matchhere+0xb3>
  if(re[1] == '*')
 24e:	8b 45 08             	mov    0x8(%ebp),%eax
 251:	83 c0 01             	add    $0x1,%eax
 254:	0f b6 00             	movzbl (%eax),%eax
 257:	3c 2a                	cmp    $0x2a,%al
 259:	75 21                	jne    27c <matchhere+0x48>
    return matchstar(re[0], re+2, text);
 25b:	8b 45 08             	mov    0x8(%ebp),%eax
 25e:	8d 50 02             	lea    0x2(%eax),%edx
 261:	8b 45 08             	mov    0x8(%ebp),%eax
 264:	0f b6 00             	movzbl (%eax),%eax
 267:	0f be c0             	movsbl %al,%eax
 26a:	83 ec 04             	sub    $0x4,%esp
 26d:	ff 75 0c             	pushl  0xc(%ebp)
 270:	52                   	push   %edx
 271:	50                   	push   %eax
 272:	e8 72 00 00 00       	call   2e9 <matchstar>
 277:	83 c4 10             	add    $0x10,%esp
 27a:	eb 6b                	jmp    2e7 <matchhere+0xb3>
  if(re[0] == '$' && re[1] == '\0')
 27c:	8b 45 08             	mov    0x8(%ebp),%eax
 27f:	0f b6 00             	movzbl (%eax),%eax
 282:	3c 24                	cmp    $0x24,%al
 284:	75 1d                	jne    2a3 <matchhere+0x6f>
 286:	8b 45 08             	mov    0x8(%ebp),%eax
 289:	83 c0 01             	add    $0x1,%eax
 28c:	0f b6 00             	movzbl (%eax),%eax
 28f:	84 c0                	test   %al,%al
 291:	75 10                	jne    2a3 <matchhere+0x6f>
    return *text == '\0';
 293:	8b 45 0c             	mov    0xc(%ebp),%eax
 296:	0f b6 00             	movzbl (%eax),%eax
 299:	84 c0                	test   %al,%al
 29b:	0f 94 c0             	sete   %al
 29e:	0f b6 c0             	movzbl %al,%eax
 2a1:	eb 44                	jmp    2e7 <matchhere+0xb3>
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
 2a3:	8b 45 0c             	mov    0xc(%ebp),%eax
 2a6:	0f b6 00             	movzbl (%eax),%eax
 2a9:	84 c0                	test   %al,%al
 2ab:	74 35                	je     2e2 <matchhere+0xae>
 2ad:	8b 45 08             	mov    0x8(%ebp),%eax
 2b0:	0f b6 00             	movzbl (%eax),%eax
 2b3:	3c 2e                	cmp    $0x2e,%al
 2b5:	74 10                	je     2c7 <matchhere+0x93>
 2b7:	8b 45 08             	mov    0x8(%ebp),%eax
 2ba:	0f b6 10             	movzbl (%eax),%edx
 2bd:	8b 45 0c             	mov    0xc(%ebp),%eax
 2c0:	0f b6 00             	movzbl (%eax),%eax
 2c3:	38 c2                	cmp    %al,%dl
 2c5:	75 1b                	jne    2e2 <matchhere+0xae>
    return matchhere(re+1, text+1);
 2c7:	8b 45 0c             	mov    0xc(%ebp),%eax
 2ca:	8d 50 01             	lea    0x1(%eax),%edx
 2cd:	8b 45 08             	mov    0x8(%ebp),%eax
 2d0:	83 c0 01             	add    $0x1,%eax
 2d3:	83 ec 08             	sub    $0x8,%esp
 2d6:	52                   	push   %edx
 2d7:	50                   	push   %eax
 2d8:	e8 57 ff ff ff       	call   234 <matchhere>
 2dd:	83 c4 10             	add    $0x10,%esp
 2e0:	eb 05                	jmp    2e7 <matchhere+0xb3>
  return 0;
 2e2:	b8 00 00 00 00       	mov    $0x0,%eax
}
 2e7:	c9                   	leave  
 2e8:	c3                   	ret    

000002e9 <matchstar>:

// matchstar: search for c*re at beginning of text
int matchstar(int c, char *re, char *text)
{
 2e9:	55                   	push   %ebp
 2ea:	89 e5                	mov    %esp,%ebp
 2ec:	83 ec 08             	sub    $0x8,%esp
  do{  // a * matches zero or more instances
    if(matchhere(re, text))
 2ef:	83 ec 08             	sub    $0x8,%esp
 2f2:	ff 75 10             	pushl  0x10(%ebp)
 2f5:	ff 75 0c             	pushl  0xc(%ebp)
 2f8:	e8 37 ff ff ff       	call   234 <matchhere>
 2fd:	83 c4 10             	add    $0x10,%esp
 300:	85 c0                	test   %eax,%eax
 302:	74 07                	je     30b <matchstar+0x22>
      return 1;
 304:	b8 01 00 00 00       	mov    $0x1,%eax
 309:	eb 29                	jmp    334 <matchstar+0x4b>
  }while(*text!='\0' && (*text++==c || c=='.'));
 30b:	8b 45 10             	mov    0x10(%ebp),%eax
 30e:	0f b6 00             	movzbl (%eax),%eax
 311:	84 c0                	test   %al,%al
 313:	74 1a                	je     32f <matchstar+0x46>
 315:	8b 45 10             	mov    0x10(%ebp),%eax
 318:	8d 50 01             	lea    0x1(%eax),%edx
 31b:	89 55 10             	mov    %edx,0x10(%ebp)
 31e:	0f b6 00             	movzbl (%eax),%eax
 321:	0f be c0             	movsbl %al,%eax
 324:	3b 45 08             	cmp    0x8(%ebp),%eax
 327:	74 c6                	je     2ef <matchstar+0x6>
 329:	83 7d 08 2e          	cmpl   $0x2e,0x8(%ebp)
 32d:	74 c0                	je     2ef <matchstar+0x6>
  return 0;
 32f:	b8 00 00 00 00       	mov    $0x0,%eax
}
 334:	c9                   	leave  
 335:	c3                   	ret    

00000336 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 336:	55                   	push   %ebp
 337:	89 e5                	mov    %esp,%ebp
 339:	57                   	push   %edi
 33a:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 33b:	8b 4d 08             	mov    0x8(%ebp),%ecx
 33e:	8b 55 10             	mov    0x10(%ebp),%edx
 341:	8b 45 0c             	mov    0xc(%ebp),%eax
 344:	89 cb                	mov    %ecx,%ebx
 346:	89 df                	mov    %ebx,%edi
 348:	89 d1                	mov    %edx,%ecx
 34a:	fc                   	cld    
 34b:	f3 aa                	rep stos %al,%es:(%edi)
 34d:	89 ca                	mov    %ecx,%edx
 34f:	89 fb                	mov    %edi,%ebx
 351:	89 5d 08             	mov    %ebx,0x8(%ebp)
 354:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 357:	90                   	nop
 358:	5b                   	pop    %ebx
 359:	5f                   	pop    %edi
 35a:	5d                   	pop    %ebp
 35b:	c3                   	ret    

0000035c <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 35c:	55                   	push   %ebp
 35d:	89 e5                	mov    %esp,%ebp
 35f:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 362:	8b 45 08             	mov    0x8(%ebp),%eax
 365:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 368:	90                   	nop
 369:	8b 45 08             	mov    0x8(%ebp),%eax
 36c:	8d 50 01             	lea    0x1(%eax),%edx
 36f:	89 55 08             	mov    %edx,0x8(%ebp)
 372:	8b 55 0c             	mov    0xc(%ebp),%edx
 375:	8d 4a 01             	lea    0x1(%edx),%ecx
 378:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 37b:	0f b6 12             	movzbl (%edx),%edx
 37e:	88 10                	mov    %dl,(%eax)
 380:	0f b6 00             	movzbl (%eax),%eax
 383:	84 c0                	test   %al,%al
 385:	75 e2                	jne    369 <strcpy+0xd>
    ;
  return os;
 387:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 38a:	c9                   	leave  
 38b:	c3                   	ret    

0000038c <strcmp>:

int
strcmp(const char *p, const char *q)
{
 38c:	55                   	push   %ebp
 38d:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 38f:	eb 08                	jmp    399 <strcmp+0xd>
    p++, q++;
 391:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 395:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 399:	8b 45 08             	mov    0x8(%ebp),%eax
 39c:	0f b6 00             	movzbl (%eax),%eax
 39f:	84 c0                	test   %al,%al
 3a1:	74 10                	je     3b3 <strcmp+0x27>
 3a3:	8b 45 08             	mov    0x8(%ebp),%eax
 3a6:	0f b6 10             	movzbl (%eax),%edx
 3a9:	8b 45 0c             	mov    0xc(%ebp),%eax
 3ac:	0f b6 00             	movzbl (%eax),%eax
 3af:	38 c2                	cmp    %al,%dl
 3b1:	74 de                	je     391 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 3b3:	8b 45 08             	mov    0x8(%ebp),%eax
 3b6:	0f b6 00             	movzbl (%eax),%eax
 3b9:	0f b6 d0             	movzbl %al,%edx
 3bc:	8b 45 0c             	mov    0xc(%ebp),%eax
 3bf:	0f b6 00             	movzbl (%eax),%eax
 3c2:	0f b6 c0             	movzbl %al,%eax
 3c5:	29 c2                	sub    %eax,%edx
 3c7:	89 d0                	mov    %edx,%eax
}
 3c9:	5d                   	pop    %ebp
 3ca:	c3                   	ret    

000003cb <strlen>:

uint
strlen(char *s)
{
 3cb:	55                   	push   %ebp
 3cc:	89 e5                	mov    %esp,%ebp
 3ce:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 3d1:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 3d8:	eb 04                	jmp    3de <strlen+0x13>
 3da:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 3de:	8b 55 fc             	mov    -0x4(%ebp),%edx
 3e1:	8b 45 08             	mov    0x8(%ebp),%eax
 3e4:	01 d0                	add    %edx,%eax
 3e6:	0f b6 00             	movzbl (%eax),%eax
 3e9:	84 c0                	test   %al,%al
 3eb:	75 ed                	jne    3da <strlen+0xf>
    ;
  return n;
 3ed:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 3f0:	c9                   	leave  
 3f1:	c3                   	ret    

000003f2 <memset>:

void*
memset(void *dst, int c, uint n)
{
 3f2:	55                   	push   %ebp
 3f3:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
 3f5:	8b 45 10             	mov    0x10(%ebp),%eax
 3f8:	50                   	push   %eax
 3f9:	ff 75 0c             	pushl  0xc(%ebp)
 3fc:	ff 75 08             	pushl  0x8(%ebp)
 3ff:	e8 32 ff ff ff       	call   336 <stosb>
 404:	83 c4 0c             	add    $0xc,%esp
  return dst;
 407:	8b 45 08             	mov    0x8(%ebp),%eax
}
 40a:	c9                   	leave  
 40b:	c3                   	ret    

0000040c <strchr>:

char*
strchr(const char *s, char c)
{
 40c:	55                   	push   %ebp
 40d:	89 e5                	mov    %esp,%ebp
 40f:	83 ec 04             	sub    $0x4,%esp
 412:	8b 45 0c             	mov    0xc(%ebp),%eax
 415:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 418:	eb 14                	jmp    42e <strchr+0x22>
    if(*s == c)
 41a:	8b 45 08             	mov    0x8(%ebp),%eax
 41d:	0f b6 00             	movzbl (%eax),%eax
 420:	3a 45 fc             	cmp    -0x4(%ebp),%al
 423:	75 05                	jne    42a <strchr+0x1e>
      return (char*)s;
 425:	8b 45 08             	mov    0x8(%ebp),%eax
 428:	eb 13                	jmp    43d <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 42a:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 42e:	8b 45 08             	mov    0x8(%ebp),%eax
 431:	0f b6 00             	movzbl (%eax),%eax
 434:	84 c0                	test   %al,%al
 436:	75 e2                	jne    41a <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 438:	b8 00 00 00 00       	mov    $0x0,%eax
}
 43d:	c9                   	leave  
 43e:	c3                   	ret    

0000043f <gets>:

char*
gets(char *buf, int max)
{
 43f:	55                   	push   %ebp
 440:	89 e5                	mov    %esp,%ebp
 442:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 445:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 44c:	eb 42                	jmp    490 <gets+0x51>
    cc = read(0, &c, 1);
 44e:	83 ec 04             	sub    $0x4,%esp
 451:	6a 01                	push   $0x1
 453:	8d 45 ef             	lea    -0x11(%ebp),%eax
 456:	50                   	push   %eax
 457:	6a 00                	push   $0x0
 459:	e8 47 01 00 00       	call   5a5 <read>
 45e:	83 c4 10             	add    $0x10,%esp
 461:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 464:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 468:	7e 33                	jle    49d <gets+0x5e>
      break;
    buf[i++] = c;
 46a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 46d:	8d 50 01             	lea    0x1(%eax),%edx
 470:	89 55 f4             	mov    %edx,-0xc(%ebp)
 473:	89 c2                	mov    %eax,%edx
 475:	8b 45 08             	mov    0x8(%ebp),%eax
 478:	01 c2                	add    %eax,%edx
 47a:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 47e:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 480:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 484:	3c 0a                	cmp    $0xa,%al
 486:	74 16                	je     49e <gets+0x5f>
 488:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 48c:	3c 0d                	cmp    $0xd,%al
 48e:	74 0e                	je     49e <gets+0x5f>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 490:	8b 45 f4             	mov    -0xc(%ebp),%eax
 493:	83 c0 01             	add    $0x1,%eax
 496:	3b 45 0c             	cmp    0xc(%ebp),%eax
 499:	7c b3                	jl     44e <gets+0xf>
 49b:	eb 01                	jmp    49e <gets+0x5f>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 49d:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 49e:	8b 55 f4             	mov    -0xc(%ebp),%edx
 4a1:	8b 45 08             	mov    0x8(%ebp),%eax
 4a4:	01 d0                	add    %edx,%eax
 4a6:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 4a9:	8b 45 08             	mov    0x8(%ebp),%eax
}
 4ac:	c9                   	leave  
 4ad:	c3                   	ret    

000004ae <stat>:

int
stat(char *n, struct stat *st)
{
 4ae:	55                   	push   %ebp
 4af:	89 e5                	mov    %esp,%ebp
 4b1:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4b4:	83 ec 08             	sub    $0x8,%esp
 4b7:	6a 00                	push   $0x0
 4b9:	ff 75 08             	pushl  0x8(%ebp)
 4bc:	e8 0c 01 00 00       	call   5cd <open>
 4c1:	83 c4 10             	add    $0x10,%esp
 4c4:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 4c7:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 4cb:	79 07                	jns    4d4 <stat+0x26>
    return -1;
 4cd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 4d2:	eb 25                	jmp    4f9 <stat+0x4b>
  r = fstat(fd, st);
 4d4:	83 ec 08             	sub    $0x8,%esp
 4d7:	ff 75 0c             	pushl  0xc(%ebp)
 4da:	ff 75 f4             	pushl  -0xc(%ebp)
 4dd:	e8 03 01 00 00       	call   5e5 <fstat>
 4e2:	83 c4 10             	add    $0x10,%esp
 4e5:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 4e8:	83 ec 0c             	sub    $0xc,%esp
 4eb:	ff 75 f4             	pushl  -0xc(%ebp)
 4ee:	e8 c2 00 00 00       	call   5b5 <close>
 4f3:	83 c4 10             	add    $0x10,%esp
  return r;
 4f6:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 4f9:	c9                   	leave  
 4fa:	c3                   	ret    

000004fb <atoi>:

int
atoi(const char *s)
{
 4fb:	55                   	push   %ebp
 4fc:	89 e5                	mov    %esp,%ebp
 4fe:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 501:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 508:	eb 25                	jmp    52f <atoi+0x34>
    n = n*10 + *s++ - '0';
 50a:	8b 55 fc             	mov    -0x4(%ebp),%edx
 50d:	89 d0                	mov    %edx,%eax
 50f:	c1 e0 02             	shl    $0x2,%eax
 512:	01 d0                	add    %edx,%eax
 514:	01 c0                	add    %eax,%eax
 516:	89 c1                	mov    %eax,%ecx
 518:	8b 45 08             	mov    0x8(%ebp),%eax
 51b:	8d 50 01             	lea    0x1(%eax),%edx
 51e:	89 55 08             	mov    %edx,0x8(%ebp)
 521:	0f b6 00             	movzbl (%eax),%eax
 524:	0f be c0             	movsbl %al,%eax
 527:	01 c8                	add    %ecx,%eax
 529:	83 e8 30             	sub    $0x30,%eax
 52c:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 52f:	8b 45 08             	mov    0x8(%ebp),%eax
 532:	0f b6 00             	movzbl (%eax),%eax
 535:	3c 2f                	cmp    $0x2f,%al
 537:	7e 0a                	jle    543 <atoi+0x48>
 539:	8b 45 08             	mov    0x8(%ebp),%eax
 53c:	0f b6 00             	movzbl (%eax),%eax
 53f:	3c 39                	cmp    $0x39,%al
 541:	7e c7                	jle    50a <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 543:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 546:	c9                   	leave  
 547:	c3                   	ret    

00000548 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 548:	55                   	push   %ebp
 549:	89 e5                	mov    %esp,%ebp
 54b:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 54e:	8b 45 08             	mov    0x8(%ebp),%eax
 551:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 554:	8b 45 0c             	mov    0xc(%ebp),%eax
 557:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 55a:	eb 17                	jmp    573 <memmove+0x2b>
    *dst++ = *src++;
 55c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 55f:	8d 50 01             	lea    0x1(%eax),%edx
 562:	89 55 fc             	mov    %edx,-0x4(%ebp)
 565:	8b 55 f8             	mov    -0x8(%ebp),%edx
 568:	8d 4a 01             	lea    0x1(%edx),%ecx
 56b:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 56e:	0f b6 12             	movzbl (%edx),%edx
 571:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 573:	8b 45 10             	mov    0x10(%ebp),%eax
 576:	8d 50 ff             	lea    -0x1(%eax),%edx
 579:	89 55 10             	mov    %edx,0x10(%ebp)
 57c:	85 c0                	test   %eax,%eax
 57e:	7f dc                	jg     55c <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 580:	8b 45 08             	mov    0x8(%ebp),%eax
}
 583:	c9                   	leave  
 584:	c3                   	ret    

00000585 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 585:	b8 01 00 00 00       	mov    $0x1,%eax
 58a:	cd 40                	int    $0x40
 58c:	c3                   	ret    

0000058d <exit>:
SYSCALL(exit)
 58d:	b8 02 00 00 00       	mov    $0x2,%eax
 592:	cd 40                	int    $0x40
 594:	c3                   	ret    

00000595 <wait>:
SYSCALL(wait)
 595:	b8 03 00 00 00       	mov    $0x3,%eax
 59a:	cd 40                	int    $0x40
 59c:	c3                   	ret    

0000059d <pipe>:
SYSCALL(pipe)
 59d:	b8 04 00 00 00       	mov    $0x4,%eax
 5a2:	cd 40                	int    $0x40
 5a4:	c3                   	ret    

000005a5 <read>:
SYSCALL(read)
 5a5:	b8 05 00 00 00       	mov    $0x5,%eax
 5aa:	cd 40                	int    $0x40
 5ac:	c3                   	ret    

000005ad <write>:
SYSCALL(write)
 5ad:	b8 10 00 00 00       	mov    $0x10,%eax
 5b2:	cd 40                	int    $0x40
 5b4:	c3                   	ret    

000005b5 <close>:
SYSCALL(close)
 5b5:	b8 15 00 00 00       	mov    $0x15,%eax
 5ba:	cd 40                	int    $0x40
 5bc:	c3                   	ret    

000005bd <kill>:
SYSCALL(kill)
 5bd:	b8 06 00 00 00       	mov    $0x6,%eax
 5c2:	cd 40                	int    $0x40
 5c4:	c3                   	ret    

000005c5 <exec>:
SYSCALL(exec)
 5c5:	b8 07 00 00 00       	mov    $0x7,%eax
 5ca:	cd 40                	int    $0x40
 5cc:	c3                   	ret    

000005cd <open>:
SYSCALL(open)
 5cd:	b8 0f 00 00 00       	mov    $0xf,%eax
 5d2:	cd 40                	int    $0x40
 5d4:	c3                   	ret    

000005d5 <mknod>:
SYSCALL(mknod)
 5d5:	b8 11 00 00 00       	mov    $0x11,%eax
 5da:	cd 40                	int    $0x40
 5dc:	c3                   	ret    

000005dd <unlink>:
SYSCALL(unlink)
 5dd:	b8 12 00 00 00       	mov    $0x12,%eax
 5e2:	cd 40                	int    $0x40
 5e4:	c3                   	ret    

000005e5 <fstat>:
SYSCALL(fstat)
 5e5:	b8 08 00 00 00       	mov    $0x8,%eax
 5ea:	cd 40                	int    $0x40
 5ec:	c3                   	ret    

000005ed <link>:
SYSCALL(link)
 5ed:	b8 13 00 00 00       	mov    $0x13,%eax
 5f2:	cd 40                	int    $0x40
 5f4:	c3                   	ret    

000005f5 <mkdir>:
SYSCALL(mkdir)
 5f5:	b8 14 00 00 00       	mov    $0x14,%eax
 5fa:	cd 40                	int    $0x40
 5fc:	c3                   	ret    

000005fd <chdir>:
SYSCALL(chdir)
 5fd:	b8 09 00 00 00       	mov    $0x9,%eax
 602:	cd 40                	int    $0x40
 604:	c3                   	ret    

00000605 <dup>:
SYSCALL(dup)
 605:	b8 0a 00 00 00       	mov    $0xa,%eax
 60a:	cd 40                	int    $0x40
 60c:	c3                   	ret    

0000060d <getpid>:
SYSCALL(getpid)
 60d:	b8 0b 00 00 00       	mov    $0xb,%eax
 612:	cd 40                	int    $0x40
 614:	c3                   	ret    

00000615 <getppid>:
SYSCALL(getppid)
 615:	b8 18 00 00 00       	mov    $0x18,%eax
 61a:	cd 40                	int    $0x40
 61c:	c3                   	ret    

0000061d <getsyscallinfo>:
SYSCALL(getsyscallinfo)
 61d:	b8 19 00 00 00       	mov    $0x19,%eax
 622:	cd 40                	int    $0x40
 624:	c3                   	ret    

00000625 <getAllPids>:
SYSCALL(getAllPids)
 625:	b8 16 00 00 00       	mov    $0x16,%eax
 62a:	cd 40                	int    $0x40
 62c:	c3                   	ret    

0000062d <shutdown>:
SYSCALL(shutdown)
 62d:	b8 17 00 00 00       	mov    $0x17,%eax
 632:	cd 40                	int    $0x40
 634:	c3                   	ret    

00000635 <sbrk>:
SYSCALL(sbrk)
 635:	b8 0c 00 00 00       	mov    $0xc,%eax
 63a:	cd 40                	int    $0x40
 63c:	c3                   	ret    

0000063d <sleep>:
SYSCALL(sleep)
 63d:	b8 0d 00 00 00       	mov    $0xd,%eax
 642:	cd 40                	int    $0x40
 644:	c3                   	ret    

00000645 <uptime>:
SYSCALL(uptime)
 645:	b8 0e 00 00 00       	mov    $0xe,%eax
 64a:	cd 40                	int    $0x40
 64c:	c3                   	ret    

0000064d <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 64d:	55                   	push   %ebp
 64e:	89 e5                	mov    %esp,%ebp
 650:	83 ec 18             	sub    $0x18,%esp
 653:	8b 45 0c             	mov    0xc(%ebp),%eax
 656:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 659:	83 ec 04             	sub    $0x4,%esp
 65c:	6a 01                	push   $0x1
 65e:	8d 45 f4             	lea    -0xc(%ebp),%eax
 661:	50                   	push   %eax
 662:	ff 75 08             	pushl  0x8(%ebp)
 665:	e8 43 ff ff ff       	call   5ad <write>
 66a:	83 c4 10             	add    $0x10,%esp
}
 66d:	90                   	nop
 66e:	c9                   	leave  
 66f:	c3                   	ret    

00000670 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 670:	55                   	push   %ebp
 671:	89 e5                	mov    %esp,%ebp
 673:	53                   	push   %ebx
 674:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 677:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 67e:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 682:	74 17                	je     69b <printint+0x2b>
 684:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 688:	79 11                	jns    69b <printint+0x2b>
    neg = 1;
 68a:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 691:	8b 45 0c             	mov    0xc(%ebp),%eax
 694:	f7 d8                	neg    %eax
 696:	89 45 ec             	mov    %eax,-0x14(%ebp)
 699:	eb 06                	jmp    6a1 <printint+0x31>
  } else {
    x = xx;
 69b:	8b 45 0c             	mov    0xc(%ebp),%eax
 69e:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 6a1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 6a8:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 6ab:	8d 41 01             	lea    0x1(%ecx),%eax
 6ae:	89 45 f4             	mov    %eax,-0xc(%ebp)
 6b1:	8b 5d 10             	mov    0x10(%ebp),%ebx
 6b4:	8b 45 ec             	mov    -0x14(%ebp),%eax
 6b7:	ba 00 00 00 00       	mov    $0x0,%edx
 6bc:	f7 f3                	div    %ebx
 6be:	89 d0                	mov    %edx,%eax
 6c0:	0f b6 80 e8 0d 00 00 	movzbl 0xde8(%eax),%eax
 6c7:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 6cb:	8b 5d 10             	mov    0x10(%ebp),%ebx
 6ce:	8b 45 ec             	mov    -0x14(%ebp),%eax
 6d1:	ba 00 00 00 00       	mov    $0x0,%edx
 6d6:	f7 f3                	div    %ebx
 6d8:	89 45 ec             	mov    %eax,-0x14(%ebp)
 6db:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 6df:	75 c7                	jne    6a8 <printint+0x38>
  if(neg)
 6e1:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 6e5:	74 2d                	je     714 <printint+0xa4>
    buf[i++] = '-';
 6e7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6ea:	8d 50 01             	lea    0x1(%eax),%edx
 6ed:	89 55 f4             	mov    %edx,-0xc(%ebp)
 6f0:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 6f5:	eb 1d                	jmp    714 <printint+0xa4>
    putc(fd, buf[i]);
 6f7:	8d 55 dc             	lea    -0x24(%ebp),%edx
 6fa:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6fd:	01 d0                	add    %edx,%eax
 6ff:	0f b6 00             	movzbl (%eax),%eax
 702:	0f be c0             	movsbl %al,%eax
 705:	83 ec 08             	sub    $0x8,%esp
 708:	50                   	push   %eax
 709:	ff 75 08             	pushl  0x8(%ebp)
 70c:	e8 3c ff ff ff       	call   64d <putc>
 711:	83 c4 10             	add    $0x10,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 714:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 718:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 71c:	79 d9                	jns    6f7 <printint+0x87>
    putc(fd, buf[i]);
}
 71e:	90                   	nop
 71f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 722:	c9                   	leave  
 723:	c3                   	ret    

00000724 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 724:	55                   	push   %ebp
 725:	89 e5                	mov    %esp,%ebp
 727:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 72a:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 731:	8d 45 0c             	lea    0xc(%ebp),%eax
 734:	83 c0 04             	add    $0x4,%eax
 737:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 73a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 741:	e9 59 01 00 00       	jmp    89f <printf+0x17b>
    c = fmt[i] & 0xff;
 746:	8b 55 0c             	mov    0xc(%ebp),%edx
 749:	8b 45 f0             	mov    -0x10(%ebp),%eax
 74c:	01 d0                	add    %edx,%eax
 74e:	0f b6 00             	movzbl (%eax),%eax
 751:	0f be c0             	movsbl %al,%eax
 754:	25 ff 00 00 00       	and    $0xff,%eax
 759:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 75c:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 760:	75 2c                	jne    78e <printf+0x6a>
      if(c == '%'){
 762:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 766:	75 0c                	jne    774 <printf+0x50>
        state = '%';
 768:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 76f:	e9 27 01 00 00       	jmp    89b <printf+0x177>
      } else {
        putc(fd, c);
 774:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 777:	0f be c0             	movsbl %al,%eax
 77a:	83 ec 08             	sub    $0x8,%esp
 77d:	50                   	push   %eax
 77e:	ff 75 08             	pushl  0x8(%ebp)
 781:	e8 c7 fe ff ff       	call   64d <putc>
 786:	83 c4 10             	add    $0x10,%esp
 789:	e9 0d 01 00 00       	jmp    89b <printf+0x177>
      }
    } else if(state == '%'){
 78e:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 792:	0f 85 03 01 00 00    	jne    89b <printf+0x177>
      if(c == 'd'){
 798:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 79c:	75 1e                	jne    7bc <printf+0x98>
        printint(fd, *ap, 10, 1);
 79e:	8b 45 e8             	mov    -0x18(%ebp),%eax
 7a1:	8b 00                	mov    (%eax),%eax
 7a3:	6a 01                	push   $0x1
 7a5:	6a 0a                	push   $0xa
 7a7:	50                   	push   %eax
 7a8:	ff 75 08             	pushl  0x8(%ebp)
 7ab:	e8 c0 fe ff ff       	call   670 <printint>
 7b0:	83 c4 10             	add    $0x10,%esp
        ap++;
 7b3:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 7b7:	e9 d8 00 00 00       	jmp    894 <printf+0x170>
      } else if(c == 'x' || c == 'p'){
 7bc:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 7c0:	74 06                	je     7c8 <printf+0xa4>
 7c2:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 7c6:	75 1e                	jne    7e6 <printf+0xc2>
        printint(fd, *ap, 16, 0);
 7c8:	8b 45 e8             	mov    -0x18(%ebp),%eax
 7cb:	8b 00                	mov    (%eax),%eax
 7cd:	6a 00                	push   $0x0
 7cf:	6a 10                	push   $0x10
 7d1:	50                   	push   %eax
 7d2:	ff 75 08             	pushl  0x8(%ebp)
 7d5:	e8 96 fe ff ff       	call   670 <printint>
 7da:	83 c4 10             	add    $0x10,%esp
        ap++;
 7dd:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 7e1:	e9 ae 00 00 00       	jmp    894 <printf+0x170>
      } else if(c == 's'){
 7e6:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 7ea:	75 43                	jne    82f <printf+0x10b>
        s = (char*)*ap;
 7ec:	8b 45 e8             	mov    -0x18(%ebp),%eax
 7ef:	8b 00                	mov    (%eax),%eax
 7f1:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 7f4:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 7f8:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 7fc:	75 25                	jne    823 <printf+0xff>
          s = "(null)";
 7fe:	c7 45 f4 12 0b 00 00 	movl   $0xb12,-0xc(%ebp)
        while(*s != 0){
 805:	eb 1c                	jmp    823 <printf+0xff>
          putc(fd, *s);
 807:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80a:	0f b6 00             	movzbl (%eax),%eax
 80d:	0f be c0             	movsbl %al,%eax
 810:	83 ec 08             	sub    $0x8,%esp
 813:	50                   	push   %eax
 814:	ff 75 08             	pushl  0x8(%ebp)
 817:	e8 31 fe ff ff       	call   64d <putc>
 81c:	83 c4 10             	add    $0x10,%esp
          s++;
 81f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 823:	8b 45 f4             	mov    -0xc(%ebp),%eax
 826:	0f b6 00             	movzbl (%eax),%eax
 829:	84 c0                	test   %al,%al
 82b:	75 da                	jne    807 <printf+0xe3>
 82d:	eb 65                	jmp    894 <printf+0x170>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 82f:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 833:	75 1d                	jne    852 <printf+0x12e>
        putc(fd, *ap);
 835:	8b 45 e8             	mov    -0x18(%ebp),%eax
 838:	8b 00                	mov    (%eax),%eax
 83a:	0f be c0             	movsbl %al,%eax
 83d:	83 ec 08             	sub    $0x8,%esp
 840:	50                   	push   %eax
 841:	ff 75 08             	pushl  0x8(%ebp)
 844:	e8 04 fe ff ff       	call   64d <putc>
 849:	83 c4 10             	add    $0x10,%esp
        ap++;
 84c:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 850:	eb 42                	jmp    894 <printf+0x170>
      } else if(c == '%'){
 852:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 856:	75 17                	jne    86f <printf+0x14b>
        putc(fd, c);
 858:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 85b:	0f be c0             	movsbl %al,%eax
 85e:	83 ec 08             	sub    $0x8,%esp
 861:	50                   	push   %eax
 862:	ff 75 08             	pushl  0x8(%ebp)
 865:	e8 e3 fd ff ff       	call   64d <putc>
 86a:	83 c4 10             	add    $0x10,%esp
 86d:	eb 25                	jmp    894 <printf+0x170>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 86f:	83 ec 08             	sub    $0x8,%esp
 872:	6a 25                	push   $0x25
 874:	ff 75 08             	pushl  0x8(%ebp)
 877:	e8 d1 fd ff ff       	call   64d <putc>
 87c:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
 87f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 882:	0f be c0             	movsbl %al,%eax
 885:	83 ec 08             	sub    $0x8,%esp
 888:	50                   	push   %eax
 889:	ff 75 08             	pushl  0x8(%ebp)
 88c:	e8 bc fd ff ff       	call   64d <putc>
 891:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 894:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 89b:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 89f:	8b 55 0c             	mov    0xc(%ebp),%edx
 8a2:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8a5:	01 d0                	add    %edx,%eax
 8a7:	0f b6 00             	movzbl (%eax),%eax
 8aa:	84 c0                	test   %al,%al
 8ac:	0f 85 94 fe ff ff    	jne    746 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 8b2:	90                   	nop
 8b3:	c9                   	leave  
 8b4:	c3                   	ret    

000008b5 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 8b5:	55                   	push   %ebp
 8b6:	89 e5                	mov    %esp,%ebp
 8b8:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 8bb:	8b 45 08             	mov    0x8(%ebp),%eax
 8be:	83 e8 08             	sub    $0x8,%eax
 8c1:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8c4:	a1 08 0e 00 00       	mov    0xe08,%eax
 8c9:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8cc:	eb 24                	jmp    8f2 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8ce:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8d1:	8b 00                	mov    (%eax),%eax
 8d3:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 8d6:	77 12                	ja     8ea <free+0x35>
 8d8:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8db:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 8de:	77 24                	ja     904 <free+0x4f>
 8e0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8e3:	8b 00                	mov    (%eax),%eax
 8e5:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 8e8:	77 1a                	ja     904 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8ea:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8ed:	8b 00                	mov    (%eax),%eax
 8ef:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8f2:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8f5:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 8f8:	76 d4                	jbe    8ce <free+0x19>
 8fa:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8fd:	8b 00                	mov    (%eax),%eax
 8ff:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 902:	76 ca                	jbe    8ce <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 904:	8b 45 f8             	mov    -0x8(%ebp),%eax
 907:	8b 40 04             	mov    0x4(%eax),%eax
 90a:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 911:	8b 45 f8             	mov    -0x8(%ebp),%eax
 914:	01 c2                	add    %eax,%edx
 916:	8b 45 fc             	mov    -0x4(%ebp),%eax
 919:	8b 00                	mov    (%eax),%eax
 91b:	39 c2                	cmp    %eax,%edx
 91d:	75 24                	jne    943 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 91f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 922:	8b 50 04             	mov    0x4(%eax),%edx
 925:	8b 45 fc             	mov    -0x4(%ebp),%eax
 928:	8b 00                	mov    (%eax),%eax
 92a:	8b 40 04             	mov    0x4(%eax),%eax
 92d:	01 c2                	add    %eax,%edx
 92f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 932:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 935:	8b 45 fc             	mov    -0x4(%ebp),%eax
 938:	8b 00                	mov    (%eax),%eax
 93a:	8b 10                	mov    (%eax),%edx
 93c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 93f:	89 10                	mov    %edx,(%eax)
 941:	eb 0a                	jmp    94d <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 943:	8b 45 fc             	mov    -0x4(%ebp),%eax
 946:	8b 10                	mov    (%eax),%edx
 948:	8b 45 f8             	mov    -0x8(%ebp),%eax
 94b:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 94d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 950:	8b 40 04             	mov    0x4(%eax),%eax
 953:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 95a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 95d:	01 d0                	add    %edx,%eax
 95f:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 962:	75 20                	jne    984 <free+0xcf>
    p->s.size += bp->s.size;
 964:	8b 45 fc             	mov    -0x4(%ebp),%eax
 967:	8b 50 04             	mov    0x4(%eax),%edx
 96a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 96d:	8b 40 04             	mov    0x4(%eax),%eax
 970:	01 c2                	add    %eax,%edx
 972:	8b 45 fc             	mov    -0x4(%ebp),%eax
 975:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 978:	8b 45 f8             	mov    -0x8(%ebp),%eax
 97b:	8b 10                	mov    (%eax),%edx
 97d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 980:	89 10                	mov    %edx,(%eax)
 982:	eb 08                	jmp    98c <free+0xd7>
  } else
    p->s.ptr = bp;
 984:	8b 45 fc             	mov    -0x4(%ebp),%eax
 987:	8b 55 f8             	mov    -0x8(%ebp),%edx
 98a:	89 10                	mov    %edx,(%eax)
  freep = p;
 98c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 98f:	a3 08 0e 00 00       	mov    %eax,0xe08
}
 994:	90                   	nop
 995:	c9                   	leave  
 996:	c3                   	ret    

00000997 <morecore>:

static Header*
morecore(uint nu)
{
 997:	55                   	push   %ebp
 998:	89 e5                	mov    %esp,%ebp
 99a:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 99d:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 9a4:	77 07                	ja     9ad <morecore+0x16>
    nu = 4096;
 9a6:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 9ad:	8b 45 08             	mov    0x8(%ebp),%eax
 9b0:	c1 e0 03             	shl    $0x3,%eax
 9b3:	83 ec 0c             	sub    $0xc,%esp
 9b6:	50                   	push   %eax
 9b7:	e8 79 fc ff ff       	call   635 <sbrk>
 9bc:	83 c4 10             	add    $0x10,%esp
 9bf:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 9c2:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 9c6:	75 07                	jne    9cf <morecore+0x38>
    return 0;
 9c8:	b8 00 00 00 00       	mov    $0x0,%eax
 9cd:	eb 26                	jmp    9f5 <morecore+0x5e>
  hp = (Header*)p;
 9cf:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9d2:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 9d5:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9d8:	8b 55 08             	mov    0x8(%ebp),%edx
 9db:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 9de:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9e1:	83 c0 08             	add    $0x8,%eax
 9e4:	83 ec 0c             	sub    $0xc,%esp
 9e7:	50                   	push   %eax
 9e8:	e8 c8 fe ff ff       	call   8b5 <free>
 9ed:	83 c4 10             	add    $0x10,%esp
  return freep;
 9f0:	a1 08 0e 00 00       	mov    0xe08,%eax
}
 9f5:	c9                   	leave  
 9f6:	c3                   	ret    

000009f7 <malloc>:

void*
malloc(uint nbytes)
{
 9f7:	55                   	push   %ebp
 9f8:	89 e5                	mov    %esp,%ebp
 9fa:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9fd:	8b 45 08             	mov    0x8(%ebp),%eax
 a00:	83 c0 07             	add    $0x7,%eax
 a03:	c1 e8 03             	shr    $0x3,%eax
 a06:	83 c0 01             	add    $0x1,%eax
 a09:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 a0c:	a1 08 0e 00 00       	mov    0xe08,%eax
 a11:	89 45 f0             	mov    %eax,-0x10(%ebp)
 a14:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 a18:	75 23                	jne    a3d <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 a1a:	c7 45 f0 00 0e 00 00 	movl   $0xe00,-0x10(%ebp)
 a21:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a24:	a3 08 0e 00 00       	mov    %eax,0xe08
 a29:	a1 08 0e 00 00       	mov    0xe08,%eax
 a2e:	a3 00 0e 00 00       	mov    %eax,0xe00
    base.s.size = 0;
 a33:	c7 05 04 0e 00 00 00 	movl   $0x0,0xe04
 a3a:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a3d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a40:	8b 00                	mov    (%eax),%eax
 a42:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 a45:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a48:	8b 40 04             	mov    0x4(%eax),%eax
 a4b:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 a4e:	72 4d                	jb     a9d <malloc+0xa6>
      if(p->s.size == nunits)
 a50:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a53:	8b 40 04             	mov    0x4(%eax),%eax
 a56:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 a59:	75 0c                	jne    a67 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 a5b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a5e:	8b 10                	mov    (%eax),%edx
 a60:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a63:	89 10                	mov    %edx,(%eax)
 a65:	eb 26                	jmp    a8d <malloc+0x96>
      else {
        p->s.size -= nunits;
 a67:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a6a:	8b 40 04             	mov    0x4(%eax),%eax
 a6d:	2b 45 ec             	sub    -0x14(%ebp),%eax
 a70:	89 c2                	mov    %eax,%edx
 a72:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a75:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 a78:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a7b:	8b 40 04             	mov    0x4(%eax),%eax
 a7e:	c1 e0 03             	shl    $0x3,%eax
 a81:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 a84:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a87:	8b 55 ec             	mov    -0x14(%ebp),%edx
 a8a:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 a8d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a90:	a3 08 0e 00 00       	mov    %eax,0xe08
      return (void*)(p + 1);
 a95:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a98:	83 c0 08             	add    $0x8,%eax
 a9b:	eb 3b                	jmp    ad8 <malloc+0xe1>
    }
    if(p == freep)
 a9d:	a1 08 0e 00 00       	mov    0xe08,%eax
 aa2:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 aa5:	75 1e                	jne    ac5 <malloc+0xce>
      if((p = morecore(nunits)) == 0)
 aa7:	83 ec 0c             	sub    $0xc,%esp
 aaa:	ff 75 ec             	pushl  -0x14(%ebp)
 aad:	e8 e5 fe ff ff       	call   997 <morecore>
 ab2:	83 c4 10             	add    $0x10,%esp
 ab5:	89 45 f4             	mov    %eax,-0xc(%ebp)
 ab8:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 abc:	75 07                	jne    ac5 <malloc+0xce>
        return 0;
 abe:	b8 00 00 00 00       	mov    $0x0,%eax
 ac3:	eb 13                	jmp    ad8 <malloc+0xe1>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 ac5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ac8:	89 45 f0             	mov    %eax,-0x10(%ebp)
 acb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ace:	8b 00                	mov    (%eax),%eax
 ad0:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 ad3:	e9 6d ff ff ff       	jmp    a45 <malloc+0x4e>
}
 ad8:	c9                   	leave  
 ad9:	c3                   	ret    
