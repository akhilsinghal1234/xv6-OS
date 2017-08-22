
_wc:     file format elf32-i386


Disassembly of section .text:

00000000 <wc>:

char buf[512];

void
wc(int fd, char *name)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 28             	sub    $0x28,%esp
  int i, n;
  int l, w, c, inword;

  l = w = c = 0;
   6:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
   d:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10:	89 45 ec             	mov    %eax,-0x14(%ebp)
  13:	8b 45 ec             	mov    -0x14(%ebp),%eax
  16:	89 45 f0             	mov    %eax,-0x10(%ebp)
  inword = 0;
  19:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  while((n = read(fd, buf, sizeof(buf))) > 0){
  20:	eb 69                	jmp    8b <wc+0x8b>
    for(i=0; i<n; i++){
  22:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  29:	eb 58                	jmp    83 <wc+0x83>
      c++;
  2b:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
      if(buf[i] == '\n')
  2f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  32:	05 40 0c 00 00       	add    $0xc40,%eax
  37:	0f b6 00             	movzbl (%eax),%eax
  3a:	3c 0a                	cmp    $0xa,%al
  3c:	75 04                	jne    42 <wc+0x42>
        l++;
  3e:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
      if(strchr(" \r\t\n\v", buf[i]))
  42:	8b 45 f4             	mov    -0xc(%ebp),%eax
  45:	05 40 0c 00 00       	add    $0xc40,%eax
  4a:	0f b6 00             	movzbl (%eax),%eax
  4d:	0f be c0             	movsbl %al,%eax
  50:	83 ec 08             	sub    $0x8,%esp
  53:	50                   	push   %eax
  54:	68 61 09 00 00       	push   $0x961
  59:	e8 35 02 00 00       	call   293 <strchr>
  5e:	83 c4 10             	add    $0x10,%esp
  61:	85 c0                	test   %eax,%eax
  63:	74 09                	je     6e <wc+0x6e>
        inword = 0;
  65:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  6c:	eb 11                	jmp    7f <wc+0x7f>
      else if(!inword){
  6e:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  72:	75 0b                	jne    7f <wc+0x7f>
        w++;
  74:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
        inword = 1;
  78:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
  int l, w, c, inword;

  l = w = c = 0;
  inword = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
    for(i=0; i<n; i++){
  7f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  83:	8b 45 f4             	mov    -0xc(%ebp),%eax
  86:	3b 45 e0             	cmp    -0x20(%ebp),%eax
  89:	7c a0                	jl     2b <wc+0x2b>
  int i, n;
  int l, w, c, inword;

  l = w = c = 0;
  inword = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
  8b:	83 ec 04             	sub    $0x4,%esp
  8e:	68 00 02 00 00       	push   $0x200
  93:	68 40 0c 00 00       	push   $0xc40
  98:	ff 75 08             	pushl  0x8(%ebp)
  9b:	e8 8c 03 00 00       	call   42c <read>
  a0:	83 c4 10             	add    $0x10,%esp
  a3:	89 45 e0             	mov    %eax,-0x20(%ebp)
  a6:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  aa:	0f 8f 72 ff ff ff    	jg     22 <wc+0x22>
        w++;
        inword = 1;
      }
    }
  }
  if(n < 0){
  b0:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  b4:	79 17                	jns    cd <wc+0xcd>
    printf(1, "wc: read error\n");
  b6:	83 ec 08             	sub    $0x8,%esp
  b9:	68 67 09 00 00       	push   $0x967
  be:	6a 01                	push   $0x1
  c0:	e8 e6 04 00 00       	call   5ab <printf>
  c5:	83 c4 10             	add    $0x10,%esp
    exit();
  c8:	e8 47 03 00 00       	call   414 <exit>
  }
  printf(1, "%d %d %d %s\n", l, w, c, name);
  cd:	83 ec 08             	sub    $0x8,%esp
  d0:	ff 75 0c             	pushl  0xc(%ebp)
  d3:	ff 75 e8             	pushl  -0x18(%ebp)
  d6:	ff 75 ec             	pushl  -0x14(%ebp)
  d9:	ff 75 f0             	pushl  -0x10(%ebp)
  dc:	68 77 09 00 00       	push   $0x977
  e1:	6a 01                	push   $0x1
  e3:	e8 c3 04 00 00       	call   5ab <printf>
  e8:	83 c4 20             	add    $0x20,%esp
}
  eb:	90                   	nop
  ec:	c9                   	leave  
  ed:	c3                   	ret    

000000ee <main>:

