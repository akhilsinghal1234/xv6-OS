
_cat:     file format elf32-i386


Disassembly of section .text:

00000000 <cat>:

char buf[512];

void
cat(int fd)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 18             	sub    $0x18,%esp
  int n;

  while((n = read(fd, buf, sizeof(buf))) > 0)
   6:	eb 15                	jmp    1d <cat+0x1d>
    write(1, buf, n);
   8:	83 ec 04             	sub    $0x4,%esp
   b:	ff 75 f4             	pushl  -0xc(%ebp)
   e:	68 80 0b 00 00       	push   $0xb80
  13:	6a 01                	push   $0x1
  15:	e8 6c 03 00 00       	call   386 <write>
  1a:	83 c4 10             	add    $0x10,%esp
void
cat(int fd)
{
  int n;

  while((n = read(fd, buf, sizeof(buf))) > 0)
  1d:	83 ec 04             	sub    $0x4,%esp
  20:	68 00 02 00 00       	push   $0x200
  25:	68 80 0b 00 00       	push   $0xb80
  2a:	ff 75 08             	pushl  0x8(%ebp)
  2d:	e8 4c 03 00 00       	call   37e <read>
  32:	83 c4 10             	add    $0x10,%esp
  35:	89 45 f4             	mov    %eax,-0xc(%ebp)
  38:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  3c:	7f ca                	jg     8 <cat+0x8>
    write(1, buf, n);
  if(n < 0){
  3e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  42:	79 17                	jns    5b <cat+0x5b>
    printf(1, "cat: read error\n");
  44:	83 ec 08             	sub    $0x8,%esp
  47:	68 b3 08 00 00       	push   $0x8b3
  4c:	6a 01                	push   $0x1
  4e:	e8 aa 04 00 00       	call   4fd <printf>
  53:	83 c4 10             	add    $0x10,%esp
    exit();
  56:	e8 0b 03 00 00       	call   366 <exit>
  }
}
  5b:	90                   	nop
  5c:	c9                   	leave  
  5d:	c3                   	ret    

0000005e <main>:

int
main(int argc, char *argv[])
{
  5e:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  62:	83 e4 f0             	and    $0xfffffff0,%esp
  65:	ff 71 fc             	pushl  -0x4(%ecx)
  68:	55                   	push   %ebp
  69:	89 e5                	mov    %esp,%ebp
  6b:	53                   	push   %ebx
  6c:	51                   	push   %ecx
  6d:	83 ec 10             	sub    $0x10,%esp
  70:	89 cb                	mov    %ecx,%ebx
  int fd, i;

  if(argc <= 1){
  72:	83 3b 01             	cmpl   $0x1,(%ebx)
  75:	7f 12                	jg     89 <main+0x2b>
    cat(0);
  77:	83 ec 0c             	sub    $0xc,%esp
  7a:	6a 00                	push   $0x0
  7c:	e8 7f ff ff ff       	call   0 <cat>
  81:	83 c4 10             	add    $0x10,%esp
    exit();
  84:	e8 dd 02 00 00       	call   366 <exit>
  }

  for(i = 1; i < argc; i++){
  89:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
  90:	eb 71                	jmp    103 <main+0xa5>
    if((fd = open(argv[i], 0)) < 0){
  92:	8b 45 f4             	mov    -0xc(%ebp),%eax
  95:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  9c:	8b 43 04             	mov    0x4(%ebx),%eax
  9f:	01 d0                	add    %edx,%eax
  a1:	8b 00                	mov    (%eax),%eax
  a3:	83 ec 08             	sub    $0x8,%esp
  a6:	6a 00                	push   $0x0
  a8:	50                   	push   %eax
  a9:	e8 f8 02 00 00       	call   3a6 <open>
  ae:	83 c4 10             	add    $0x10,%esp
  b1:	89 45 f0             	mov    %eax,-0x10(%ebp)
  b4:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  b8:	79 29                	jns    e3 <main+0x85>
      printf(1, "cat: cannot open %s\n", argv[i]);
  ba:	8b 45 f4             	mov    -0xc(%ebp),%eax
  bd:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  c4:	8b 43 04             	mov    0x4(%ebx),%eax
  c7:	01 d0                	add    %edx,%eax
  c9:	8b 00                	mov    (%eax),%eax
  cb:	83 ec 04             	sub    $0x4,%esp
  ce:	50                   	push   %eax
  cf:	68 c4 08 00 00       	push   $0x8c4
  d4:	6a 01                	push   $0x1
  d6:	e8 22 04 00 00       	call   4fd <printf>
  db:	83 c4 10             	add    $0x10,%esp
      exit();
  de:	e8 83 02 00 00       	call   366 <exit>
    }
    cat(fd);
  e3:	83 ec 0c             	sub    $0xc,%esp
  e6:	ff 75 f0             	pushl  -0x10(%ebp)
  e9:	e8 12 ff ff ff       	call   0 <cat>
  ee:	83 c4 10             	add    $0x10,%esp
    close(fd);
  f1:	83 ec 0c             	sub    $0xc,%esp
  f4:	ff 75 f0             	pushl  -0x10(%ebp)
  f7:	e8 92 02 00 00       	call   38e <close>
  fc:	83 c4 10             	add    $0x10,%esp
  if(argc <= 1){
    cat(0);
    exit();
  }

  for(i = 1; i < argc; i++){
  ff:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
 103:	8b 45 f4             	mov    -0xc(%ebp),%eax
 106:	3b 03                	cmp    (%ebx),%eax
 108:	7c 88                	jl     92 <main+0x34>
      exit();
    }
    cat(fd);
    close(fd);
  }
  exit();
 10a:	e8 57 02 00 00       	call   366 <exit>

0000010f <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 10f:	55                   	push   %ebp
 110:	89 e5                	mov    %esp,%ebp
 112:	57                   	push   %edi
 113:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 114:	8b 4d 08             	mov    0x8(%ebp),%ecx
 117:	8b 55 10             	mov    0x10(%ebp),%edx
 11a:	8b 45 0c             	mov    0xc(%ebp),%eax
 11d:	89 cb                	mov    %ecx,%ebx
 11f:	89 df                	mov    %ebx,%edi
 121:	89 d1                	mov    %edx,%ecx
 123:	fc                   	cld    
 124:	f3 aa                	rep stos %al,%es:(%edi)
 126:	89 ca                	mov    %ecx,%edx
 128:	89 fb                	mov    %edi,%ebx
 12a:	89 5d 08             	mov    %ebx,0x8(%ebp)
 12d:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 130:	90                   	nop
 131:	5b                   	pop    %ebx
 132:	5f                   	pop    %edi
 133:	5d                   	pop    %ebp
 134:	c3                   	ret    

00000135 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 135:	55                   	push   %ebp
 136:	89 e5                	mov    %esp,%ebp
 138:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 13b:	8b 45 08             	mov    0x8(%ebp),%eax
 13e:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 141:	90                   	nop
 142:	8b 45 08             	mov    0x8(%ebp),%eax
 145:	8d 50 01             	lea    0x1(%eax),%edx
 148:	89 55 08             	mov    %edx,0x8(%ebp)
 14b:	8b 55 0c             	mov    0xc(%ebp),%edx
 14e:	8d 4a 01             	lea    0x1(%edx),%ecx
 151:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 154:	0f b6 12             	movzbl (%edx),%edx
 157:	88 10                	mov    %dl,(%eax)
 159:	0f b6 00             	movzbl (%eax),%eax
 15c:	84 c0                	test   %al,%al
 15e:	75 e2                	jne    142 <strcpy+0xd>
    ;
  return os;
 160:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 163:	c9                   	leave  
 164:	c3                   	ret    

00000165 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 165:	55                   	push   %ebp
 166:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 168:	eb 08                	jmp    172 <strcmp+0xd>
    p++, q++;
 16a:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 16e:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 172:	8b 45 08             	mov    0x8(%ebp),%eax
 175:	0f b6 00             	movzbl (%eax),%eax
 178:	84 c0                	test   %al,%al
 17a:	74 10                	je     18c <strcmp+0x27>
 17c:	8b 45 08             	mov    0x8(%ebp),%eax
 17f:	0f b6 10             	movzbl (%eax),%edx
 182:	8b 45 0c             	mov    0xc(%ebp),%eax
 185:	0f b6 00             	movzbl (%eax),%eax
 188:	38 c2                	cmp    %al,%dl
 18a:	74 de                	je     16a <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 18c:	8b 45 08             	mov    0x8(%ebp),%eax
 18f:	0f b6 00             	movzbl (%eax),%eax
 192:	0f b6 d0             	movzbl %al,%edx
 195:	8b 45 0c             	mov    0xc(%ebp),%eax
 198:	0f b6 00             	movzbl (%eax),%eax
 19b:	0f b6 c0             	movzbl %al,%eax
 19e:	29 c2                	sub    %eax,%edx
 1a0:	89 d0                	mov    %edx,%eax
}
 1a2:	5d                   	pop    %ebp
 1a3:	c3                   	ret    

000001a4 <strlen>:

uint
strlen(char *s)
{
 1a4:	55                   	push   %ebp
 1a5:	89 e5                	mov    %esp,%ebp
 1a7:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 1aa:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 1b1:	eb 04                	jmp    1b7 <strlen+0x13>
 1b3:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 1b7:	8b 55 fc             	mov    -0x4(%ebp),%edx
 1ba:	8b 45 08             	mov    0x8(%ebp),%eax
 1bd:	01 d0                	add    %edx,%eax
 1bf:	0f b6 00             	movzbl (%eax),%eax
 1c2:	84 c0                	test   %al,%al
 1c4:	75 ed                	jne    1b3 <strlen+0xf>
    ;
  return n;
 1c6:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 1c9:	c9                   	leave  
 1ca:	c3                   	ret    

000001cb <memset>:

void*
memset(void *dst, int c, uint n)
{
 1cb:	55                   	push   %ebp
 1cc:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
 1ce:	8b 45 10             	mov    0x10(%ebp),%eax
 1d1:	50                   	push   %eax
 1d2:	ff 75 0c             	pushl  0xc(%ebp)
 1d5:	ff 75 08             	pushl  0x8(%ebp)
 1d8:	e8 32 ff ff ff       	call   10f <stosb>
 1dd:	83 c4 0c             	add    $0xc,%esp
  return dst;
 1e0:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1e3:	c9                   	leave  
 1e4:	c3                   	ret    

000001e5 <strchr>:

char*
strchr(const char *s, char c)
{
 1e5:	55                   	push   %ebp
 1e6:	89 e5                	mov    %esp,%ebp
 1e8:	83 ec 04             	sub    $0x4,%esp
 1eb:	8b 45 0c             	mov    0xc(%ebp),%eax
 1ee:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 1f1:	eb 14                	jmp    207 <strchr+0x22>
    if(*s == c)
 1f3:	8b 45 08             	mov    0x8(%ebp),%eax
 1f6:	0f b6 00             	movzbl (%eax),%eax
 1f9:	3a 45 fc             	cmp    -0x4(%ebp),%al
 1fc:	75 05                	jne    203 <strchr+0x1e>
      return (char*)s;
 1fe:	8b 45 08             	mov    0x8(%ebp),%eax
 201:	eb 13                	jmp    216 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 203:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 207:	8b 45 08             	mov    0x8(%ebp),%eax
 20a:	0f b6 00             	movzbl (%eax),%eax
 20d:	84 c0                	test   %al,%al
 20f:	75 e2                	jne    1f3 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 211:	b8 00 00 00 00       	mov    $0x0,%eax
}
 216:	c9                   	leave  
 217:	c3                   	ret    

00000218 <gets>:

char*
gets(char *buf, int max)
{
 218:	55                   	push   %ebp
 219:	89 e5                	mov    %esp,%ebp
 21b:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 21e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 225:	eb 42                	jmp    269 <gets+0x51>
    cc = read(0, &c, 1);
 227:	83 ec 04             	sub    $0x4,%esp
 22a:	6a 01                	push   $0x1
 22c:	8d 45 ef             	lea    -0x11(%ebp),%eax
 22f:	50                   	push   %eax
 230:	6a 00                	push   $0x0
 232:	e8 47 01 00 00       	call   37e <read>
 237:	83 c4 10             	add    $0x10,%esp
 23a:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 23d:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 241:	7e 33                	jle    276 <gets+0x5e>
      break;
    buf[i++] = c;
 243:	8b 45 f4             	mov    -0xc(%ebp),%eax
 246:	8d 50 01             	lea    0x1(%eax),%edx
 249:	89 55 f4             	mov    %edx,-0xc(%ebp)
 24c:	89 c2                	mov    %eax,%edx
 24e:	8b 45 08             	mov    0x8(%ebp),%eax
 251:	01 c2                	add    %eax,%edx
 253:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 257:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 259:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 25d:	3c 0a                	cmp    $0xa,%al
 25f:	74 16                	je     277 <gets+0x5f>
 261:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 265:	3c 0d                	cmp    $0xd,%al
 267:	74 0e                	je     277 <gets+0x5f>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 269:	8b 45 f4             	mov    -0xc(%ebp),%eax
 26c:	83 c0 01             	add    $0x1,%eax
 26f:	3b 45 0c             	cmp    0xc(%ebp),%eax
 272:	7c b3                	jl     227 <gets+0xf>
 274:	eb 01                	jmp    277 <gets+0x5f>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 276:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 277:	8b 55 f4             	mov    -0xc(%ebp),%edx
 27a:	8b 45 08             	mov    0x8(%ebp),%eax
 27d:	01 d0                	add    %edx,%eax
 27f:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 282:	8b 45 08             	mov    0x8(%ebp),%eax
}
 285:	c9                   	leave  
 286:	c3                   	ret    

00000287 <stat>:

int
stat(char *n, struct stat *st)
{
 287:	55                   	push   %ebp
 288:	89 e5                	mov    %esp,%ebp
 28a:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 28d:	83 ec 08             	sub    $0x8,%esp
 290:	6a 00                	push   $0x0
 292:	ff 75 08             	pushl  0x8(%ebp)
 295:	e8 0c 01 00 00       	call   3a6 <open>
 29a:	83 c4 10             	add    $0x10,%esp
 29d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 2a0:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 2a4:	79 07                	jns    2ad <stat+0x26>
    return -1;
 2a6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2ab:	eb 25                	jmp    2d2 <stat+0x4b>
  r = fstat(fd, st);
 2ad:	83 ec 08             	sub    $0x8,%esp
 2b0:	ff 75 0c             	pushl  0xc(%ebp)
 2b3:	ff 75 f4             	pushl  -0xc(%ebp)
 2b6:	e8 03 01 00 00       	call   3be <fstat>
 2bb:	83 c4 10             	add    $0x10,%esp
 2be:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 2c1:	83 ec 0c             	sub    $0xc,%esp
 2c4:	ff 75 f4             	pushl  -0xc(%ebp)
 2c7:	e8 c2 00 00 00       	call   38e <close>
 2cc:	83 c4 10             	add    $0x10,%esp
  return r;
 2cf:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 2d2:	c9                   	leave  
 2d3:	c3                   	ret    

000002d4 <atoi>:

int
atoi(const char *s)
{
 2d4:	55                   	push   %ebp
 2d5:	89 e5                	mov    %esp,%ebp
 2d7:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 2da:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 2e1:	eb 25                	jmp    308 <atoi+0x34>
    n = n*10 + *s++ - '0';
 2e3:	8b 55 fc             	mov    -0x4(%ebp),%edx
 2e6:	89 d0                	mov    %edx,%eax
 2e8:	c1 e0 02             	shl    $0x2,%eax
 2eb:	01 d0                	add    %edx,%eax
 2ed:	01 c0                	add    %eax,%eax
 2ef:	89 c1                	mov    %eax,%ecx
 2f1:	8b 45 08             	mov    0x8(%ebp),%eax
 2f4:	8d 50 01             	lea    0x1(%eax),%edx
 2f7:	89 55 08             	mov    %edx,0x8(%ebp)
 2fa:	0f b6 00             	movzbl (%eax),%eax
 2fd:	0f be c0             	movsbl %al,%eax
 300:	01 c8                	add    %ecx,%eax
 302:	83 e8 30             	sub    $0x30,%eax
 305:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 308:	8b 45 08             	mov    0x8(%ebp),%eax
 30b:	0f b6 00             	movzbl (%eax),%eax
 30e:	3c 2f                	cmp    $0x2f,%al
 310:	7e 0a                	jle    31c <atoi+0x48>
 312:	8b 45 08             	mov    0x8(%ebp),%eax
 315:	0f b6 00             	movzbl (%eax),%eax
 318:	3c 39                	cmp    $0x39,%al
 31a:	7e c7                	jle    2e3 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 31c:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 31f:	c9                   	leave  
 320:	c3                   	ret    

00000321 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 321:	55                   	push   %ebp
 322:	89 e5                	mov    %esp,%ebp
 324:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 327:	8b 45 08             	mov    0x8(%ebp),%eax
 32a:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 32d:	8b 45 0c             	mov    0xc(%ebp),%eax
 330:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 333:	eb 17                	jmp    34c <memmove+0x2b>
    *dst++ = *src++;
 335:	8b 45 fc             	mov    -0x4(%ebp),%eax
 338:	8d 50 01             	lea    0x1(%eax),%edx
 33b:	89 55 fc             	mov    %edx,-0x4(%ebp)
 33e:	8b 55 f8             	mov    -0x8(%ebp),%edx
 341:	8d 4a 01             	lea    0x1(%edx),%ecx
 344:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 347:	0f b6 12             	movzbl (%edx),%edx
 34a:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 34c:	8b 45 10             	mov    0x10(%ebp),%eax
 34f:	8d 50 ff             	lea    -0x1(%eax),%edx
 352:	89 55 10             	mov    %edx,0x10(%ebp)
 355:	85 c0                	test   %eax,%eax
 357:	7f dc                	jg     335 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 359:	8b 45 08             	mov    0x8(%ebp),%eax
}
 35c:	c9                   	leave  
 35d:	c3                   	ret    

0000035e <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 35e:	b8 01 00 00 00       	mov    $0x1,%eax
 363:	cd 40                	int    $0x40
 365:	c3                   	ret    

00000366 <exit>:
SYSCALL(exit)
 366:	b8 02 00 00 00       	mov    $0x2,%eax
 36b:	cd 40                	int    $0x40
 36d:	c3                   	ret    

0000036e <wait>:
SYSCALL(wait)
 36e:	b8 03 00 00 00       	mov    $0x3,%eax
 373:	cd 40                	int    $0x40
 375:	c3                   	ret    

00000376 <pipe>:
SYSCALL(pipe)
 376:	b8 04 00 00 00       	mov    $0x4,%eax
 37b:	cd 40                	int    $0x40
 37d:	c3                   	ret    

0000037e <read>:
SYSCALL(read)
 37e:	b8 05 00 00 00       	mov    $0x5,%eax
 383:	cd 40                	int    $0x40
 385:	c3                   	ret    

00000386 <write>:
SYSCALL(write)
 386:	b8 10 00 00 00       	mov    $0x10,%eax
 38b:	cd 40                	int    $0x40
 38d:	c3                   	ret    

0000038e <close>:
SYSCALL(close)
 38e:	b8 15 00 00 00       	mov    $0x15,%eax
 393:	cd 40                	int    $0x40
 395:	c3                   	ret    

00000396 <kill>:
SYSCALL(kill)
 396:	b8 06 00 00 00       	mov    $0x6,%eax
 39b:	cd 40                	int    $0x40
 39d:	c3                   	ret    

0000039e <exec>:
SYSCALL(exec)
 39e:	b8 07 00 00 00       	mov    $0x7,%eax
 3a3:	cd 40                	int    $0x40
 3a5:	c3                   	ret    

000003a6 <open>:
SYSCALL(open)
 3a6:	b8 0f 00 00 00       	mov    $0xf,%eax
 3ab:	cd 40                	int    $0x40
 3ad:	c3                   	ret    

000003ae <mknod>:
SYSCALL(mknod)
 3ae:	b8 11 00 00 00       	mov    $0x11,%eax
 3b3:	cd 40                	int    $0x40
 3b5:	c3                   	ret    

000003b6 <unlink>:
SYSCALL(unlink)
 3b6:	b8 12 00 00 00       	mov    $0x12,%eax
 3bb:	cd 40                	int    $0x40
 3bd:	c3                   	ret    

000003be <fstat>:
SYSCALL(fstat)
 3be:	b8 08 00 00 00       	mov    $0x8,%eax
 3c3:	cd 40                	int    $0x40
 3c5:	c3                   	ret    

000003c6 <link>:
SYSCALL(link)
 3c6:	b8 13 00 00 00       	mov    $0x13,%eax
 3cb:	cd 40                	int    $0x40
 3cd:	c3                   	ret    

000003ce <mkdir>:
SYSCALL(mkdir)
 3ce:	b8 14 00 00 00       	mov    $0x14,%eax
 3d3:	cd 40                	int    $0x40
 3d5:	c3                   	ret    

000003d6 <chdir>:
SYSCALL(chdir)
 3d6:	b8 09 00 00 00       	mov    $0x9,%eax
 3db:	cd 40                	int    $0x40
 3dd:	c3                   	ret    

000003de <dup>:
SYSCALL(dup)
 3de:	b8 0a 00 00 00       	mov    $0xa,%eax
 3e3:	cd 40                	int    $0x40
 3e5:	c3                   	ret    

000003e6 <getpid>:
SYSCALL(getpid)
 3e6:	b8 0b 00 00 00       	mov    $0xb,%eax
 3eb:	cd 40                	int    $0x40
 3ed:	c3                   	ret    

000003ee <getppid>:
SYSCALL(getppid)
 3ee:	b8 18 00 00 00       	mov    $0x18,%eax
 3f3:	cd 40                	int    $0x40
 3f5:	c3                   	ret    

000003f6 <getsyscallinfo>:
SYSCALL(getsyscallinfo)
 3f6:	b8 19 00 00 00       	mov    $0x19,%eax
 3fb:	cd 40                	int    $0x40
 3fd:	c3                   	ret    

000003fe <getAllPids>:
SYSCALL(getAllPids)
 3fe:	b8 16 00 00 00       	mov    $0x16,%eax
 403:	cd 40                	int    $0x40
 405:	c3                   	ret    

00000406 <shutdown>:
SYSCALL(shutdown)
 406:	b8 17 00 00 00       	mov    $0x17,%eax
 40b:	cd 40                	int    $0x40
 40d:	c3                   	ret    

0000040e <sbrk>:
SYSCALL(sbrk)
 40e:	b8 0c 00 00 00       	mov    $0xc,%eax
 413:	cd 40                	int    $0x40
 415:	c3                   	ret    

00000416 <sleep>:
SYSCALL(sleep)
 416:	b8 0d 00 00 00       	mov    $0xd,%eax
 41b:	cd 40                	int    $0x40
 41d:	c3                   	ret    

0000041e <uptime>:
SYSCALL(uptime)
 41e:	b8 0e 00 00 00       	mov    $0xe,%eax
 423:	cd 40                	int    $0x40
 425:	c3                   	ret    

00000426 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 426:	55                   	push   %ebp
 427:	89 e5                	mov    %esp,%ebp
 429:	83 ec 18             	sub    $0x18,%esp
 42c:	8b 45 0c             	mov    0xc(%ebp),%eax
 42f:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 432:	83 ec 04             	sub    $0x4,%esp
 435:	6a 01                	push   $0x1
 437:	8d 45 f4             	lea    -0xc(%ebp),%eax
 43a:	50                   	push   %eax
 43b:	ff 75 08             	pushl  0x8(%ebp)
 43e:	e8 43 ff ff ff       	call   386 <write>
 443:	83 c4 10             	add    $0x10,%esp
}
 446:	90                   	nop
 447:	c9                   	leave  
 448:	c3                   	ret    

00000449 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 449:	55                   	push   %ebp
 44a:	89 e5                	mov    %esp,%ebp
 44c:	53                   	push   %ebx
 44d:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 450:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 457:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 45b:	74 17                	je     474 <printint+0x2b>
 45d:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 461:	79 11                	jns    474 <printint+0x2b>
    neg = 1;
 463:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 46a:	8b 45 0c             	mov    0xc(%ebp),%eax
 46d:	f7 d8                	neg    %eax
 46f:	89 45 ec             	mov    %eax,-0x14(%ebp)
 472:	eb 06                	jmp    47a <printint+0x31>
  } else {
    x = xx;
 474:	8b 45 0c             	mov    0xc(%ebp),%eax
 477:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 47a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 481:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 484:	8d 41 01             	lea    0x1(%ecx),%eax
 487:	89 45 f4             	mov    %eax,-0xc(%ebp)
 48a:	8b 5d 10             	mov    0x10(%ebp),%ebx
 48d:	8b 45 ec             	mov    -0x14(%ebp),%eax
 490:	ba 00 00 00 00       	mov    $0x0,%edx
 495:	f7 f3                	div    %ebx
 497:	89 d0                	mov    %edx,%eax
 499:	0f b6 80 4c 0b 00 00 	movzbl 0xb4c(%eax),%eax
 4a0:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 4a4:	8b 5d 10             	mov    0x10(%ebp),%ebx
 4a7:	8b 45 ec             	mov    -0x14(%ebp),%eax
 4aa:	ba 00 00 00 00       	mov    $0x0,%edx
 4af:	f7 f3                	div    %ebx
 4b1:	89 45 ec             	mov    %eax,-0x14(%ebp)
 4b4:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 4b8:	75 c7                	jne    481 <printint+0x38>
  if(neg)
 4ba:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 4be:	74 2d                	je     4ed <printint+0xa4>
    buf[i++] = '-';
 4c0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4c3:	8d 50 01             	lea    0x1(%eax),%edx
 4c6:	89 55 f4             	mov    %edx,-0xc(%ebp)
 4c9:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 4ce:	eb 1d                	jmp    4ed <printint+0xa4>
    putc(fd, buf[i]);
 4d0:	8d 55 dc             	lea    -0x24(%ebp),%edx
 4d3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4d6:	01 d0                	add    %edx,%eax
 4d8:	0f b6 00             	movzbl (%eax),%eax
 4db:	0f be c0             	movsbl %al,%eax
 4de:	83 ec 08             	sub    $0x8,%esp
 4e1:	50                   	push   %eax
 4e2:	ff 75 08             	pushl  0x8(%ebp)
 4e5:	e8 3c ff ff ff       	call   426 <putc>
 4ea:	83 c4 10             	add    $0x10,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 4ed:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 4f1:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 4f5:	79 d9                	jns    4d0 <printint+0x87>
    putc(fd, buf[i]);
}
 4f7:	90                   	nop
 4f8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4fb:	c9                   	leave  
 4fc:	c3                   	ret    

000004fd <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 4fd:	55                   	push   %ebp
 4fe:	89 e5                	mov    %esp,%ebp
 500:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 503:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 50a:	8d 45 0c             	lea    0xc(%ebp),%eax
 50d:	83 c0 04             	add    $0x4,%eax
 510:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 513:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 51a:	e9 59 01 00 00       	jmp    678 <printf+0x17b>
    c = fmt[i] & 0xff;
 51f:	8b 55 0c             	mov    0xc(%ebp),%edx
 522:	8b 45 f0             	mov    -0x10(%ebp),%eax
 525:	01 d0                	add    %edx,%eax
 527:	0f b6 00             	movzbl (%eax),%eax
 52a:	0f be c0             	movsbl %al,%eax
 52d:	25 ff 00 00 00       	and    $0xff,%eax
 532:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 535:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 539:	75 2c                	jne    567 <printf+0x6a>
      if(c == '%'){
 53b:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 53f:	75 0c                	jne    54d <printf+0x50>
        state = '%';
 541:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 548:	e9 27 01 00 00       	jmp    674 <printf+0x177>
      } else {
        putc(fd, c);
 54d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 550:	0f be c0             	movsbl %al,%eax
 553:	83 ec 08             	sub    $0x8,%esp
 556:	50                   	push   %eax
 557:	ff 75 08             	pushl  0x8(%ebp)
 55a:	e8 c7 fe ff ff       	call   426 <putc>
 55f:	83 c4 10             	add    $0x10,%esp
 562:	e9 0d 01 00 00       	jmp    674 <printf+0x177>
      }
    } else if(state == '%'){
 567:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 56b:	0f 85 03 01 00 00    	jne    674 <printf+0x177>
      if(c == 'd'){
 571:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 575:	75 1e                	jne    595 <printf+0x98>
        printint(fd, *ap, 10, 1);
 577:	8b 45 e8             	mov    -0x18(%ebp),%eax
 57a:	8b 00                	mov    (%eax),%eax
 57c:	6a 01                	push   $0x1
 57e:	6a 0a                	push   $0xa
 580:	50                   	push   %eax
 581:	ff 75 08             	pushl  0x8(%ebp)
 584:	e8 c0 fe ff ff       	call   449 <printint>
 589:	83 c4 10             	add    $0x10,%esp
        ap++;
 58c:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 590:	e9 d8 00 00 00       	jmp    66d <printf+0x170>
      } else if(c == 'x' || c == 'p'){
 595:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 599:	74 06                	je     5a1 <printf+0xa4>
 59b:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 59f:	75 1e                	jne    5bf <printf+0xc2>
        printint(fd, *ap, 16, 0);
 5a1:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5a4:	8b 00                	mov    (%eax),%eax
 5a6:	6a 00                	push   $0x0
 5a8:	6a 10                	push   $0x10
 5aa:	50                   	push   %eax
 5ab:	ff 75 08             	pushl  0x8(%ebp)
 5ae:	e8 96 fe ff ff       	call   449 <printint>
 5b3:	83 c4 10             	add    $0x10,%esp
        ap++;
 5b6:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 5ba:	e9 ae 00 00 00       	jmp    66d <printf+0x170>
      } else if(c == 's'){
 5bf:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 5c3:	75 43                	jne    608 <printf+0x10b>
        s = (char*)*ap;
 5c5:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5c8:	8b 00                	mov    (%eax),%eax
 5ca:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 5cd:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 5d1:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 5d5:	75 25                	jne    5fc <printf+0xff>
          s = "(null)";
 5d7:	c7 45 f4 d9 08 00 00 	movl   $0x8d9,-0xc(%ebp)
        while(*s != 0){
 5de:	eb 1c                	jmp    5fc <printf+0xff>
          putc(fd, *s);
 5e0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5e3:	0f b6 00             	movzbl (%eax),%eax
 5e6:	0f be c0             	movsbl %al,%eax
 5e9:	83 ec 08             	sub    $0x8,%esp
 5ec:	50                   	push   %eax
 5ed:	ff 75 08             	pushl  0x8(%ebp)
 5f0:	e8 31 fe ff ff       	call   426 <putc>
 5f5:	83 c4 10             	add    $0x10,%esp
          s++;
 5f8:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 5fc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5ff:	0f b6 00             	movzbl (%eax),%eax
 602:	84 c0                	test   %al,%al
 604:	75 da                	jne    5e0 <printf+0xe3>
 606:	eb 65                	jmp    66d <printf+0x170>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 608:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 60c:	75 1d                	jne    62b <printf+0x12e>
        putc(fd, *ap);
 60e:	8b 45 e8             	mov    -0x18(%ebp),%eax
 611:	8b 00                	mov    (%eax),%eax
 613:	0f be c0             	movsbl %al,%eax
 616:	83 ec 08             	sub    $0x8,%esp
 619:	50                   	push   %eax
 61a:	ff 75 08             	pushl  0x8(%ebp)
 61d:	e8 04 fe ff ff       	call   426 <putc>
 622:	83 c4 10             	add    $0x10,%esp
        ap++;
 625:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 629:	eb 42                	jmp    66d <printf+0x170>
      } else if(c == '%'){
 62b:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 62f:	75 17                	jne    648 <printf+0x14b>
        putc(fd, c);
 631:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 634:	0f be c0             	movsbl %al,%eax
 637:	83 ec 08             	sub    $0x8,%esp
 63a:	50                   	push   %eax
 63b:	ff 75 08             	pushl  0x8(%ebp)
 63e:	e8 e3 fd ff ff       	call   426 <putc>
 643:	83 c4 10             	add    $0x10,%esp
 646:	eb 25                	jmp    66d <printf+0x170>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 648:	83 ec 08             	sub    $0x8,%esp
 64b:	6a 25                	push   $0x25
 64d:	ff 75 08             	pushl  0x8(%ebp)
 650:	e8 d1 fd ff ff       	call   426 <putc>
 655:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
 658:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 65b:	0f be c0             	movsbl %al,%eax
 65e:	83 ec 08             	sub    $0x8,%esp
 661:	50                   	push   %eax
 662:	ff 75 08             	pushl  0x8(%ebp)
 665:	e8 bc fd ff ff       	call   426 <putc>
 66a:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 66d:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 674:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 678:	8b 55 0c             	mov    0xc(%ebp),%edx
 67b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 67e:	01 d0                	add    %edx,%eax
 680:	0f b6 00             	movzbl (%eax),%eax
 683:	84 c0                	test   %al,%al
 685:	0f 85 94 fe ff ff    	jne    51f <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 68b:	90                   	nop
 68c:	c9                   	leave  
 68d:	c3                   	ret    

0000068e <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 68e:	55                   	push   %ebp
 68f:	89 e5                	mov    %esp,%ebp
 691:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 694:	8b 45 08             	mov    0x8(%ebp),%eax
 697:	83 e8 08             	sub    $0x8,%eax
 69a:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 69d:	a1 68 0b 00 00       	mov    0xb68,%eax
 6a2:	89 45 fc             	mov    %eax,-0x4(%ebp)
 6a5:	eb 24                	jmp    6cb <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6a7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6aa:	8b 00                	mov    (%eax),%eax
 6ac:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6af:	77 12                	ja     6c3 <free+0x35>
 6b1:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6b4:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6b7:	77 24                	ja     6dd <free+0x4f>
 6b9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6bc:	8b 00                	mov    (%eax),%eax
 6be:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 6c1:	77 1a                	ja     6dd <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6c3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6c6:	8b 00                	mov    (%eax),%eax
 6c8:	89 45 fc             	mov    %eax,-0x4(%ebp)
 6cb:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6ce:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6d1:	76 d4                	jbe    6a7 <free+0x19>
 6d3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6d6:	8b 00                	mov    (%eax),%eax
 6d8:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 6db:	76 ca                	jbe    6a7 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 6dd:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6e0:	8b 40 04             	mov    0x4(%eax),%eax
 6e3:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 6ea:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6ed:	01 c2                	add    %eax,%edx
 6ef:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6f2:	8b 00                	mov    (%eax),%eax
 6f4:	39 c2                	cmp    %eax,%edx
 6f6:	75 24                	jne    71c <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 6f8:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6fb:	8b 50 04             	mov    0x4(%eax),%edx
 6fe:	8b 45 fc             	mov    -0x4(%ebp),%eax
 701:	8b 00                	mov    (%eax),%eax
 703:	8b 40 04             	mov    0x4(%eax),%eax
 706:	01 c2                	add    %eax,%edx
 708:	8b 45 f8             	mov    -0x8(%ebp),%eax
 70b:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 70e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 711:	8b 00                	mov    (%eax),%eax
 713:	8b 10                	mov    (%eax),%edx
 715:	8b 45 f8             	mov    -0x8(%ebp),%eax
 718:	89 10                	mov    %edx,(%eax)
 71a:	eb 0a                	jmp    726 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 71c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 71f:	8b 10                	mov    (%eax),%edx
 721:	8b 45 f8             	mov    -0x8(%ebp),%eax
 724:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 726:	8b 45 fc             	mov    -0x4(%ebp),%eax
 729:	8b 40 04             	mov    0x4(%eax),%eax
 72c:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 733:	8b 45 fc             	mov    -0x4(%ebp),%eax
 736:	01 d0                	add    %edx,%eax
 738:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 73b:	75 20                	jne    75d <free+0xcf>
    p->s.size += bp->s.size;
 73d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 740:	8b 50 04             	mov    0x4(%eax),%edx
 743:	8b 45 f8             	mov    -0x8(%ebp),%eax
 746:	8b 40 04             	mov    0x4(%eax),%eax
 749:	01 c2                	add    %eax,%edx
 74b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 74e:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 751:	8b 45 f8             	mov    -0x8(%ebp),%eax
 754:	8b 10                	mov    (%eax),%edx
 756:	8b 45 fc             	mov    -0x4(%ebp),%eax
 759:	89 10                	mov    %edx,(%eax)
 75b:	eb 08                	jmp    765 <free+0xd7>
  } else
    p->s.ptr = bp;
 75d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 760:	8b 55 f8             	mov    -0x8(%ebp),%edx
 763:	89 10                	mov    %edx,(%eax)
  freep = p;
 765:	8b 45 fc             	mov    -0x4(%ebp),%eax
 768:	a3 68 0b 00 00       	mov    %eax,0xb68
}
 76d:	90                   	nop
 76e:	c9                   	leave  
 76f:	c3                   	ret    

00000770 <morecore>:

static Header*
morecore(uint nu)
{
 770:	55                   	push   %ebp
 771:	89 e5                	mov    %esp,%ebp
 773:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 776:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 77d:	77 07                	ja     786 <morecore+0x16>
    nu = 4096;
 77f:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 786:	8b 45 08             	mov    0x8(%ebp),%eax
 789:	c1 e0 03             	shl    $0x3,%eax
 78c:	83 ec 0c             	sub    $0xc,%esp
 78f:	50                   	push   %eax
 790:	e8 79 fc ff ff       	call   40e <sbrk>
 795:	83 c4 10             	add    $0x10,%esp
 798:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 79b:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 79f:	75 07                	jne    7a8 <morecore+0x38>
    return 0;
 7a1:	b8 00 00 00 00       	mov    $0x0,%eax
 7a6:	eb 26                	jmp    7ce <morecore+0x5e>
  hp = (Header*)p;
 7a8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7ab:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 7ae:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7b1:	8b 55 08             	mov    0x8(%ebp),%edx
 7b4:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 7b7:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7ba:	83 c0 08             	add    $0x8,%eax
 7bd:	83 ec 0c             	sub    $0xc,%esp
 7c0:	50                   	push   %eax
 7c1:	e8 c8 fe ff ff       	call   68e <free>
 7c6:	83 c4 10             	add    $0x10,%esp
  return freep;
 7c9:	a1 68 0b 00 00       	mov    0xb68,%eax
}
 7ce:	c9                   	leave  
 7cf:	c3                   	ret    

000007d0 <malloc>:

void*
malloc(uint nbytes)
{
 7d0:	55                   	push   %ebp
 7d1:	89 e5                	mov    %esp,%ebp
 7d3:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7d6:	8b 45 08             	mov    0x8(%ebp),%eax
 7d9:	83 c0 07             	add    $0x7,%eax
 7dc:	c1 e8 03             	shr    $0x3,%eax
 7df:	83 c0 01             	add    $0x1,%eax
 7e2:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 7e5:	a1 68 0b 00 00       	mov    0xb68,%eax
 7ea:	89 45 f0             	mov    %eax,-0x10(%ebp)
 7ed:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 7f1:	75 23                	jne    816 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 7f3:	c7 45 f0 60 0b 00 00 	movl   $0xb60,-0x10(%ebp)
 7fa:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7fd:	a3 68 0b 00 00       	mov    %eax,0xb68
 802:	a1 68 0b 00 00       	mov    0xb68,%eax
 807:	a3 60 0b 00 00       	mov    %eax,0xb60
    base.s.size = 0;
 80c:	c7 05 64 0b 00 00 00 	movl   $0x0,0xb64
 813:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 816:	8b 45 f0             	mov    -0x10(%ebp),%eax
 819:	8b 00                	mov    (%eax),%eax
 81b:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 81e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 821:	8b 40 04             	mov    0x4(%eax),%eax
 824:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 827:	72 4d                	jb     876 <malloc+0xa6>
      if(p->s.size == nunits)
 829:	8b 45 f4             	mov    -0xc(%ebp),%eax
 82c:	8b 40 04             	mov    0x4(%eax),%eax
 82f:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 832:	75 0c                	jne    840 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 834:	8b 45 f4             	mov    -0xc(%ebp),%eax
 837:	8b 10                	mov    (%eax),%edx
 839:	8b 45 f0             	mov    -0x10(%ebp),%eax
 83c:	89 10                	mov    %edx,(%eax)
 83e:	eb 26                	jmp    866 <malloc+0x96>
      else {
        p->s.size -= nunits;
 840:	8b 45 f4             	mov    -0xc(%ebp),%eax
 843:	8b 40 04             	mov    0x4(%eax),%eax
 846:	2b 45 ec             	sub    -0x14(%ebp),%eax
 849:	89 c2                	mov    %eax,%edx
 84b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 84e:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 851:	8b 45 f4             	mov    -0xc(%ebp),%eax
 854:	8b 40 04             	mov    0x4(%eax),%eax
 857:	c1 e0 03             	shl    $0x3,%eax
 85a:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 85d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 860:	8b 55 ec             	mov    -0x14(%ebp),%edx
 863:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 866:	8b 45 f0             	mov    -0x10(%ebp),%eax
 869:	a3 68 0b 00 00       	mov    %eax,0xb68
      return (void*)(p + 1);
 86e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 871:	83 c0 08             	add    $0x8,%eax
 874:	eb 3b                	jmp    8b1 <malloc+0xe1>
    }
    if(p == freep)
 876:	a1 68 0b 00 00       	mov    0xb68,%eax
 87b:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 87e:	75 1e                	jne    89e <malloc+0xce>
      if((p = morecore(nunits)) == 0)
 880:	83 ec 0c             	sub    $0xc,%esp
 883:	ff 75 ec             	pushl  -0x14(%ebp)
 886:	e8 e5 fe ff ff       	call   770 <morecore>
 88b:	83 c4 10             	add    $0x10,%esp
 88e:	89 45 f4             	mov    %eax,-0xc(%ebp)
 891:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 895:	75 07                	jne    89e <malloc+0xce>
        return 0;
 897:	b8 00 00 00 00       	mov    $0x0,%eax
 89c:	eb 13                	jmp    8b1 <malloc+0xe1>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 89e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8a1:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8a4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8a7:	8b 00                	mov    (%eax),%eax
 8a9:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 8ac:	e9 6d ff ff ff       	jmp    81e <malloc+0x4e>
}
 8b1:	c9                   	leave  
 8b2:	c3                   	ret    
