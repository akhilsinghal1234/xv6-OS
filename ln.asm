
_ln:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	53                   	push   %ebx
   e:	51                   	push   %ecx
   f:	89 cb                	mov    %ecx,%ebx
  if(argc != 3){
  11:	83 3b 03             	cmpl   $0x3,(%ebx)
  14:	74 17                	je     2d <main+0x2d>
    printf(2, "Usage: ln old new\n");
  16:	83 ec 08             	sub    $0x8,%esp
  19:	68 18 08 00 00       	push   $0x818
  1e:	6a 02                	push   $0x2
  20:	e8 3d 04 00 00       	call   462 <printf>
  25:	83 c4 10             	add    $0x10,%esp
    exit();
  28:	e8 9e 02 00 00       	call   2cb <exit>
  }
  if(link(argv[1], argv[2]) < 0)
  2d:	8b 43 04             	mov    0x4(%ebx),%eax
  30:	83 c0 08             	add    $0x8,%eax
  33:	8b 10                	mov    (%eax),%edx
  35:	8b 43 04             	mov    0x4(%ebx),%eax
  38:	83 c0 04             	add    $0x4,%eax
  3b:	8b 00                	mov    (%eax),%eax
  3d:	83 ec 08             	sub    $0x8,%esp
  40:	52                   	push   %edx
  41:	50                   	push   %eax
  42:	e8 e4 02 00 00       	call   32b <link>
  47:	83 c4 10             	add    $0x10,%esp
  4a:	85 c0                	test   %eax,%eax
  4c:	79 21                	jns    6f <main+0x6f>
    printf(2, "link %s %s: failed\n", argv[1], argv[2]);
  4e:	8b 43 04             	mov    0x4(%ebx),%eax
  51:	83 c0 08             	add    $0x8,%eax
  54:	8b 10                	mov    (%eax),%edx
  56:	8b 43 04             	mov    0x4(%ebx),%eax
  59:	83 c0 04             	add    $0x4,%eax
  5c:	8b 00                	mov    (%eax),%eax
  5e:	52                   	push   %edx
  5f:	50                   	push   %eax
  60:	68 2b 08 00 00       	push   $0x82b
  65:	6a 02                	push   $0x2
  67:	e8 f6 03 00 00       	call   462 <printf>
  6c:	83 c4 10             	add    $0x10,%esp
  exit();
  6f:	e8 57 02 00 00       	call   2cb <exit>

00000074 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  74:	55                   	push   %ebp
  75:	89 e5                	mov    %esp,%ebp
  77:	57                   	push   %edi
  78:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  79:	8b 4d 08             	mov    0x8(%ebp),%ecx
  7c:	8b 55 10             	mov    0x10(%ebp),%edx
  7f:	8b 45 0c             	mov    0xc(%ebp),%eax
  82:	89 cb                	mov    %ecx,%ebx
  84:	89 df                	mov    %ebx,%edi
  86:	89 d1                	mov    %edx,%ecx
  88:	fc                   	cld    
  89:	f3 aa                	rep stos %al,%es:(%edi)
  8b:	89 ca                	mov    %ecx,%edx
  8d:	89 fb                	mov    %edi,%ebx
  8f:	89 5d 08             	mov    %ebx,0x8(%ebp)
  92:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  95:	90                   	nop
  96:	5b                   	pop    %ebx
  97:	5f                   	pop    %edi
  98:	5d                   	pop    %ebp
  99:	c3                   	ret    

0000009a <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  9a:	55                   	push   %ebp
  9b:	89 e5                	mov    %esp,%ebp
  9d:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  a0:	8b 45 08             	mov    0x8(%ebp),%eax
  a3:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  a6:	90                   	nop
  a7:	8b 45 08             	mov    0x8(%ebp),%eax
  aa:	8d 50 01             	lea    0x1(%eax),%edx
  ad:	89 55 08             	mov    %edx,0x8(%ebp)
  b0:	8b 55 0c             	mov    0xc(%ebp),%edx
  b3:	8d 4a 01             	lea    0x1(%edx),%ecx
  b6:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  b9:	0f b6 12             	movzbl (%edx),%edx
  bc:	88 10                	mov    %dl,(%eax)
  be:	0f b6 00             	movzbl (%eax),%eax
  c1:	84 c0                	test   %al,%al
  c3:	75 e2                	jne    a7 <strcpy+0xd>
    ;
  return os;
  c5:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  c8:	c9                   	leave  
  c9:	c3                   	ret    

000000ca <strcmp>:

int
strcmp(const char *p, const char *q)
{
  ca:	55                   	push   %ebp
  cb:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  cd:	eb 08                	jmp    d7 <strcmp+0xd>
    p++, q++;
  cf:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  d3:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  d7:	8b 45 08             	mov    0x8(%ebp),%eax
  da:	0f b6 00             	movzbl (%eax),%eax
  dd:	84 c0                	test   %al,%al
  df:	74 10                	je     f1 <strcmp+0x27>
  e1:	8b 45 08             	mov    0x8(%ebp),%eax
  e4:	0f b6 10             	movzbl (%eax),%edx
  e7:	8b 45 0c             	mov    0xc(%ebp),%eax
  ea:	0f b6 00             	movzbl (%eax),%eax
  ed:	38 c2                	cmp    %al,%dl
  ef:	74 de                	je     cf <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
  f1:	8b 45 08             	mov    0x8(%ebp),%eax
  f4:	0f b6 00             	movzbl (%eax),%eax
  f7:	0f b6 d0             	movzbl %al,%edx
  fa:	8b 45 0c             	mov    0xc(%ebp),%eax
  fd:	0f b6 00             	movzbl (%eax),%eax
 100:	0f b6 c0             	movzbl %al,%eax
 103:	29 c2                	sub    %eax,%edx
 105:	89 d0                	mov    %edx,%eax
}
 107:	5d                   	pop    %ebp
 108:	c3                   	ret    

00000109 <strlen>:

uint
strlen(char *s)
{
 109:	55                   	push   %ebp
 10a:	89 e5                	mov    %esp,%ebp
 10c:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 10f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 116:	eb 04                	jmp    11c <strlen+0x13>
 118:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 11c:	8b 55 fc             	mov    -0x4(%ebp),%edx
 11f:	8b 45 08             	mov    0x8(%ebp),%eax
 122:	01 d0                	add    %edx,%eax
 124:	0f b6 00             	movzbl (%eax),%eax
 127:	84 c0                	test   %al,%al
 129:	75 ed                	jne    118 <strlen+0xf>
    ;
  return n;
 12b:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 12e:	c9                   	leave  
 12f:	c3                   	ret    

00000130 <memset>:

void*
memset(void *dst, int c, uint n)
{
 130:	55                   	push   %ebp
 131:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
 133:	8b 45 10             	mov    0x10(%ebp),%eax
 136:	50                   	push   %eax
 137:	ff 75 0c             	pushl  0xc(%ebp)
 13a:	ff 75 08             	pushl  0x8(%ebp)
 13d:	e8 32 ff ff ff       	call   74 <stosb>
 142:	83 c4 0c             	add    $0xc,%esp
  return dst;
 145:	8b 45 08             	mov    0x8(%ebp),%eax
}
 148:	c9                   	leave  
 149:	c3                   	ret    

0000014a <strchr>:

char*
strchr(const char *s, char c)
{
 14a:	55                   	push   %ebp
 14b:	89 e5                	mov    %esp,%ebp
 14d:	83 ec 04             	sub    $0x4,%esp
 150:	8b 45 0c             	mov    0xc(%ebp),%eax
 153:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 156:	eb 14                	jmp    16c <strchr+0x22>
    if(*s == c)
 158:	8b 45 08             	mov    0x8(%ebp),%eax
 15b:	0f b6 00             	movzbl (%eax),%eax
 15e:	3a 45 fc             	cmp    -0x4(%ebp),%al
 161:	75 05                	jne    168 <strchr+0x1e>
      return (char*)s;
 163:	8b 45 08             	mov    0x8(%ebp),%eax
 166:	eb 13                	jmp    17b <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 168:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 16c:	8b 45 08             	mov    0x8(%ebp),%eax
 16f:	0f b6 00             	movzbl (%eax),%eax
 172:	84 c0                	test   %al,%al
 174:	75 e2                	jne    158 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 176:	b8 00 00 00 00       	mov    $0x0,%eax
}
 17b:	c9                   	leave  
 17c:	c3                   	ret    

0000017d <gets>:

char*
gets(char *buf, int max)
{
 17d:	55                   	push   %ebp
 17e:	89 e5                	mov    %esp,%ebp
 180:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 183:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 18a:	eb 42                	jmp    1ce <gets+0x51>
    cc = read(0, &c, 1);
 18c:	83 ec 04             	sub    $0x4,%esp
 18f:	6a 01                	push   $0x1
 191:	8d 45 ef             	lea    -0x11(%ebp),%eax
 194:	50                   	push   %eax
 195:	6a 00                	push   $0x0
 197:	e8 47 01 00 00       	call   2e3 <read>
 19c:	83 c4 10             	add    $0x10,%esp
 19f:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 1a2:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 1a6:	7e 33                	jle    1db <gets+0x5e>
      break;
    buf[i++] = c;
 1a8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1ab:	8d 50 01             	lea    0x1(%eax),%edx
 1ae:	89 55 f4             	mov    %edx,-0xc(%ebp)
 1b1:	89 c2                	mov    %eax,%edx
 1b3:	8b 45 08             	mov    0x8(%ebp),%eax
 1b6:	01 c2                	add    %eax,%edx
 1b8:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1bc:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 1be:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1c2:	3c 0a                	cmp    $0xa,%al
 1c4:	74 16                	je     1dc <gets+0x5f>
 1c6:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1ca:	3c 0d                	cmp    $0xd,%al
 1cc:	74 0e                	je     1dc <gets+0x5f>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1ce:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1d1:	83 c0 01             	add    $0x1,%eax
 1d4:	3b 45 0c             	cmp    0xc(%ebp),%eax
 1d7:	7c b3                	jl     18c <gets+0xf>
 1d9:	eb 01                	jmp    1dc <gets+0x5f>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 1db:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 1dc:	8b 55 f4             	mov    -0xc(%ebp),%edx
 1df:	8b 45 08             	mov    0x8(%ebp),%eax
 1e2:	01 d0                	add    %edx,%eax
 1e4:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 1e7:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1ea:	c9                   	leave  
 1eb:	c3                   	ret    

000001ec <stat>:

int
stat(char *n, struct stat *st)
{
 1ec:	55                   	push   %ebp
 1ed:	89 e5                	mov    %esp,%ebp
 1ef:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1f2:	83 ec 08             	sub    $0x8,%esp
 1f5:	6a 00                	push   $0x0
 1f7:	ff 75 08             	pushl  0x8(%ebp)
 1fa:	e8 0c 01 00 00       	call   30b <open>
 1ff:	83 c4 10             	add    $0x10,%esp
 202:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 205:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 209:	79 07                	jns    212 <stat+0x26>
    return -1;
 20b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 210:	eb 25                	jmp    237 <stat+0x4b>
  r = fstat(fd, st);
 212:	83 ec 08             	sub    $0x8,%esp
 215:	ff 75 0c             	pushl  0xc(%ebp)
 218:	ff 75 f4             	pushl  -0xc(%ebp)
 21b:	e8 03 01 00 00       	call   323 <fstat>
 220:	83 c4 10             	add    $0x10,%esp
 223:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 226:	83 ec 0c             	sub    $0xc,%esp
 229:	ff 75 f4             	pushl  -0xc(%ebp)
 22c:	e8 c2 00 00 00       	call   2f3 <close>
 231:	83 c4 10             	add    $0x10,%esp
  return r;
 234:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 237:	c9                   	leave  
 238:	c3                   	ret    

00000239 <atoi>:

int
atoi(const char *s)
{
 239:	55                   	push   %ebp
 23a:	89 e5                	mov    %esp,%ebp
 23c:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 23f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 246:	eb 25                	jmp    26d <atoi+0x34>
    n = n*10 + *s++ - '0';
 248:	8b 55 fc             	mov    -0x4(%ebp),%edx
 24b:	89 d0                	mov    %edx,%eax
 24d:	c1 e0 02             	shl    $0x2,%eax
 250:	01 d0                	add    %edx,%eax
 252:	01 c0                	add    %eax,%eax
 254:	89 c1                	mov    %eax,%ecx
 256:	8b 45 08             	mov    0x8(%ebp),%eax
 259:	8d 50 01             	lea    0x1(%eax),%edx
 25c:	89 55 08             	mov    %edx,0x8(%ebp)
 25f:	0f b6 00             	movzbl (%eax),%eax
 262:	0f be c0             	movsbl %al,%eax
 265:	01 c8                	add    %ecx,%eax
 267:	83 e8 30             	sub    $0x30,%eax
 26a:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 26d:	8b 45 08             	mov    0x8(%ebp),%eax
 270:	0f b6 00             	movzbl (%eax),%eax
 273:	3c 2f                	cmp    $0x2f,%al
 275:	7e 0a                	jle    281 <atoi+0x48>
 277:	8b 45 08             	mov    0x8(%ebp),%eax
 27a:	0f b6 00             	movzbl (%eax),%eax
 27d:	3c 39                	cmp    $0x39,%al
 27f:	7e c7                	jle    248 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 281:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 284:	c9                   	leave  
 285:	c3                   	ret    

00000286 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 286:	55                   	push   %ebp
 287:	89 e5                	mov    %esp,%ebp
 289:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 28c:	8b 45 08             	mov    0x8(%ebp),%eax
 28f:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 292:	8b 45 0c             	mov    0xc(%ebp),%eax
 295:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 298:	eb 17                	jmp    2b1 <memmove+0x2b>
    *dst++ = *src++;
 29a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 29d:	8d 50 01             	lea    0x1(%eax),%edx
 2a0:	89 55 fc             	mov    %edx,-0x4(%ebp)
 2a3:	8b 55 f8             	mov    -0x8(%ebp),%edx
 2a6:	8d 4a 01             	lea    0x1(%edx),%ecx
 2a9:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 2ac:	0f b6 12             	movzbl (%edx),%edx
 2af:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2b1:	8b 45 10             	mov    0x10(%ebp),%eax
 2b4:	8d 50 ff             	lea    -0x1(%eax),%edx
 2b7:	89 55 10             	mov    %edx,0x10(%ebp)
 2ba:	85 c0                	test   %eax,%eax
 2bc:	7f dc                	jg     29a <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 2be:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2c1:	c9                   	leave  
 2c2:	c3                   	ret    

000002c3 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2c3:	b8 01 00 00 00       	mov    $0x1,%eax
 2c8:	cd 40                	int    $0x40
 2ca:	c3                   	ret    

000002cb <exit>:
SYSCALL(exit)
 2cb:	b8 02 00 00 00       	mov    $0x2,%eax
 2d0:	cd 40                	int    $0x40
 2d2:	c3                   	ret    

000002d3 <wait>:
SYSCALL(wait)
 2d3:	b8 03 00 00 00       	mov    $0x3,%eax
 2d8:	cd 40                	int    $0x40
 2da:	c3                   	ret    

000002db <pipe>:
SYSCALL(pipe)
 2db:	b8 04 00 00 00       	mov    $0x4,%eax
 2e0:	cd 40                	int    $0x40
 2e2:	c3                   	ret    

000002e3 <read>:
SYSCALL(read)
 2e3:	b8 05 00 00 00       	mov    $0x5,%eax
 2e8:	cd 40                	int    $0x40
 2ea:	c3                   	ret    

000002eb <write>:
SYSCALL(write)
 2eb:	b8 10 00 00 00       	mov    $0x10,%eax
 2f0:	cd 40                	int    $0x40
 2f2:	c3                   	ret    

000002f3 <close>:
SYSCALL(close)
 2f3:	b8 15 00 00 00       	mov    $0x15,%eax
 2f8:	cd 40                	int    $0x40
 2fa:	c3                   	ret    

000002fb <kill>:
SYSCALL(kill)
 2fb:	b8 06 00 00 00       	mov    $0x6,%eax
 300:	cd 40                	int    $0x40
 302:	c3                   	ret    

00000303 <exec>:
SYSCALL(exec)
 303:	b8 07 00 00 00       	mov    $0x7,%eax
 308:	cd 40                	int    $0x40
 30a:	c3                   	ret    

0000030b <open>:
SYSCALL(open)
 30b:	b8 0f 00 00 00       	mov    $0xf,%eax
 310:	cd 40                	int    $0x40
 312:	c3                   	ret    

00000313 <mknod>:
SYSCALL(mknod)
 313:	b8 11 00 00 00       	mov    $0x11,%eax
 318:	cd 40                	int    $0x40
 31a:	c3                   	ret    

0000031b <unlink>:
SYSCALL(unlink)
 31b:	b8 12 00 00 00       	mov    $0x12,%eax
 320:	cd 40                	int    $0x40
 322:	c3                   	ret    

00000323 <fstat>:
SYSCALL(fstat)
 323:	b8 08 00 00 00       	mov    $0x8,%eax
 328:	cd 40                	int    $0x40
 32a:	c3                   	ret    

0000032b <link>:
SYSCALL(link)
 32b:	b8 13 00 00 00       	mov    $0x13,%eax
 330:	cd 40                	int    $0x40
 332:	c3                   	ret    

00000333 <mkdir>:
SYSCALL(mkdir)
 333:	b8 14 00 00 00       	mov    $0x14,%eax
 338:	cd 40                	int    $0x40
 33a:	c3                   	ret    

0000033b <chdir>:
SYSCALL(chdir)
 33b:	b8 09 00 00 00       	mov    $0x9,%eax
 340:	cd 40                	int    $0x40
 342:	c3                   	ret    

00000343 <dup>:
SYSCALL(dup)
 343:	b8 0a 00 00 00       	mov    $0xa,%eax
 348:	cd 40                	int    $0x40
 34a:	c3                   	ret    

0000034b <getpid>:
SYSCALL(getpid)
 34b:	b8 0b 00 00 00       	mov    $0xb,%eax
 350:	cd 40                	int    $0x40
 352:	c3                   	ret    

00000353 <getppid>:
SYSCALL(getppid)
 353:	b8 18 00 00 00       	mov    $0x18,%eax
 358:	cd 40                	int    $0x40
 35a:	c3                   	ret    

0000035b <getsyscallinfo>:
SYSCALL(getsyscallinfo)
 35b:	b8 19 00 00 00       	mov    $0x19,%eax
 360:	cd 40                	int    $0x40
 362:	c3                   	ret    

00000363 <getAllPids>:
SYSCALL(getAllPids)
 363:	b8 16 00 00 00       	mov    $0x16,%eax
 368:	cd 40                	int    $0x40
 36a:	c3                   	ret    

0000036b <shutdown>:
SYSCALL(shutdown)
 36b:	b8 17 00 00 00       	mov    $0x17,%eax
 370:	cd 40                	int    $0x40
 372:	c3                   	ret    

00000373 <sbrk>:
SYSCALL(sbrk)
 373:	b8 0c 00 00 00       	mov    $0xc,%eax
 378:	cd 40                	int    $0x40
 37a:	c3                   	ret    

0000037b <sleep>:
SYSCALL(sleep)
 37b:	b8 0d 00 00 00       	mov    $0xd,%eax
 380:	cd 40                	int    $0x40
 382:	c3                   	ret    

00000383 <uptime>:
SYSCALL(uptime)
 383:	b8 0e 00 00 00       	mov    $0xe,%eax
 388:	cd 40                	int    $0x40
 38a:	c3                   	ret    

0000038b <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 38b:	55                   	push   %ebp
 38c:	89 e5                	mov    %esp,%ebp
 38e:	83 ec 18             	sub    $0x18,%esp
 391:	8b 45 0c             	mov    0xc(%ebp),%eax
 394:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 397:	83 ec 04             	sub    $0x4,%esp
 39a:	6a 01                	push   $0x1
 39c:	8d 45 f4             	lea    -0xc(%ebp),%eax
 39f:	50                   	push   %eax
 3a0:	ff 75 08             	pushl  0x8(%ebp)
 3a3:	e8 43 ff ff ff       	call   2eb <write>
 3a8:	83 c4 10             	add    $0x10,%esp
}
 3ab:	90                   	nop
 3ac:	c9                   	leave  
 3ad:	c3                   	ret    

000003ae <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 3ae:	55                   	push   %ebp
 3af:	89 e5                	mov    %esp,%ebp
 3b1:	53                   	push   %ebx
 3b2:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 3b5:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 3bc:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 3c0:	74 17                	je     3d9 <printint+0x2b>
 3c2:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 3c6:	79 11                	jns    3d9 <printint+0x2b>
    neg = 1;
 3c8:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 3cf:	8b 45 0c             	mov    0xc(%ebp),%eax
 3d2:	f7 d8                	neg    %eax
 3d4:	89 45 ec             	mov    %eax,-0x14(%ebp)
 3d7:	eb 06                	jmp    3df <printint+0x31>
  } else {
    x = xx;
 3d9:	8b 45 0c             	mov    0xc(%ebp),%eax
 3dc:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 3df:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 3e6:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 3e9:	8d 41 01             	lea    0x1(%ecx),%eax
 3ec:	89 45 f4             	mov    %eax,-0xc(%ebp)
 3ef:	8b 5d 10             	mov    0x10(%ebp),%ebx
 3f2:	8b 45 ec             	mov    -0x14(%ebp),%eax
 3f5:	ba 00 00 00 00       	mov    $0x0,%edx
 3fa:	f7 f3                	div    %ebx
 3fc:	89 d0                	mov    %edx,%eax
 3fe:	0f b6 80 94 0a 00 00 	movzbl 0xa94(%eax),%eax
 405:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 409:	8b 5d 10             	mov    0x10(%ebp),%ebx
 40c:	8b 45 ec             	mov    -0x14(%ebp),%eax
 40f:	ba 00 00 00 00       	mov    $0x0,%edx
 414:	f7 f3                	div    %ebx
 416:	89 45 ec             	mov    %eax,-0x14(%ebp)
 419:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 41d:	75 c7                	jne    3e6 <printint+0x38>
  if(neg)
 41f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 423:	74 2d                	je     452 <printint+0xa4>
    buf[i++] = '-';
 425:	8b 45 f4             	mov    -0xc(%ebp),%eax
 428:	8d 50 01             	lea    0x1(%eax),%edx
 42b:	89 55 f4             	mov    %edx,-0xc(%ebp)
 42e:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 433:	eb 1d                	jmp    452 <printint+0xa4>
    putc(fd, buf[i]);
 435:	8d 55 dc             	lea    -0x24(%ebp),%edx
 438:	8b 45 f4             	mov    -0xc(%ebp),%eax
 43b:	01 d0                	add    %edx,%eax
 43d:	0f b6 00             	movzbl (%eax),%eax
 440:	0f be c0             	movsbl %al,%eax
 443:	83 ec 08             	sub    $0x8,%esp
 446:	50                   	push   %eax
 447:	ff 75 08             	pushl  0x8(%ebp)
 44a:	e8 3c ff ff ff       	call   38b <putc>
 44f:	83 c4 10             	add    $0x10,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 452:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 456:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 45a:	79 d9                	jns    435 <printint+0x87>
    putc(fd, buf[i]);
}
 45c:	90                   	nop
 45d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 460:	c9                   	leave  
 461:	c3                   	ret    

00000462 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 462:	55                   	push   %ebp
 463:	89 e5                	mov    %esp,%ebp
 465:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 468:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 46f:	8d 45 0c             	lea    0xc(%ebp),%eax
 472:	83 c0 04             	add    $0x4,%eax
 475:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 478:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 47f:	e9 59 01 00 00       	jmp    5dd <printf+0x17b>
    c = fmt[i] & 0xff;
 484:	8b 55 0c             	mov    0xc(%ebp),%edx
 487:	8b 45 f0             	mov    -0x10(%ebp),%eax
 48a:	01 d0                	add    %edx,%eax
 48c:	0f b6 00             	movzbl (%eax),%eax
 48f:	0f be c0             	movsbl %al,%eax
 492:	25 ff 00 00 00       	and    $0xff,%eax
 497:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 49a:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 49e:	75 2c                	jne    4cc <printf+0x6a>
      if(c == '%'){
 4a0:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 4a4:	75 0c                	jne    4b2 <printf+0x50>
        state = '%';
 4a6:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 4ad:	e9 27 01 00 00       	jmp    5d9 <printf+0x177>
      } else {
        putc(fd, c);
 4b2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 4b5:	0f be c0             	movsbl %al,%eax
 4b8:	83 ec 08             	sub    $0x8,%esp
 4bb:	50                   	push   %eax
 4bc:	ff 75 08             	pushl  0x8(%ebp)
 4bf:	e8 c7 fe ff ff       	call   38b <putc>
 4c4:	83 c4 10             	add    $0x10,%esp
 4c7:	e9 0d 01 00 00       	jmp    5d9 <printf+0x177>
      }
    } else if(state == '%'){
 4cc:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 4d0:	0f 85 03 01 00 00    	jne    5d9 <printf+0x177>
      if(c == 'd'){
 4d6:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 4da:	75 1e                	jne    4fa <printf+0x98>
        printint(fd, *ap, 10, 1);
 4dc:	8b 45 e8             	mov    -0x18(%ebp),%eax
 4df:	8b 00                	mov    (%eax),%eax
 4e1:	6a 01                	push   $0x1
 4e3:	6a 0a                	push   $0xa
 4e5:	50                   	push   %eax
 4e6:	ff 75 08             	pushl  0x8(%ebp)
 4e9:	e8 c0 fe ff ff       	call   3ae <printint>
 4ee:	83 c4 10             	add    $0x10,%esp
        ap++;
 4f1:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 4f5:	e9 d8 00 00 00       	jmp    5d2 <printf+0x170>
      } else if(c == 'x' || c == 'p'){
 4fa:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 4fe:	74 06                	je     506 <printf+0xa4>
 500:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 504:	75 1e                	jne    524 <printf+0xc2>
        printint(fd, *ap, 16, 0);
 506:	8b 45 e8             	mov    -0x18(%ebp),%eax
 509:	8b 00                	mov    (%eax),%eax
 50b:	6a 00                	push   $0x0
 50d:	6a 10                	push   $0x10
 50f:	50                   	push   %eax
 510:	ff 75 08             	pushl  0x8(%ebp)
 513:	e8 96 fe ff ff       	call   3ae <printint>
 518:	83 c4 10             	add    $0x10,%esp
        ap++;
 51b:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 51f:	e9 ae 00 00 00       	jmp    5d2 <printf+0x170>
      } else if(c == 's'){
 524:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 528:	75 43                	jne    56d <printf+0x10b>
        s = (char*)*ap;
 52a:	8b 45 e8             	mov    -0x18(%ebp),%eax
 52d:	8b 00                	mov    (%eax),%eax
 52f:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 532:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 536:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 53a:	75 25                	jne    561 <printf+0xff>
          s = "(null)";
 53c:	c7 45 f4 3f 08 00 00 	movl   $0x83f,-0xc(%ebp)
        while(*s != 0){
 543:	eb 1c                	jmp    561 <printf+0xff>
          putc(fd, *s);
 545:	8b 45 f4             	mov    -0xc(%ebp),%eax
 548:	0f b6 00             	movzbl (%eax),%eax
 54b:	0f be c0             	movsbl %al,%eax
 54e:	83 ec 08             	sub    $0x8,%esp
 551:	50                   	push   %eax
 552:	ff 75 08             	pushl  0x8(%ebp)
 555:	e8 31 fe ff ff       	call   38b <putc>
 55a:	83 c4 10             	add    $0x10,%esp
          s++;
 55d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 561:	8b 45 f4             	mov    -0xc(%ebp),%eax
 564:	0f b6 00             	movzbl (%eax),%eax
 567:	84 c0                	test   %al,%al
 569:	75 da                	jne    545 <printf+0xe3>
 56b:	eb 65                	jmp    5d2 <printf+0x170>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 56d:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 571:	75 1d                	jne    590 <printf+0x12e>
        putc(fd, *ap);
 573:	8b 45 e8             	mov    -0x18(%ebp),%eax
 576:	8b 00                	mov    (%eax),%eax
 578:	0f be c0             	movsbl %al,%eax
 57b:	83 ec 08             	sub    $0x8,%esp
 57e:	50                   	push   %eax
 57f:	ff 75 08             	pushl  0x8(%ebp)
 582:	e8 04 fe ff ff       	call   38b <putc>
 587:	83 c4 10             	add    $0x10,%esp
        ap++;
 58a:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 58e:	eb 42                	jmp    5d2 <printf+0x170>
      } else if(c == '%'){
 590:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 594:	75 17                	jne    5ad <printf+0x14b>
        putc(fd, c);
 596:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 599:	0f be c0             	movsbl %al,%eax
 59c:	83 ec 08             	sub    $0x8,%esp
 59f:	50                   	push   %eax
 5a0:	ff 75 08             	pushl  0x8(%ebp)
 5a3:	e8 e3 fd ff ff       	call   38b <putc>
 5a8:	83 c4 10             	add    $0x10,%esp
 5ab:	eb 25                	jmp    5d2 <printf+0x170>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 5ad:	83 ec 08             	sub    $0x8,%esp
 5b0:	6a 25                	push   $0x25
 5b2:	ff 75 08             	pushl  0x8(%ebp)
 5b5:	e8 d1 fd ff ff       	call   38b <putc>
 5ba:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
 5bd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5c0:	0f be c0             	movsbl %al,%eax
 5c3:	83 ec 08             	sub    $0x8,%esp
 5c6:	50                   	push   %eax
 5c7:	ff 75 08             	pushl  0x8(%ebp)
 5ca:	e8 bc fd ff ff       	call   38b <putc>
 5cf:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 5d2:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 5d9:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 5dd:	8b 55 0c             	mov    0xc(%ebp),%edx
 5e0:	8b 45 f0             	mov    -0x10(%ebp),%eax
 5e3:	01 d0                	add    %edx,%eax
 5e5:	0f b6 00             	movzbl (%eax),%eax
 5e8:	84 c0                	test   %al,%al
 5ea:	0f 85 94 fe ff ff    	jne    484 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 5f0:	90                   	nop
 5f1:	c9                   	leave  
 5f2:	c3                   	ret    

000005f3 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 5f3:	55                   	push   %ebp
 5f4:	89 e5                	mov    %esp,%ebp
 5f6:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 5f9:	8b 45 08             	mov    0x8(%ebp),%eax
 5fc:	83 e8 08             	sub    $0x8,%eax
 5ff:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 602:	a1 b0 0a 00 00       	mov    0xab0,%eax
 607:	89 45 fc             	mov    %eax,-0x4(%ebp)
 60a:	eb 24                	jmp    630 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 60c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 60f:	8b 00                	mov    (%eax),%eax
 611:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 614:	77 12                	ja     628 <free+0x35>
 616:	8b 45 f8             	mov    -0x8(%ebp),%eax
 619:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 61c:	77 24                	ja     642 <free+0x4f>
 61e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 621:	8b 00                	mov    (%eax),%eax
 623:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 626:	77 1a                	ja     642 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 628:	8b 45 fc             	mov    -0x4(%ebp),%eax
 62b:	8b 00                	mov    (%eax),%eax
 62d:	89 45 fc             	mov    %eax,-0x4(%ebp)
 630:	8b 45 f8             	mov    -0x8(%ebp),%eax
 633:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 636:	76 d4                	jbe    60c <free+0x19>
 638:	8b 45 fc             	mov    -0x4(%ebp),%eax
 63b:	8b 00                	mov    (%eax),%eax
 63d:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 640:	76 ca                	jbe    60c <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 642:	8b 45 f8             	mov    -0x8(%ebp),%eax
 645:	8b 40 04             	mov    0x4(%eax),%eax
 648:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 64f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 652:	01 c2                	add    %eax,%edx
 654:	8b 45 fc             	mov    -0x4(%ebp),%eax
 657:	8b 00                	mov    (%eax),%eax
 659:	39 c2                	cmp    %eax,%edx
 65b:	75 24                	jne    681 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 65d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 660:	8b 50 04             	mov    0x4(%eax),%edx
 663:	8b 45 fc             	mov    -0x4(%ebp),%eax
 666:	8b 00                	mov    (%eax),%eax
 668:	8b 40 04             	mov    0x4(%eax),%eax
 66b:	01 c2                	add    %eax,%edx
 66d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 670:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 673:	8b 45 fc             	mov    -0x4(%ebp),%eax
 676:	8b 00                	mov    (%eax),%eax
 678:	8b 10                	mov    (%eax),%edx
 67a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 67d:	89 10                	mov    %edx,(%eax)
 67f:	eb 0a                	jmp    68b <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 681:	8b 45 fc             	mov    -0x4(%ebp),%eax
 684:	8b 10                	mov    (%eax),%edx
 686:	8b 45 f8             	mov    -0x8(%ebp),%eax
 689:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 68b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 68e:	8b 40 04             	mov    0x4(%eax),%eax
 691:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 698:	8b 45 fc             	mov    -0x4(%ebp),%eax
 69b:	01 d0                	add    %edx,%eax
 69d:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 6a0:	75 20                	jne    6c2 <free+0xcf>
    p->s.size += bp->s.size;
 6a2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6a5:	8b 50 04             	mov    0x4(%eax),%edx
 6a8:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6ab:	8b 40 04             	mov    0x4(%eax),%eax
 6ae:	01 c2                	add    %eax,%edx
 6b0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6b3:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 6b6:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6b9:	8b 10                	mov    (%eax),%edx
 6bb:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6be:	89 10                	mov    %edx,(%eax)
 6c0:	eb 08                	jmp    6ca <free+0xd7>
  } else
    p->s.ptr = bp;
 6c2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6c5:	8b 55 f8             	mov    -0x8(%ebp),%edx
 6c8:	89 10                	mov    %edx,(%eax)
  freep = p;
 6ca:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6cd:	a3 b0 0a 00 00       	mov    %eax,0xab0
}
 6d2:	90                   	nop
 6d3:	c9                   	leave  
 6d4:	c3                   	ret    

000006d5 <morecore>:

static Header*
morecore(uint nu)
{
 6d5:	55                   	push   %ebp
 6d6:	89 e5                	mov    %esp,%ebp
 6d8:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 6db:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 6e2:	77 07                	ja     6eb <morecore+0x16>
    nu = 4096;
 6e4:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 6eb:	8b 45 08             	mov    0x8(%ebp),%eax
 6ee:	c1 e0 03             	shl    $0x3,%eax
 6f1:	83 ec 0c             	sub    $0xc,%esp
 6f4:	50                   	push   %eax
 6f5:	e8 79 fc ff ff       	call   373 <sbrk>
 6fa:	83 c4 10             	add    $0x10,%esp
 6fd:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 700:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 704:	75 07                	jne    70d <morecore+0x38>
    return 0;
 706:	b8 00 00 00 00       	mov    $0x0,%eax
 70b:	eb 26                	jmp    733 <morecore+0x5e>
  hp = (Header*)p;
 70d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 710:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 713:	8b 45 f0             	mov    -0x10(%ebp),%eax
 716:	8b 55 08             	mov    0x8(%ebp),%edx
 719:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 71c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 71f:	83 c0 08             	add    $0x8,%eax
 722:	83 ec 0c             	sub    $0xc,%esp
 725:	50                   	push   %eax
 726:	e8 c8 fe ff ff       	call   5f3 <free>
 72b:	83 c4 10             	add    $0x10,%esp
  return freep;
 72e:	a1 b0 0a 00 00       	mov    0xab0,%eax
}
 733:	c9                   	leave  
 734:	c3                   	ret    

00000735 <malloc>:

void*
malloc(uint nbytes)
{
 735:	55                   	push   %ebp
 736:	89 e5                	mov    %esp,%ebp
 738:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 73b:	8b 45 08             	mov    0x8(%ebp),%eax
 73e:	83 c0 07             	add    $0x7,%eax
 741:	c1 e8 03             	shr    $0x3,%eax
 744:	83 c0 01             	add    $0x1,%eax
 747:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 74a:	a1 b0 0a 00 00       	mov    0xab0,%eax
 74f:	89 45 f0             	mov    %eax,-0x10(%ebp)
 752:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 756:	75 23                	jne    77b <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 758:	c7 45 f0 a8 0a 00 00 	movl   $0xaa8,-0x10(%ebp)
 75f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 762:	a3 b0 0a 00 00       	mov    %eax,0xab0
 767:	a1 b0 0a 00 00       	mov    0xab0,%eax
 76c:	a3 a8 0a 00 00       	mov    %eax,0xaa8
    base.s.size = 0;
 771:	c7 05 ac 0a 00 00 00 	movl   $0x0,0xaac
 778:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 77b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 77e:	8b 00                	mov    (%eax),%eax
 780:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 783:	8b 45 f4             	mov    -0xc(%ebp),%eax
 786:	8b 40 04             	mov    0x4(%eax),%eax
 789:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 78c:	72 4d                	jb     7db <malloc+0xa6>
      if(p->s.size == nunits)
 78e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 791:	8b 40 04             	mov    0x4(%eax),%eax
 794:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 797:	75 0c                	jne    7a5 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 799:	8b 45 f4             	mov    -0xc(%ebp),%eax
 79c:	8b 10                	mov    (%eax),%edx
 79e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7a1:	89 10                	mov    %edx,(%eax)
 7a3:	eb 26                	jmp    7cb <malloc+0x96>
      else {
        p->s.size -= nunits;
 7a5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7a8:	8b 40 04             	mov    0x4(%eax),%eax
 7ab:	2b 45 ec             	sub    -0x14(%ebp),%eax
 7ae:	89 c2                	mov    %eax,%edx
 7b0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7b3:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 7b6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7b9:	8b 40 04             	mov    0x4(%eax),%eax
 7bc:	c1 e0 03             	shl    $0x3,%eax
 7bf:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 7c2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7c5:	8b 55 ec             	mov    -0x14(%ebp),%edx
 7c8:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 7cb:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7ce:	a3 b0 0a 00 00       	mov    %eax,0xab0
      return (void*)(p + 1);
 7d3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7d6:	83 c0 08             	add    $0x8,%eax
 7d9:	eb 3b                	jmp    816 <malloc+0xe1>
    }
    if(p == freep)
 7db:	a1 b0 0a 00 00       	mov    0xab0,%eax
 7e0:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 7e3:	75 1e                	jne    803 <malloc+0xce>
      if((p = morecore(nunits)) == 0)
 7e5:	83 ec 0c             	sub    $0xc,%esp
 7e8:	ff 75 ec             	pushl  -0x14(%ebp)
 7eb:	e8 e5 fe ff ff       	call   6d5 <morecore>
 7f0:	83 c4 10             	add    $0x10,%esp
 7f3:	89 45 f4             	mov    %eax,-0xc(%ebp)
 7f6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 7fa:	75 07                	jne    803 <malloc+0xce>
        return 0;
 7fc:	b8 00 00 00 00       	mov    $0x0,%eax
 801:	eb 13                	jmp    816 <malloc+0xe1>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 803:	8b 45 f4             	mov    -0xc(%ebp),%eax
 806:	89 45 f0             	mov    %eax,-0x10(%ebp)
 809:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80c:	8b 00                	mov    (%eax),%eax
 80e:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 811:	e9 6d ff ff ff       	jmp    783 <malloc+0x4e>
}
 816:	c9                   	leave  
 817:	c3                   	ret    