int
main(int argc, char *argv[])
{
  ee:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  f2:	83 e4 f0             	and    $0xfffffff0,%esp
  f5:	ff 71 fc             	pushl  -0x4(%ecx)
  f8:	55                   	push   %ebp
  f9:	89 e5                	mov    %esp,%ebp
  fb:	53                   	push   %ebx
  fc:	51                   	push   %ecx
  fd:	83 ec 10             	sub    $0x10,%esp
 100:	89 cb                	mov    %ecx,%ebx
  int fd, i;

  if(argc <= 1){
 102:	83 3b 01             	cmpl   $0x1,(%ebx)
 105:	7f 17                	jg     11e <main+0x30>
    wc(0, "");
 107:	83 ec 08             	sub    $0x8,%esp
 10a:	68 84 09 00 00       	push   $0x984
 10f:	6a 00                	push   $0x0
 111:	e8 ea fe ff ff       	call   0 <wc>
 116:	83 c4 10             	add    $0x10,%esp
    exit();
 119:	e8 f6 02 00 00       	call   414 <exit>
  }

  for(i = 1; i < argc; i++){
 11e:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
 125:	e9 83 00 00 00       	jmp    1ad <main+0xbf>
    if((fd = open(argv[i], 0)) < 0){
 12a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 12d:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 134:	8b 43 04             	mov    0x4(%ebx),%eax
 137:	01 d0                	add    %edx,%eax
 139:	8b 00                	mov    (%eax),%eax
 13b:	83 ec 08             	sub    $0x8,%esp
 13e:	6a 00                	push   $0x0
 140:	50                   	push   %eax
 141:	e8 0e 03 00 00       	call   454 <open>
 146:	83 c4 10             	add    $0x10,%esp
 149:	89 45 f0             	mov    %eax,-0x10(%ebp)
 14c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 150:	79 29                	jns    17b <main+0x8d>
      printf(1, "wc: cannot open %s\n", argv[i]);
 152:	8b 45 f4             	mov    -0xc(%ebp),%eax
 155:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 15c:	8b 43 04             	mov    0x4(%ebx),%eax
 15f:	01 d0                	add    %edx,%eax
 161:	8b 00                	mov    (%eax),%eax
 163:	83 ec 04             	sub    $0x4,%esp
 166:	50                   	push   %eax
 167:	68 85 09 00 00       	push   $0x985
 16c:	6a 01                	push   $0x1
 16e:	e8 38 04 00 00       	call   5ab <printf>
 173:	83 c4 10             	add    $0x10,%esp
      exit();
 176:	e8 99 02 00 00       	call   414 <exit>
    }
    wc(fd, argv[i]);
 17b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 17e:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 185:	8b 43 04             	mov    0x4(%ebx),%eax
 188:	01 d0                	add    %edx,%eax
 18a:	8b 00                	mov    (%eax),%eax
 18c:	83 ec 08             	sub    $0x8,%esp
 18f:	50                   	push   %eax
 190:	ff 75 f0             	pushl  -0x10(%ebp)
 193:	e8 68 fe ff ff       	call   0 <wc>
 198:	83 c4 10             	add    $0x10,%esp
    close(fd);
 19b:	83 ec 0c             	sub    $0xc,%esp
 19e:	ff 75 f0             	pushl  -0x10(%ebp)
 1a1:	e8 96 02 00 00       	call   43c <close>
 1a6:	83 c4 10             	add    $0x10,%esp
  if(argc <= 1){
    wc(0, "");
    exit();
  }

  for(i = 1; i < argc; i++){
 1a9:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
 1ad:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1b0:	3b 03                	cmp    (%ebx),%eax
 1b2:	0f 8c 72 ff ff ff    	jl     12a <main+0x3c>
      exit();
    }
    wc(fd, argv[i]);
    close(fd);
  }
  exit();
 1b8:	e8 57 02 00 00       	call   414 <exit>

000001bd <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 1bd:	55                   	push   %ebp
 1be:	89 e5                	mov    %esp,%ebp
 1c0:	57                   	push   %edi
 1c1:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 1c2:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1c5:	8b 55 10             	mov    0x10(%ebp),%edx
 1c8:	8b 45 0c             	mov    0xc(%ebp),%eax
 1cb:	89 cb                	mov    %ecx,%ebx
 1cd:	89 df                	mov    %ebx,%edi
 1cf:	89 d1                	mov    %edx,%ecx
 1d1:	fc                   	cld    
 1d2:	f3 aa                	rep stos %al,%es:(%edi)
 1d4:	89 ca                	mov    %ecx,%edx
 1d6:	89 fb                	mov    %edi,%ebx
 1d8:	89 5d 08             	mov    %ebx,0x8(%ebp)
 1db:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 1de:	90                   	nop
 1df:	5b                   	pop    %ebx
 1e0:	5f                   	pop    %edi
 1e1:	5d                   	pop    %ebp
 1e2:	c3                   	ret    

000001e3 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 1e3:	55                   	push   %ebp
 1e4:	89 e5                	mov    %esp,%ebp
 1e6:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 1e9:	8b 45 08             	mov    0x8(%ebp),%eax
 1ec:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 1ef:	90                   	nop
 1f0:	8b 45 08             	mov    0x8(%ebp),%eax
 1f3:	8d 50 01             	lea    0x1(%eax),%edx
 1f6:	89 55 08             	mov    %edx,0x8(%ebp)
 1f9:	8b 55 0c             	mov    0xc(%ebp),%edx
 1fc:	8d 4a 01             	lea    0x1(%edx),%ecx
 1ff:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 202:	0f b6 12             	movzbl (%edx),%edx
 205:	88 10                	mov    %dl,(%eax)
 207:	0f b6 00             	movzbl (%eax),%eax
 20a:	84 c0                	test   %al,%al
 20c:	75 e2                	jne    1f0 <strcpy+0xd>
    ;
  return os;
 20e:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 211:	c9                   	leave  
 212:	c3                   	ret    

00000213 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 213:	55                   	push   %ebp
 214:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 216:	eb 08                	jmp    220 <strcmp+0xd>
    p++, q++;
 218:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 21c:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 220:	8b 45 08             	mov    0x8(%ebp),%eax
 223:	0f b6 00             	movzbl (%eax),%eax
 226:	84 c0                	test   %al,%al
 228:	74 10                	je     23a <strcmp+0x27>
 22a:	8b 45 08             	mov    0x8(%ebp),%eax
 22d:	0f b6 10             	movzbl (%eax),%edx
 230:	8b 45 0c             	mov    0xc(%ebp),%eax
 233:	0f b6 00             	movzbl (%eax),%eax
 236:	38 c2                	cmp    %al,%dl
 238:	74 de                	je     218 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 23a:	8b 45 08             	mov    0x8(%ebp),%eax
 23d:	0f b6 00             	movzbl (%eax),%eax
 240:	0f b6 d0             	movzbl %al,%edx
 243:	8b 45 0c             	mov    0xc(%ebp),%eax
 246:	0f b6 00             	movzbl (%eax),%eax
 249:	0f b6 c0             	movzbl %al,%eax
 24c:	29 c2                	sub    %eax,%edx
 24e:	89 d0                	mov    %edx,%eax
}
 250:	5d                   	pop    %ebp
 251:	c3                   	ret    

00000252 <strlen>:

uint
strlen(char *s)
{
 252:	55                   	push   %ebp
 253:	89 e5                	mov    %esp,%ebp
 255:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 258:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 25f:	eb 04                	jmp    265 <strlen+0x13>
 261:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 265:	8b 55 fc             	mov    -0x4(%ebp),%edx
 268:	8b 45 08             	mov    0x8(%ebp),%eax
 26b:	01 d0                	add    %edx,%eax
 26d:	0f b6 00             	movzbl (%eax),%eax
 270:	84 c0                	test   %al,%al
 272:	75 ed                	jne    261 <strlen+0xf>
    ;
  return n;
 274:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 277:	c9                   	leave  
 278:	c3                   	ret    

00000279 <memset>:

void*
memset(void *dst, int c, uint n)
{
 279:	55                   	push   %ebp
 27a:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
 27c:	8b 45 10             	mov    0x10(%ebp),%eax
 27f:	50                   	push   %eax
 280:	ff 75 0c             	pushl  0xc(%ebp)
 283:	ff 75 08             	pushl  0x8(%ebp)
 286:	e8 32 ff ff ff       	call   1bd <stosb>
 28b:	83 c4 0c             	add    $0xc,%esp
  return dst;
 28e:	8b 45 08             	mov    0x8(%ebp),%eax
}
 291:	c9                   	leave  
 292:	c3                   	ret    

00000293 <strchr>:

char*
strchr(const char *s, char c)
{
 293:	55                   	push   %ebp
 294:	89 e5                	mov    %esp,%ebp
 296:	83 ec 04             	sub    $0x4,%esp
 299:	8b 45 0c             	mov    0xc(%ebp),%eax
 29c:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 29f:	eb 14                	jmp    2b5 <strchr+0x22>
    if(*s == c)
 2a1:	8b 45 08             	mov    0x8(%ebp),%eax
 2a4:	0f b6 00             	movzbl (%eax),%eax
 2a7:	3a 45 fc             	cmp    -0x4(%ebp),%al
 2aa:	75 05                	jne    2b1 <strchr+0x1e>
      return (char*)s;
 2ac:	8b 45 08             	mov    0x8(%ebp),%eax
 2af:	eb 13                	jmp    2c4 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 2b1:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 2b5:	8b 45 08             	mov    0x8(%ebp),%eax
 2b8:	0f b6 00             	movzbl (%eax),%eax
 2bb:	84 c0                	test   %al,%al
 2bd:	75 e2                	jne    2a1 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 2bf:	b8 00 00 00 00       	mov    $0x0,%eax
}
 2c4:	c9                   	leave  
 2c5:	c3                   	ret    

000002c6 <gets>:

char*
gets(char *buf, int max)
{
 2c6:	55                   	push   %ebp
 2c7:	89 e5                	mov    %esp,%ebp
 2c9:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2cc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 2d3:	eb 42                	jmp    317 <gets+0x51>
    cc = read(0, &c, 1);
 2d5:	83 ec 04             	sub    $0x4,%esp
 2d8:	6a 01                	push   $0x1
 2da:	8d 45 ef             	lea    -0x11(%ebp),%eax
 2dd:	50                   	push   %eax
 2de:	6a 00                	push   $0x0
 2e0:	e8 47 01 00 00       	call   42c <read>
 2e5:	83 c4 10             	add    $0x10,%esp
 2e8:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 2eb:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 2ef:	7e 33                	jle    324 <gets+0x5e>
      break;
    buf[i++] = c;
 2f1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2f4:	8d 50 01             	lea    0x1(%eax),%edx
 2f7:	89 55 f4             	mov    %edx,-0xc(%ebp)
 2fa:	89 c2                	mov    %eax,%edx
 2fc:	8b 45 08             	mov    0x8(%ebp),%eax
 2ff:	01 c2                	add    %eax,%edx
 301:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 305:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 307:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 30b:	3c 0a                	cmp    $0xa,%al
 30d:	74 16                	je     325 <gets+0x5f>
 30f:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 313:	3c 0d                	cmp    $0xd,%al
 315:	74 0e                	je     325 <gets+0x5f>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 317:	8b 45 f4             	mov    -0xc(%ebp),%eax
 31a:	83 c0 01             	add    $0x1,%eax
 31d:	3b 45 0c             	cmp    0xc(%ebp),%eax
 320:	7c b3                	jl     2d5 <gets+0xf>
 322:	eb 01                	jmp    325 <gets+0x5f>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 324:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 325:	8b 55 f4             	mov    -0xc(%ebp),%edx
 328:	8b 45 08             	mov    0x8(%ebp),%eax
 32b:	01 d0                	add    %edx,%eax
 32d:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 330:	8b 45 08             	mov    0x8(%ebp),%eax
}
 333:	c9                   	leave  
 334:	c3                   	ret    

00000335 <stat>:

int
stat(char *n, struct stat *st)
{
 335:	55                   	push   %ebp
 336:	89 e5                	mov    %esp,%ebp
 338:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 33b:	83 ec 08             	sub    $0x8,%esp
 33e:	6a 00                	push   $0x0
 340:	ff 75 08             	pushl  0x8(%ebp)
 343:	e8 0c 01 00 00       	call   454 <open>
 348:	83 c4 10             	add    $0x10,%esp
 34b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 34e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 352:	79 07                	jns    35b <stat+0x26>
    return -1;
 354:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 359:	eb 25                	jmp    380 <stat+0x4b>
  r = fstat(fd, st);
 35b:	83 ec 08             	sub    $0x8,%esp
 35e:	ff 75 0c             	pushl  0xc(%ebp)
 361:	ff 75 f4             	pushl  -0xc(%ebp)
 364:	e8 03 01 00 00       	call   46c <fstat>
 369:	83 c4 10             	add    $0x10,%esp
 36c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 36f:	83 ec 0c             	sub    $0xc,%esp
 372:	ff 75 f4             	pushl  -0xc(%ebp)
 375:	e8 c2 00 00 00       	call   43c <close>
 37a:	83 c4 10             	add    $0x10,%esp
  return r;
 37d:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 380:	c9                   	leave  
 381:	c3                   	ret    

00000382 <atoi>:

int
atoi(const char *s)
{
 382:	55                   	push   %ebp
 383:	89 e5                	mov    %esp,%ebp
 385:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 388:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 38f:	eb 25                	jmp    3b6 <atoi+0x34>
    n = n*10 + *s++ - '0';
 391:	8b 55 fc             	mov    -0x4(%ebp),%edx
 394:	89 d0                	mov    %edx,%eax
 396:	c1 e0 02             	shl    $0x2,%eax
 399:	01 d0                	add    %edx,%eax
 39b:	01 c0                	add    %eax,%eax
 39d:	89 c1                	mov    %eax,%ecx
 39f:	8b 45 08             	mov    0x8(%ebp),%eax
 3a2:	8d 50 01             	lea    0x1(%eax),%edx
 3a5:	89 55 08             	mov    %edx,0x8(%ebp)
 3a8:	0f b6 00             	movzbl (%eax),%eax
 3ab:	0f be c0             	movsbl %al,%eax
 3ae:	01 c8                	add    %ecx,%eax
 3b0:	83 e8 30             	sub    $0x30,%eax
 3b3:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 3b6:	8b 45 08             	mov    0x8(%ebp),%eax
 3b9:	0f b6 00             	movzbl (%eax),%eax
 3bc:	3c 2f                	cmp    $0x2f,%al
 3be:	7e 0a                	jle    3ca <atoi+0x48>
 3c0:	8b 45 08             	mov    0x8(%ebp),%eax
 3c3:	0f b6 00             	movzbl (%eax),%eax
 3c6:	3c 39                	cmp    $0x39,%al
 3c8:	7e c7                	jle    391 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 3ca:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 3cd:	c9                   	leave  
 3ce:	c3                   	ret    

000003cf <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 3cf:	55                   	push   %ebp
 3d0:	89 e5                	mov    %esp,%ebp
 3d2:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 3d5:	8b 45 08             	mov    0x8(%ebp),%eax
 3d8:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 3db:	8b 45 0c             	mov    0xc(%ebp),%eax
 3de:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 3e1:	eb 17                	jmp    3fa <memmove+0x2b>
    *dst++ = *src++;
 3e3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 3e6:	8d 50 01             	lea    0x1(%eax),%edx
 3e9:	89 55 fc             	mov    %edx,-0x4(%ebp)
 3ec:	8b 55 f8             	mov    -0x8(%ebp),%edx
 3ef:	8d 4a 01             	lea    0x1(%edx),%ecx
 3f2:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 3f5:	0f b6 12             	movzbl (%edx),%edx
 3f8:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 3fa:	8b 45 10             	mov    0x10(%ebp),%eax
 3fd:	8d 50 ff             	lea    -0x1(%eax),%edx
 400:	89 55 10             	mov    %edx,0x10(%ebp)
 403:	85 c0                	test   %eax,%eax
 405:	7f dc                	jg     3e3 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 407:	8b 45 08             	mov    0x8(%ebp),%eax
}
 40a:	c9                   	leave  
 40b:	c3                   	ret    

0000040c <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 40c:	b8 01 00 00 00       	mov    $0x1,%eax
 411:	cd 40                	int    $0x40
 413:	c3                   	ret    

00000414 <exit>:
SYSCALL(exit)
 414:	b8 02 00 00 00       	mov    $0x2,%eax
 419:	cd 40                	int    $0x40
 41b:	c3                   	ret    

0000041c <wait>:
SYSCALL(wait)
 41c:	b8 03 00 00 00       	mov    $0x3,%eax
 421:	cd 40                	int    $0x40
 423:	c3                   	ret    

00000424 <pipe>:
SYSCALL(pipe)
 424:	b8 04 00 00 00       	mov    $0x4,%eax
 429:	cd 40                	int    $0x40
 42b:	c3                   	ret    

0000042c <read>:
SYSCALL(read)
 42c:	b8 05 00 00 00       	mov    $0x5,%eax
 431:	cd 40                	int    $0x40
 433:	c3                   	ret    

00000434 <write>:
SYSCALL(write)
 434:	b8 10 00 00 00       	mov    $0x10,%eax
 439:	cd 40                	int    $0x40
 43b:	c3                   	ret    

0000043c <close>:
SYSCALL(close)
 43c:	b8 15 00 00 00       	mov    $0x15,%eax
 441:	cd 40                	int    $0x40
 443:	c3                   	ret    

00000444 <kill>:
SYSCALL(kill)
 444:	b8 06 00 00 00       	mov    $0x6,%eax
 449:	cd 40                	int    $0x40
 44b:	c3                   	ret    

0000044c <exec>:
SYSCALL(exec)
 44c:	b8 07 00 00 00       	mov    $0x7,%eax
 451:	cd 40                	int    $0x40
 453:	c3                   	ret    

00000454 <open>:
SYSCALL(open)
 454:	b8 0f 00 00 00       	mov    $0xf,%eax
 459:	cd 40                	int    $0x40
 45b:	c3                   	ret    

0000045c <mknod>:
SYSCALL(mknod)
 45c:	b8 11 00 00 00       	mov    $0x11,%eax
 461:	cd 40                	int    $0x40
 463:	c3                   	ret    

00000464 <unlink>:
SYSCALL(unlink)
 464:	b8 12 00 00 00       	mov    $0x12,%eax
 469:	cd 40                	int    $0x40
 46b:	c3                   	ret    

0000046c <fstat>:
SYSCALL(fstat)
 46c:	b8 08 00 00 00       	mov    $0x8,%eax
 471:	cd 40                	int    $0x40
 473:	c3                   	ret    

00000474 <link>:
SYSCALL(link)
 474:	b8 13 00 00 00       	mov    $0x13,%eax
 479:	cd 40                	int    $0x40
 47b:	c3                   	ret    

0000047c <mkdir>:
SYSCALL(mkdir)
 47c:	b8 14 00 00 00       	mov    $0x14,%eax
 481:	cd 40                	int    $0x40
 483:	c3                   	ret    

00000484 <chdir>:
SYSCALL(chdir)
 484:	b8 09 00 00 00       	mov    $0x9,%eax
 489:	cd 40                	int    $0x40
 48b:	c3                   	ret    

0000048c <dup>:
SYSCALL(dup)
 48c:	b8 0a 00 00 00       	mov    $0xa,%eax
 491:	cd 40                	int    $0x40
 493:	c3                   	ret    

00000494 <getpid>:
SYSCALL(getpid)
 494:	b8 0b 00 00 00       	mov    $0xb,%eax
 499:	cd 40                	int    $0x40
 49b:	c3                   	ret    

0000049c <getppid>:
SYSCALL(getppid)
 49c:	b8 18 00 00 00       	mov    $0x18,%eax
 4a1:	cd 40                	int    $0x40
 4a3:	c3                   	ret    

000004a4 <getsyscallinfo>:
SYSCALL(getsyscallinfo)
 4a4:	b8 19 00 00 00       	mov    $0x19,%eax
 4a9:	cd 40                	int    $0x40
 4ab:	c3                   	ret    

000004ac <getAllPids>:
SYSCALL(getAllPids)
 4ac:	b8 16 00 00 00       	mov    $0x16,%eax
 4b1:	cd 40                	int    $0x40
 4b3:	c3                   	ret    

000004b4 <shutdown>:
SYSCALL(shutdown)
 4b4:	b8 17 00 00 00       	mov    $0x17,%eax
 4b9:	cd 40                	int    $0x40
 4bb:	c3                   	ret    

000004bc <sbrk>:
SYSCALL(sbrk)
 4bc:	b8 0c 00 00 00       	mov    $0xc,%eax
 4c1:	cd 40                	int    $0x40
 4c3:	c3                   	ret    

000004c4 <sleep>:
SYSCALL(sleep)
 4c4:	b8 0d 00 00 00       	mov    $0xd,%eax
 4c9:	cd 40                	int    $0x40
 4cb:	c3                   	ret    

000004cc <uptime>:
SYSCALL(uptime)
 4cc:	b8 0e 00 00 00       	mov    $0xe,%eax
 4d1:	cd 40                	int    $0x40
 4d3:	c3                   	ret    

000004d4 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 4d4:	55                   	push   %ebp
 4d5:	89 e5                	mov    %esp,%ebp
 4d7:	83 ec 18             	sub    $0x18,%esp
 4da:	8b 45 0c             	mov    0xc(%ebp),%eax
 4dd:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 4e0:	83 ec 04             	sub    $0x4,%esp
 4e3:	6a 01                	push   $0x1
 4e5:	8d 45 f4             	lea    -0xc(%ebp),%eax
 4e8:	50                   	push   %eax
 4e9:	ff 75 08             	pushl  0x8(%ebp)
 4ec:	e8 43 ff ff ff       	call   434 <write>
 4f1:	83 c4 10             	add    $0x10,%esp
}
 4f4:	90                   	nop
 4f5:	c9                   	leave  
 4f6:	c3                   	ret    

000004f7 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 4f7:	55                   	push   %ebp
 4f8:	89 e5                	mov    %esp,%ebp
 4fa:	53                   	push   %ebx
 4fb:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 4fe:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 505:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 509:	74 17                	je     522 <printint+0x2b>
 50b:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 50f:	79 11                	jns    522 <printint+0x2b>
    neg = 1;
 511:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 518:	8b 45 0c             	mov    0xc(%ebp),%eax
 51b:	f7 d8                	neg    %eax
 51d:	89 45 ec             	mov    %eax,-0x14(%ebp)
 520:	eb 06                	jmp    528 <printint+0x31>
  } else {
    x = xx;
 522:	8b 45 0c             	mov    0xc(%ebp),%eax
 525:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 528:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 52f:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 532:	8d 41 01             	lea    0x1(%ecx),%eax
 535:	89 45 f4             	mov    %eax,-0xc(%ebp)
 538:	8b 5d 10             	mov    0x10(%ebp),%ebx
 53b:	8b 45 ec             	mov    -0x14(%ebp),%eax
 53e:	ba 00 00 00 00       	mov    $0x0,%edx
 543:	f7 f3                	div    %ebx
 545:	89 d0                	mov    %edx,%eax
 547:	0f b6 80 0c 0c 00 00 	movzbl 0xc0c(%eax),%eax
 54e:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 552:	8b 5d 10             	mov    0x10(%ebp),%ebx
 555:	8b 45 ec             	mov    -0x14(%ebp),%eax
 558:	ba 00 00 00 00       	mov    $0x0,%edx
 55d:	f7 f3                	div    %ebx
 55f:	89 45 ec             	mov    %eax,-0x14(%ebp)
 562:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 566:	75 c7                	jne    52f <printint+0x38>
  if(neg)
 568:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 56c:	74 2d                	je     59b <printint+0xa4>
    buf[i++] = '-';
 56e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 571:	8d 50 01             	lea    0x1(%eax),%edx
 574:	89 55 f4             	mov    %edx,-0xc(%ebp)
 577:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 57c:	eb 1d                	jmp    59b <printint+0xa4>
    putc(fd, buf[i]);
 57e:	8d 55 dc             	lea    -0x24(%ebp),%edx
 581:	8b 45 f4             	mov    -0xc(%ebp),%eax
 584:	01 d0                	add    %edx,%eax
 586:	0f b6 00             	movzbl (%eax),%eax
 589:	0f be c0             	movsbl %al,%eax
 58c:	83 ec 08             	sub    $0x8,%esp
 58f:	50                   	push   %eax
 590:	ff 75 08             	pushl  0x8(%ebp)
 593:	e8 3c ff ff ff       	call   4d4 <putc>
 598:	83 c4 10             	add    $0x10,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 59b:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 59f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 5a3:	79 d9                	jns    57e <printint+0x87>
    putc(fd, buf[i]);
}
 5a5:	90                   	nop
 5a6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 5a9:	c9                   	leave  
 5aa:	c3                   	ret    

000005ab <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 5ab:	55                   	push   %ebp
 5ac:	89 e5                	mov    %esp,%ebp
 5ae:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 5b1:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 5b8:	8d 45 0c             	lea    0xc(%ebp),%eax
 5bb:	83 c0 04             	add    $0x4,%eax
 5be:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 5c1:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 5c8:	e9 59 01 00 00       	jmp    726 <printf+0x17b>
    c = fmt[i] & 0xff;
 5cd:	8b 55 0c             	mov    0xc(%ebp),%edx
 5d0:	8b 45 f0             	mov    -0x10(%ebp),%eax
 5d3:	01 d0                	add    %edx,%eax
 5d5:	0f b6 00             	movzbl (%eax),%eax
 5d8:	0f be c0             	movsbl %al,%eax
 5db:	25 ff 00 00 00       	and    $0xff,%eax
 5e0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 5e3:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 5e7:	75 2c                	jne    615 <printf+0x6a>
      if(c == '%'){
 5e9:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 5ed:	75 0c                	jne    5fb <printf+0x50>
        state = '%';
 5ef:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 5f6:	e9 27 01 00 00       	jmp    722 <printf+0x177>
      } else {
        putc(fd, c);
 5fb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5fe:	0f be c0             	movsbl %al,%eax
 601:	83 ec 08             	sub    $0x8,%esp
 604:	50                   	push   %eax
 605:	ff 75 08             	pushl  0x8(%ebp)
 608:	e8 c7 fe ff ff       	call   4d4 <putc>
 60d:	83 c4 10             	add    $0x10,%esp
 610:	e9 0d 01 00 00       	jmp    722 <printf+0x177>
      }
    } else if(state == '%'){
 615:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 619:	0f 85 03 01 00 00    	jne    722 <printf+0x177>
      if(c == 'd'){
 61f:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 623:	75 1e                	jne    643 <printf+0x98>
        printint(fd, *ap, 10, 1);
 625:	8b 45 e8             	mov    -0x18(%ebp),%eax
 628:	8b 00                	mov    (%eax),%eax
 62a:	6a 01                	push   $0x1
 62c:	6a 0a                	push   $0xa
 62e:	50                   	push   %eax
 62f:	ff 75 08             	pushl  0x8(%ebp)
 632:	e8 c0 fe ff ff       	call   4f7 <printint>
 637:	83 c4 10             	add    $0x10,%esp
        ap++;
 63a:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 63e:	e9 d8 00 00 00       	jmp    71b <printf+0x170>
      } else if(c == 'x' || c == 'p'){
 643:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 647:	74 06                	je     64f <printf+0xa4>
 649:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 64d:	75 1e                	jne    66d <printf+0xc2>
        printint(fd, *ap, 16, 0);
 64f:	8b 45 e8             	mov    -0x18(%ebp),%eax
 652:	8b 00                	mov    (%eax),%eax
 654:	6a 00                	push   $0x0
 656:	6a 10                	push   $0x10
 658:	50                   	push   %eax
 659:	ff 75 08             	pushl  0x8(%ebp)
 65c:	e8 96 fe ff ff       	call   4f7 <printint>
 661:	83 c4 10             	add    $0x10,%esp
        ap++;
 664:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 668:	e9 ae 00 00 00       	jmp    71b <printf+0x170>
      } else if(c == 's'){
 66d:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 671:	75 43                	jne    6b6 <printf+0x10b>
        s = (char*)*ap;
 673:	8b 45 e8             	mov    -0x18(%ebp),%eax
 676:	8b 00                	mov    (%eax),%eax
 678:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 67b:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 67f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 683:	75 25                	jne    6aa <printf+0xff>
          s = "(null)";
 685:	c7 45 f4 99 09 00 00 	movl   $0x999,-0xc(%ebp)
        while(*s != 0){
 68c:	eb 1c                	jmp    6aa <printf+0xff>
          putc(fd, *s);
 68e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 691:	0f b6 00             	movzbl (%eax),%eax
 694:	0f be c0             	movsbl %al,%eax
 697:	83 ec 08             	sub    $0x8,%esp
 69a:	50                   	push   %eax
 69b:	ff 75 08             	pushl  0x8(%ebp)
 69e:	e8 31 fe ff ff       	call   4d4 <putc>
 6a3:	83 c4 10             	add    $0x10,%esp
          s++;
 6a6:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 6aa:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6ad:	0f b6 00             	movzbl (%eax),%eax
 6b0:	84 c0                	test   %al,%al
 6b2:	75 da                	jne    68e <printf+0xe3>
 6b4:	eb 65                	jmp    71b <printf+0x170>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 6b6:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 6ba:	75 1d                	jne    6d9 <printf+0x12e>
        putc(fd, *ap);
 6bc:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6bf:	8b 00                	mov    (%eax),%eax
 6c1:	0f be c0             	movsbl %al,%eax
 6c4:	83 ec 08             	sub    $0x8,%esp
 6c7:	50                   	push   %eax
 6c8:	ff 75 08             	pushl  0x8(%ebp)
 6cb:	e8 04 fe ff ff       	call   4d4 <putc>
 6d0:	83 c4 10             	add    $0x10,%esp
        ap++;
 6d3:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 6d7:	eb 42                	jmp    71b <printf+0x170>
      } else if(c == '%'){
 6d9:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 6dd:	75 17                	jne    6f6 <printf+0x14b>
        putc(fd, c);
 6df:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6e2:	0f be c0             	movsbl %al,%eax
 6e5:	83 ec 08             	sub    $0x8,%esp
 6e8:	50                   	push   %eax
 6e9:	ff 75 08             	pushl  0x8(%ebp)
 6ec:	e8 e3 fd ff ff       	call   4d4 <putc>
 6f1:	83 c4 10             	add    $0x10,%esp
 6f4:	eb 25                	jmp    71b <printf+0x170>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 6f6:	83 ec 08             	sub    $0x8,%esp
 6f9:	6a 25                	push   $0x25
 6fb:	ff 75 08             	pushl  0x8(%ebp)
 6fe:	e8 d1 fd ff ff       	call   4d4 <putc>
 703:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
 706:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 709:	0f be c0             	movsbl %al,%eax
 70c:	83 ec 08             	sub    $0x8,%esp
 70f:	50                   	push   %eax
 710:	ff 75 08             	pushl  0x8(%ebp)
 713:	e8 bc fd ff ff       	call   4d4 <putc>
 718:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 71b:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 722:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 726:	8b 55 0c             	mov    0xc(%ebp),%edx
 729:	8b 45 f0             	mov    -0x10(%ebp),%eax
 72c:	01 d0                	add    %edx,%eax
 72e:	0f b6 00             	movzbl (%eax),%eax
 731:	84 c0                	test   %al,%al
 733:	0f 85 94 fe ff ff    	jne    5cd <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 739:	90                   	nop
 73a:	c9                   	leave  
 73b:	c3                   	ret    

0000073c <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 73c:	55                   	push   %ebp
 73d:	89 e5                	mov    %esp,%ebp
 73f:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 742:	8b 45 08             	mov    0x8(%ebp),%eax
 745:	83 e8 08             	sub    $0x8,%eax
 748:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 74b:	a1 28 0c 00 00       	mov    0xc28,%eax
 750:	89 45 fc             	mov    %eax,-0x4(%ebp)
 753:	eb 24                	jmp    779 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 755:	8b 45 fc             	mov    -0x4(%ebp),%eax
 758:	8b 00                	mov    (%eax),%eax
 75a:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 75d:	77 12                	ja     771 <free+0x35>
 75f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 762:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 765:	77 24                	ja     78b <free+0x4f>
 767:	8b 45 fc             	mov    -0x4(%ebp),%eax
 76a:	8b 00                	mov    (%eax),%eax
 76c:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 76f:	77 1a                	ja     78b <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 771:	8b 45 fc             	mov    -0x4(%ebp),%eax
 774:	8b 00                	mov    (%eax),%eax
 776:	89 45 fc             	mov    %eax,-0x4(%ebp)
 779:	8b 45 f8             	mov    -0x8(%ebp),%eax
 77c:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 77f:	76 d4                	jbe    755 <free+0x19>
 781:	8b 45 fc             	mov    -0x4(%ebp),%eax
 784:	8b 00                	mov    (%eax),%eax
 786:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 789:	76 ca                	jbe    755 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 78b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 78e:	8b 40 04             	mov    0x4(%eax),%eax
 791:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 798:	8b 45 f8             	mov    -0x8(%ebp),%eax
 79b:	01 c2                	add    %eax,%edx
 79d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7a0:	8b 00                	mov    (%eax),%eax
 7a2:	39 c2                	cmp    %eax,%edx
 7a4:	75 24                	jne    7ca <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 7a6:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7a9:	8b 50 04             	mov    0x4(%eax),%edx
 7ac:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7af:	8b 00                	mov    (%eax),%eax
 7b1:	8b 40 04             	mov    0x4(%eax),%eax
 7b4:	01 c2                	add    %eax,%edx
 7b6:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7b9:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 7bc:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7bf:	8b 00                	mov    (%eax),%eax
 7c1:	8b 10                	mov    (%eax),%edx
 7c3:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7c6:	89 10                	mov    %edx,(%eax)
 7c8:	eb 0a                	jmp    7d4 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 7ca:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7cd:	8b 10                	mov    (%eax),%edx
 7cf:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7d2:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 7d4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7d7:	8b 40 04             	mov    0x4(%eax),%eax
 7da:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 7e1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7e4:	01 d0                	add    %edx,%eax
 7e6:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7e9:	75 20                	jne    80b <free+0xcf>
    p->s.size += bp->s.size;
 7eb:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7ee:	8b 50 04             	mov    0x4(%eax),%edx
 7f1:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7f4:	8b 40 04             	mov    0x4(%eax),%eax
 7f7:	01 c2                	add    %eax,%edx
 7f9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7fc:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7ff:	8b 45 f8             	mov    -0x8(%ebp),%eax
 802:	8b 10                	mov    (%eax),%edx
 804:	8b 45 fc             	mov    -0x4(%ebp),%eax
 807:	89 10                	mov    %edx,(%eax)
 809:	eb 08                	jmp    813 <free+0xd7>
  } else
    p->s.ptr = bp;
 80b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 80e:	8b 55 f8             	mov    -0x8(%ebp),%edx
 811:	89 10                	mov    %edx,(%eax)
  freep = p;
 813:	8b 45 fc             	mov    -0x4(%ebp),%eax
 816:	a3 28 0c 00 00       	mov    %eax,0xc28
}
 81b:	90                   	nop
 81c:	c9                   	leave  
 81d:	c3                   	ret    

0000081e <morecore>:

static Header*
morecore(uint nu)
{
 81e:	55                   	push   %ebp
 81f:	89 e5                	mov    %esp,%ebp
 821:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 824:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 82b:	77 07                	ja     834 <morecore+0x16>
    nu = 4096;
 82d:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 834:	8b 45 08             	mov    0x8(%ebp),%eax
 837:	c1 e0 03             	shl    $0x3,%eax
 83a:	83 ec 0c             	sub    $0xc,%esp
 83d:	50                   	push   %eax
 83e:	e8 79 fc ff ff       	call   4bc <sbrk>
 843:	83 c4 10             	add    $0x10,%esp
 846:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 849:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 84d:	75 07                	jne    856 <morecore+0x38>
    return 0;
 84f:	b8 00 00 00 00       	mov    $0x0,%eax
 854:	eb 26                	jmp    87c <morecore+0x5e>
  hp = (Header*)p;
 856:	8b 45 f4             	mov    -0xc(%ebp),%eax
 859:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 85c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 85f:	8b 55 08             	mov    0x8(%ebp),%edx
 862:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 865:	8b 45 f0             	mov    -0x10(%ebp),%eax
 868:	83 c0 08             	add    $0x8,%eax
 86b:	83 ec 0c             	sub    $0xc,%esp
 86e:	50                   	push   %eax
 86f:	e8 c8 fe ff ff       	call   73c <free>
 874:	83 c4 10             	add    $0x10,%esp
  return freep;
 877:	a1 28 0c 00 00       	mov    0xc28,%eax
}
 87c:	c9                   	leave  
 87d:	c3                   	ret    

0000087e <malloc>:

void*
malloc(uint nbytes)
{
 87e:	55                   	push   %ebp
 87f:	89 e5                	mov    %esp,%ebp
 881:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 884:	8b 45 08             	mov    0x8(%ebp),%eax
 887:	83 c0 07             	add    $0x7,%eax
 88a:	c1 e8 03             	shr    $0x3,%eax
 88d:	83 c0 01             	add    $0x1,%eax
 890:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 893:	a1 28 0c 00 00       	mov    0xc28,%eax
 898:	89 45 f0             	mov    %eax,-0x10(%ebp)
 89b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 89f:	75 23                	jne    8c4 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 8a1:	c7 45 f0 20 0c 00 00 	movl   $0xc20,-0x10(%ebp)
 8a8:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8ab:	a3 28 0c 00 00       	mov    %eax,0xc28
 8b0:	a1 28 0c 00 00       	mov    0xc28,%eax
 8b5:	a3 20 0c 00 00       	mov    %eax,0xc20
    base.s.size = 0;
 8ba:	c7 05 24 0c 00 00 00 	movl   $0x0,0xc24
 8c1:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8c4:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8c7:	8b 00                	mov    (%eax),%eax
 8c9:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 8cc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8cf:	8b 40 04             	mov    0x4(%eax),%eax
 8d2:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 8d5:	72 4d                	jb     924 <malloc+0xa6>
      if(p->s.size == nunits)
 8d7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8da:	8b 40 04             	mov    0x4(%eax),%eax
 8dd:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 8e0:	75 0c                	jne    8ee <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 8e2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8e5:	8b 10                	mov    (%eax),%edx
 8e7:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8ea:	89 10                	mov    %edx,(%eax)
 8ec:	eb 26                	jmp    914 <malloc+0x96>
      else {
        p->s.size -= nunits;
 8ee:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8f1:	8b 40 04             	mov    0x4(%eax),%eax
 8f4:	2b 45 ec             	sub    -0x14(%ebp),%eax
 8f7:	89 c2                	mov    %eax,%edx
 8f9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8fc:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 8ff:	8b 45 f4             	mov    -0xc(%ebp),%eax
 902:	8b 40 04             	mov    0x4(%eax),%eax
 905:	c1 e0 03             	shl    $0x3,%eax
 908:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 90b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 90e:	8b 55 ec             	mov    -0x14(%ebp),%edx
 911:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 914:	8b 45 f0             	mov    -0x10(%ebp),%eax
 917:	a3 28 0c 00 00       	mov    %eax,0xc28
      return (void*)(p + 1);
 91c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 91f:	83 c0 08             	add    $0x8,%eax
 922:	eb 3b                	jmp    95f <malloc+0xe1>
    }
    if(p == freep)
 924:	a1 28 0c 00 00       	mov    0xc28,%eax
 929:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 92c:	75 1e                	jne    94c <malloc+0xce>
      if((p = morecore(nunits)) == 0)
 92e:	83 ec 0c             	sub    $0xc,%esp
 931:	ff 75 ec             	pushl  -0x14(%ebp)
 934:	e8 e5 fe ff ff       	call   81e <morecore>
 939:	83 c4 10             	add    $0x10,%esp
 93c:	89 45 f4             	mov    %eax,-0xc(%ebp)
 93f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 943:	75 07                	jne    94c <malloc+0xce>
        return 0;
 945:	b8 00 00 00 00       	mov    $0x0,%eax
 94a:	eb 13                	jmp    95f <malloc+0xe1>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 94c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 94f:	89 45 f0             	mov    %eax,-0x10(%ebp)
 952:	8b 45 f4             	mov    -0xc(%ebp),%eax
 955:	8b 00                	mov    (%eax),%eax
 957:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 95a:	e9 6d ff ff ff       	jmp    8cc <malloc+0x4e>
}
 95f:	c9                   	leave  
 960:	c3                   	ret    
