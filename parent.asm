
_parent:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
//parent.c
#include"types.h"
#include"user.h"
int main(void)
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	53                   	push   %ebx
   e:	51                   	push   %ecx
   f:	83 ec 10             	sub    $0x10,%esp
int ChildPid=fork();
  12:	e8 b6 02 00 00       	call   2cd <fork>
  17:	89 45 f4             	mov    %eax,-0xc(%ebp)
if(ChildPid<0)
  1a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1e:	79 17                	jns    37 <main+0x37>
	printf(1,"Fork failed %d\n",ChildPid);
  20:	83 ec 04             	sub    $0x4,%esp
  23:	ff 75 f4             	pushl  -0xc(%ebp)
  26:	68 24 08 00 00       	push   $0x824
  2b:	6a 01                	push   $0x1
  2d:	e8 3a 04 00 00       	call   46c <printf>
  32:	83 c4 10             	add    $0x10,%esp
  35:	eb 42                	jmp    79 <main+0x79>
else if(ChildPid >0)
  37:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  3b:	7e 1f                	jle    5c <main+0x5c>
{
 	printf(1,"I am the parent.My pid is %d, Child id is %d\n",getpid(),ChildPid);
  3d:	e8 13 03 00 00       	call   355 <getpid>
  42:	ff 75 f4             	pushl  -0xc(%ebp)
  45:	50                   	push   %eax
  46:	68 34 08 00 00       	push   $0x834
  4b:	6a 01                	push   $0x1
  4d:	e8 1a 04 00 00       	call   46c <printf>
  52:	83 c4 10             	add    $0x10,%esp
	wait();
  55:	e8 83 02 00 00       	call   2dd <wait>
  5a:	eb 1d                	jmp    79 <main+0x79>
}
else
{
	printf(1,"I am the child. My pid is %d, My parent id is %d\n",getpid(),getppid());
  5c:	e8 fc 02 00 00       	call   35d <getppid>
  61:	89 c3                	mov    %eax,%ebx
  63:	e8 ed 02 00 00       	call   355 <getpid>
  68:	53                   	push   %ebx
  69:	50                   	push   %eax
  6a:	68 64 08 00 00       	push   $0x864
  6f:	6a 01                	push   $0x1
  71:	e8 f6 03 00 00       	call   46c <printf>
  76:	83 c4 10             	add    $0x10,%esp
}
exit();
  79:	e8 57 02 00 00       	call   2d5 <exit>

0000007e <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  7e:	55                   	push   %ebp
  7f:	89 e5                	mov    %esp,%ebp
  81:	57                   	push   %edi
  82:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  83:	8b 4d 08             	mov    0x8(%ebp),%ecx
  86:	8b 55 10             	mov    0x10(%ebp),%edx
  89:	8b 45 0c             	mov    0xc(%ebp),%eax
  8c:	89 cb                	mov    %ecx,%ebx
  8e:	89 df                	mov    %ebx,%edi
  90:	89 d1                	mov    %edx,%ecx
  92:	fc                   	cld    
  93:	f3 aa                	rep stos %al,%es:(%edi)
  95:	89 ca                	mov    %ecx,%edx
  97:	89 fb                	mov    %edi,%ebx
  99:	89 5d 08             	mov    %ebx,0x8(%ebp)
  9c:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  9f:	90                   	nop
  a0:	5b                   	pop    %ebx
  a1:	5f                   	pop    %edi
  a2:	5d                   	pop    %ebp
  a3:	c3                   	ret    

000000a4 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  a4:	55                   	push   %ebp
  a5:	89 e5                	mov    %esp,%ebp
  a7:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  aa:	8b 45 08             	mov    0x8(%ebp),%eax
  ad:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  b0:	90                   	nop
  b1:	8b 45 08             	mov    0x8(%ebp),%eax
  b4:	8d 50 01             	lea    0x1(%eax),%edx
  b7:	89 55 08             	mov    %edx,0x8(%ebp)
  ba:	8b 55 0c             	mov    0xc(%ebp),%edx
  bd:	8d 4a 01             	lea    0x1(%edx),%ecx
  c0:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  c3:	0f b6 12             	movzbl (%edx),%edx
  c6:	88 10                	mov    %dl,(%eax)
  c8:	0f b6 00             	movzbl (%eax),%eax
  cb:	84 c0                	test   %al,%al
  cd:	75 e2                	jne    b1 <strcpy+0xd>
    ;
  return os;
  cf:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  d2:	c9                   	leave  
  d3:	c3                   	ret    

000000d4 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  d4:	55                   	push   %ebp
  d5:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  d7:	eb 08                	jmp    e1 <strcmp+0xd>
    p++, q++;
  d9:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  dd:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  e1:	8b 45 08             	mov    0x8(%ebp),%eax
  e4:	0f b6 00             	movzbl (%eax),%eax
  e7:	84 c0                	test   %al,%al
  e9:	74 10                	je     fb <strcmp+0x27>
  eb:	8b 45 08             	mov    0x8(%ebp),%eax
  ee:	0f b6 10             	movzbl (%eax),%edx
  f1:	8b 45 0c             	mov    0xc(%ebp),%eax
  f4:	0f b6 00             	movzbl (%eax),%eax
  f7:	38 c2                	cmp    %al,%dl
  f9:	74 de                	je     d9 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
  fb:	8b 45 08             	mov    0x8(%ebp),%eax
  fe:	0f b6 00             	movzbl (%eax),%eax
 101:	0f b6 d0             	movzbl %al,%edx
 104:	8b 45 0c             	mov    0xc(%ebp),%eax
 107:	0f b6 00             	movzbl (%eax),%eax
 10a:	0f b6 c0             	movzbl %al,%eax
 10d:	29 c2                	sub    %eax,%edx
 10f:	89 d0                	mov    %edx,%eax
}
 111:	5d                   	pop    %ebp
 112:	c3                   	ret    

00000113 <strlen>:

uint
strlen(char *s)
{
 113:	55                   	push   %ebp
 114:	89 e5                	mov    %esp,%ebp
 116:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 119:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 120:	eb 04                	jmp    126 <strlen+0x13>
 122:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 126:	8b 55 fc             	mov    -0x4(%ebp),%edx
 129:	8b 45 08             	mov    0x8(%ebp),%eax
 12c:	01 d0                	add    %edx,%eax
 12e:	0f b6 00             	movzbl (%eax),%eax
 131:	84 c0                	test   %al,%al
 133:	75 ed                	jne    122 <strlen+0xf>
    ;
  return n;
 135:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 138:	c9                   	leave  
 139:	c3                   	ret    

0000013a <memset>:

void*
memset(void *dst, int c, uint n)
{
 13a:	55                   	push   %ebp
 13b:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
 13d:	8b 45 10             	mov    0x10(%ebp),%eax
 140:	50                   	push   %eax
 141:	ff 75 0c             	pushl  0xc(%ebp)
 144:	ff 75 08             	pushl  0x8(%ebp)
 147:	e8 32 ff ff ff       	call   7e <stosb>
 14c:	83 c4 0c             	add    $0xc,%esp
  return dst;
 14f:	8b 45 08             	mov    0x8(%ebp),%eax
}
 152:	c9                   	leave  
 153:	c3                   	ret    

00000154 <strchr>:

char*
strchr(const char *s, char c)
{
 154:	55                   	push   %ebp
 155:	89 e5                	mov    %esp,%ebp
 157:	83 ec 04             	sub    $0x4,%esp
 15a:	8b 45 0c             	mov    0xc(%ebp),%eax
 15d:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 160:	eb 14                	jmp    176 <strchr+0x22>
    if(*s == c)
 162:	8b 45 08             	mov    0x8(%ebp),%eax
 165:	0f b6 00             	movzbl (%eax),%eax
 168:	3a 45 fc             	cmp    -0x4(%ebp),%al
 16b:	75 05                	jne    172 <strchr+0x1e>
      return (char*)s;
 16d:	8b 45 08             	mov    0x8(%ebp),%eax
 170:	eb 13                	jmp    185 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 172:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 176:	8b 45 08             	mov    0x8(%ebp),%eax
 179:	0f b6 00             	movzbl (%eax),%eax
 17c:	84 c0                	test   %al,%al
 17e:	75 e2                	jne    162 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 180:	b8 00 00 00 00       	mov    $0x0,%eax
}
 185:	c9                   	leave  
 186:	c3                   	ret    

00000187 <gets>:

char*
gets(char *buf, int max)
{
 187:	55                   	push   %ebp
 188:	89 e5                	mov    %esp,%ebp
 18a:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 18d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 194:	eb 42                	jmp    1d8 <gets+0x51>
    cc = read(0, &c, 1);
 196:	83 ec 04             	sub    $0x4,%esp
 199:	6a 01                	push   $0x1
 19b:	8d 45 ef             	lea    -0x11(%ebp),%eax
 19e:	50                   	push   %eax
 19f:	6a 00                	push   $0x0
 1a1:	e8 47 01 00 00       	call   2ed <read>
 1a6:	83 c4 10             	add    $0x10,%esp
 1a9:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 1ac:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 1b0:	7e 33                	jle    1e5 <gets+0x5e>
      break;
    buf[i++] = c;
 1b2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1b5:	8d 50 01             	lea    0x1(%eax),%edx
 1b8:	89 55 f4             	mov    %edx,-0xc(%ebp)
 1bb:	89 c2                	mov    %eax,%edx
 1bd:	8b 45 08             	mov    0x8(%ebp),%eax
 1c0:	01 c2                	add    %eax,%edx
 1c2:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1c6:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 1c8:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1cc:	3c 0a                	cmp    $0xa,%al
 1ce:	74 16                	je     1e6 <gets+0x5f>
 1d0:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1d4:	3c 0d                	cmp    $0xd,%al
 1d6:	74 0e                	je     1e6 <gets+0x5f>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1db:	83 c0 01             	add    $0x1,%eax
 1de:	3b 45 0c             	cmp    0xc(%ebp),%eax
 1e1:	7c b3                	jl     196 <gets+0xf>
 1e3:	eb 01                	jmp    1e6 <gets+0x5f>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 1e5:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 1e6:	8b 55 f4             	mov    -0xc(%ebp),%edx
 1e9:	8b 45 08             	mov    0x8(%ebp),%eax
 1ec:	01 d0                	add    %edx,%eax
 1ee:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 1f1:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1f4:	c9                   	leave  
 1f5:	c3                   	ret    

000001f6 <stat>:

int
stat(char *n, struct stat *st)
{
 1f6:	55                   	push   %ebp
 1f7:	89 e5                	mov    %esp,%ebp
 1f9:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1fc:	83 ec 08             	sub    $0x8,%esp
 1ff:	6a 00                	push   $0x0
 201:	ff 75 08             	pushl  0x8(%ebp)
 204:	e8 0c 01 00 00       	call   315 <open>
 209:	83 c4 10             	add    $0x10,%esp
 20c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 20f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 213:	79 07                	jns    21c <stat+0x26>
    return -1;
 215:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 21a:	eb 25                	jmp    241 <stat+0x4b>
  r = fstat(fd, st);
 21c:	83 ec 08             	sub    $0x8,%esp
 21f:	ff 75 0c             	pushl  0xc(%ebp)
 222:	ff 75 f4             	pushl  -0xc(%ebp)
 225:	e8 03 01 00 00       	call   32d <fstat>
 22a:	83 c4 10             	add    $0x10,%esp
 22d:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 230:	83 ec 0c             	sub    $0xc,%esp
 233:	ff 75 f4             	pushl  -0xc(%ebp)
 236:	e8 c2 00 00 00       	call   2fd <close>
 23b:	83 c4 10             	add    $0x10,%esp
  return r;
 23e:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 241:	c9                   	leave  
 242:	c3                   	ret    

00000243 <atoi>:

int
atoi(const char *s)
{
 243:	55                   	push   %ebp
 244:	89 e5                	mov    %esp,%ebp
 246:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 249:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 250:	eb 25                	jmp    277 <atoi+0x34>
    n = n*10 + *s++ - '0';
 252:	8b 55 fc             	mov    -0x4(%ebp),%edx
 255:	89 d0                	mov    %edx,%eax
 257:	c1 e0 02             	shl    $0x2,%eax
 25a:	01 d0                	add    %edx,%eax
 25c:	01 c0                	add    %eax,%eax
 25e:	89 c1                	mov    %eax,%ecx
 260:	8b 45 08             	mov    0x8(%ebp),%eax
 263:	8d 50 01             	lea    0x1(%eax),%edx
 266:	89 55 08             	mov    %edx,0x8(%ebp)
 269:	0f b6 00             	movzbl (%eax),%eax
 26c:	0f be c0             	movsbl %al,%eax
 26f:	01 c8                	add    %ecx,%eax
 271:	83 e8 30             	sub    $0x30,%eax
 274:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 277:	8b 45 08             	mov    0x8(%ebp),%eax
 27a:	0f b6 00             	movzbl (%eax),%eax
 27d:	3c 2f                	cmp    $0x2f,%al
 27f:	7e 0a                	jle    28b <atoi+0x48>
 281:	8b 45 08             	mov    0x8(%ebp),%eax
 284:	0f b6 00             	movzbl (%eax),%eax
 287:	3c 39                	cmp    $0x39,%al
 289:	7e c7                	jle    252 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 28b:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 28e:	c9                   	leave  
 28f:	c3                   	ret    

00000290 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 290:	55                   	push   %ebp
 291:	89 e5                	mov    %esp,%ebp
 293:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 296:	8b 45 08             	mov    0x8(%ebp),%eax
 299:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 29c:	8b 45 0c             	mov    0xc(%ebp),%eax
 29f:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 2a2:	eb 17                	jmp    2bb <memmove+0x2b>
    *dst++ = *src++;
 2a4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 2a7:	8d 50 01             	lea    0x1(%eax),%edx
 2aa:	89 55 fc             	mov    %edx,-0x4(%ebp)
 2ad:	8b 55 f8             	mov    -0x8(%ebp),%edx
 2b0:	8d 4a 01             	lea    0x1(%edx),%ecx
 2b3:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 2b6:	0f b6 12             	movzbl (%edx),%edx
 2b9:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2bb:	8b 45 10             	mov    0x10(%ebp),%eax
 2be:	8d 50 ff             	lea    -0x1(%eax),%edx
 2c1:	89 55 10             	mov    %edx,0x10(%ebp)
 2c4:	85 c0                	test   %eax,%eax
 2c6:	7f dc                	jg     2a4 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 2c8:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2cb:	c9                   	leave  
 2cc:	c3                   	ret    

000002cd <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2cd:	b8 01 00 00 00       	mov    $0x1,%eax
 2d2:	cd 40                	int    $0x40
 2d4:	c3                   	ret    

000002d5 <exit>:
SYSCALL(exit)
 2d5:	b8 02 00 00 00       	mov    $0x2,%eax
 2da:	cd 40                	int    $0x40
 2dc:	c3                   	ret    

000002dd <wait>:
SYSCALL(wait)
 2dd:	b8 03 00 00 00       	mov    $0x3,%eax
 2e2:	cd 40                	int    $0x40
 2e4:	c3                   	ret    

000002e5 <pipe>:
SYSCALL(pipe)
 2e5:	b8 04 00 00 00       	mov    $0x4,%eax
 2ea:	cd 40                	int    $0x40
 2ec:	c3                   	ret    

000002ed <read>:
SYSCALL(read)
 2ed:	b8 05 00 00 00       	mov    $0x5,%eax
 2f2:	cd 40                	int    $0x40
 2f4:	c3                   	ret    

000002f5 <write>:
SYSCALL(write)
 2f5:	b8 10 00 00 00       	mov    $0x10,%eax
 2fa:	cd 40                	int    $0x40
 2fc:	c3                   	ret    

000002fd <close>:
SYSCALL(close)
 2fd:	b8 15 00 00 00       	mov    $0x15,%eax
 302:	cd 40                	int    $0x40
 304:	c3                   	ret    

00000305 <kill>:
SYSCALL(kill)
 305:	b8 06 00 00 00       	mov    $0x6,%eax
 30a:	cd 40                	int    $0x40
 30c:	c3                   	ret    

0000030d <exec>:
SYSCALL(exec)
 30d:	b8 07 00 00 00       	mov    $0x7,%eax
 312:	cd 40                	int    $0x40
 314:	c3                   	ret    

00000315 <open>:
SYSCALL(open)
 315:	b8 0f 00 00 00       	mov    $0xf,%eax
 31a:	cd 40                	int    $0x40
 31c:	c3                   	ret    

0000031d <mknod>:
SYSCALL(mknod)
 31d:	b8 11 00 00 00       	mov    $0x11,%eax
 322:	cd 40                	int    $0x40
 324:	c3                   	ret    

00000325 <unlink>:
SYSCALL(unlink)
 325:	b8 12 00 00 00       	mov    $0x12,%eax
 32a:	cd 40                	int    $0x40
 32c:	c3                   	ret    

0000032d <fstat>:
SYSCALL(fstat)
 32d:	b8 08 00 00 00       	mov    $0x8,%eax
 332:	cd 40                	int    $0x40
 334:	c3                   	ret    

00000335 <link>:
SYSCALL(link)
 335:	b8 13 00 00 00       	mov    $0x13,%eax
 33a:	cd 40                	int    $0x40
 33c:	c3                   	ret    

0000033d <mkdir>:
SYSCALL(mkdir)
 33d:	b8 14 00 00 00       	mov    $0x14,%eax
 342:	cd 40                	int    $0x40
 344:	c3                   	ret    

00000345 <chdir>:
SYSCALL(chdir)
 345:	b8 09 00 00 00       	mov    $0x9,%eax
 34a:	cd 40                	int    $0x40
 34c:	c3                   	ret    

0000034d <dup>:
SYSCALL(dup)
 34d:	b8 0a 00 00 00       	mov    $0xa,%eax
 352:	cd 40                	int    $0x40
 354:	c3                   	ret    

00000355 <getpid>:
SYSCALL(getpid)
 355:	b8 0b 00 00 00       	mov    $0xb,%eax
 35a:	cd 40                	int    $0x40
 35c:	c3                   	ret    

0000035d <getppid>:
SYSCALL(getppid)
 35d:	b8 18 00 00 00       	mov    $0x18,%eax
 362:	cd 40                	int    $0x40
 364:	c3                   	ret    

00000365 <getsyscallinfo>:
SYSCALL(getsyscallinfo)
 365:	b8 19 00 00 00       	mov    $0x19,%eax
 36a:	cd 40                	int    $0x40
 36c:	c3                   	ret    

0000036d <getAllPids>:
SYSCALL(getAllPids)
 36d:	b8 16 00 00 00       	mov    $0x16,%eax
 372:	cd 40                	int    $0x40
 374:	c3                   	ret    

00000375 <shutdown>:
SYSCALL(shutdown)
 375:	b8 17 00 00 00       	mov    $0x17,%eax
 37a:	cd 40                	int    $0x40
 37c:	c3                   	ret    

0000037d <sbrk>:
SYSCALL(sbrk)
 37d:	b8 0c 00 00 00       	mov    $0xc,%eax
 382:	cd 40                	int    $0x40
 384:	c3                   	ret    

00000385 <sleep>:
SYSCALL(sleep)
 385:	b8 0d 00 00 00       	mov    $0xd,%eax
 38a:	cd 40                	int    $0x40
 38c:	c3                   	ret    

0000038d <uptime>:
SYSCALL(uptime)
 38d:	b8 0e 00 00 00       	mov    $0xe,%eax
 392:	cd 40                	int    $0x40
 394:	c3                   	ret    

00000395 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 395:	55                   	push   %ebp
 396:	89 e5                	mov    %esp,%ebp
 398:	83 ec 18             	sub    $0x18,%esp
 39b:	8b 45 0c             	mov    0xc(%ebp),%eax
 39e:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 3a1:	83 ec 04             	sub    $0x4,%esp
 3a4:	6a 01                	push   $0x1
 3a6:	8d 45 f4             	lea    -0xc(%ebp),%eax
 3a9:	50                   	push   %eax
 3aa:	ff 75 08             	pushl  0x8(%ebp)
 3ad:	e8 43 ff ff ff       	call   2f5 <write>
 3b2:	83 c4 10             	add    $0x10,%esp
}
 3b5:	90                   	nop
 3b6:	c9                   	leave  
 3b7:	c3                   	ret    

000003b8 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 3b8:	55                   	push   %ebp
 3b9:	89 e5                	mov    %esp,%ebp
 3bb:	53                   	push   %ebx
 3bc:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 3bf:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 3c6:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 3ca:	74 17                	je     3e3 <printint+0x2b>
 3cc:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 3d0:	79 11                	jns    3e3 <printint+0x2b>
    neg = 1;
 3d2:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 3d9:	8b 45 0c             	mov    0xc(%ebp),%eax
 3dc:	f7 d8                	neg    %eax
 3de:	89 45 ec             	mov    %eax,-0x14(%ebp)
 3e1:	eb 06                	jmp    3e9 <printint+0x31>
  } else {
    x = xx;
 3e3:	8b 45 0c             	mov    0xc(%ebp),%eax
 3e6:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 3e9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 3f0:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 3f3:	8d 41 01             	lea    0x1(%ecx),%eax
 3f6:	89 45 f4             	mov    %eax,-0xc(%ebp)
 3f9:	8b 5d 10             	mov    0x10(%ebp),%ebx
 3fc:	8b 45 ec             	mov    -0x14(%ebp),%eax
 3ff:	ba 00 00 00 00       	mov    $0x0,%edx
 404:	f7 f3                	div    %ebx
 406:	89 d0                	mov    %edx,%eax
 408:	0f b6 80 ec 0a 00 00 	movzbl 0xaec(%eax),%eax
 40f:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 413:	8b 5d 10             	mov    0x10(%ebp),%ebx
 416:	8b 45 ec             	mov    -0x14(%ebp),%eax
 419:	ba 00 00 00 00       	mov    $0x0,%edx
 41e:	f7 f3                	div    %ebx
 420:	89 45 ec             	mov    %eax,-0x14(%ebp)
 423:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 427:	75 c7                	jne    3f0 <printint+0x38>
  if(neg)
 429:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 42d:	74 2d                	je     45c <printint+0xa4>
    buf[i++] = '-';
 42f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 432:	8d 50 01             	lea    0x1(%eax),%edx
 435:	89 55 f4             	mov    %edx,-0xc(%ebp)
 438:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 43d:	eb 1d                	jmp    45c <printint+0xa4>
    putc(fd, buf[i]);
 43f:	8d 55 dc             	lea    -0x24(%ebp),%edx
 442:	8b 45 f4             	mov    -0xc(%ebp),%eax
 445:	01 d0                	add    %edx,%eax
 447:	0f b6 00             	movzbl (%eax),%eax
 44a:	0f be c0             	movsbl %al,%eax
 44d:	83 ec 08             	sub    $0x8,%esp
 450:	50                   	push   %eax
 451:	ff 75 08             	pushl  0x8(%ebp)
 454:	e8 3c ff ff ff       	call   395 <putc>
 459:	83 c4 10             	add    $0x10,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 45c:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 460:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 464:	79 d9                	jns    43f <printint+0x87>
    putc(fd, buf[i]);
}
 466:	90                   	nop
 467:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 46a:	c9                   	leave  
 46b:	c3                   	ret    

0000046c <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 46c:	55                   	push   %ebp
 46d:	89 e5                	mov    %esp,%ebp
 46f:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 472:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 479:	8d 45 0c             	lea    0xc(%ebp),%eax
 47c:	83 c0 04             	add    $0x4,%eax
 47f:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 482:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 489:	e9 59 01 00 00       	jmp    5e7 <printf+0x17b>
    c = fmt[i] & 0xff;
 48e:	8b 55 0c             	mov    0xc(%ebp),%edx
 491:	8b 45 f0             	mov    -0x10(%ebp),%eax
 494:	01 d0                	add    %edx,%eax
 496:	0f b6 00             	movzbl (%eax),%eax
 499:	0f be c0             	movsbl %al,%eax
 49c:	25 ff 00 00 00       	and    $0xff,%eax
 4a1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 4a4:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 4a8:	75 2c                	jne    4d6 <printf+0x6a>
      if(c == '%'){
 4aa:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 4ae:	75 0c                	jne    4bc <printf+0x50>
        state = '%';
 4b0:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 4b7:	e9 27 01 00 00       	jmp    5e3 <printf+0x177>
      } else {
        putc(fd, c);
 4bc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 4bf:	0f be c0             	movsbl %al,%eax
 4c2:	83 ec 08             	sub    $0x8,%esp
 4c5:	50                   	push   %eax
 4c6:	ff 75 08             	pushl  0x8(%ebp)
 4c9:	e8 c7 fe ff ff       	call   395 <putc>
 4ce:	83 c4 10             	add    $0x10,%esp
 4d1:	e9 0d 01 00 00       	jmp    5e3 <printf+0x177>
      }
    } else if(state == '%'){
 4d6:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 4da:	0f 85 03 01 00 00    	jne    5e3 <printf+0x177>
      if(c == 'd'){
 4e0:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 4e4:	75 1e                	jne    504 <printf+0x98>
        printint(fd, *ap, 10, 1);
 4e6:	8b 45 e8             	mov    -0x18(%ebp),%eax
 4e9:	8b 00                	mov    (%eax),%eax
 4eb:	6a 01                	push   $0x1
 4ed:	6a 0a                	push   $0xa
 4ef:	50                   	push   %eax
 4f0:	ff 75 08             	pushl  0x8(%ebp)
 4f3:	e8 c0 fe ff ff       	call   3b8 <printint>
 4f8:	83 c4 10             	add    $0x10,%esp
        ap++;
 4fb:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 4ff:	e9 d8 00 00 00       	jmp    5dc <printf+0x170>
      } else if(c == 'x' || c == 'p'){
 504:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 508:	74 06                	je     510 <printf+0xa4>
 50a:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 50e:	75 1e                	jne    52e <printf+0xc2>
        printint(fd, *ap, 16, 0);
 510:	8b 45 e8             	mov    -0x18(%ebp),%eax
 513:	8b 00                	mov    (%eax),%eax
 515:	6a 00                	push   $0x0
 517:	6a 10                	push   $0x10
 519:	50                   	push   %eax
 51a:	ff 75 08             	pushl  0x8(%ebp)
 51d:	e8 96 fe ff ff       	call   3b8 <printint>
 522:	83 c4 10             	add    $0x10,%esp
        ap++;
 525:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 529:	e9 ae 00 00 00       	jmp    5dc <printf+0x170>
      } else if(c == 's'){
 52e:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 532:	75 43                	jne    577 <printf+0x10b>
        s = (char*)*ap;
 534:	8b 45 e8             	mov    -0x18(%ebp),%eax
 537:	8b 00                	mov    (%eax),%eax
 539:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 53c:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 540:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 544:	75 25                	jne    56b <printf+0xff>
          s = "(null)";
 546:	c7 45 f4 96 08 00 00 	movl   $0x896,-0xc(%ebp)
        while(*s != 0){
 54d:	eb 1c                	jmp    56b <printf+0xff>
          putc(fd, *s);
 54f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 552:	0f b6 00             	movzbl (%eax),%eax
 555:	0f be c0             	movsbl %al,%eax
 558:	83 ec 08             	sub    $0x8,%esp
 55b:	50                   	push   %eax
 55c:	ff 75 08             	pushl  0x8(%ebp)
 55f:	e8 31 fe ff ff       	call   395 <putc>
 564:	83 c4 10             	add    $0x10,%esp
          s++;
 567:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 56b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 56e:	0f b6 00             	movzbl (%eax),%eax
 571:	84 c0                	test   %al,%al
 573:	75 da                	jne    54f <printf+0xe3>
 575:	eb 65                	jmp    5dc <printf+0x170>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 577:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 57b:	75 1d                	jne    59a <printf+0x12e>
        putc(fd, *ap);
 57d:	8b 45 e8             	mov    -0x18(%ebp),%eax
 580:	8b 00                	mov    (%eax),%eax
 582:	0f be c0             	movsbl %al,%eax
 585:	83 ec 08             	sub    $0x8,%esp
 588:	50                   	push   %eax
 589:	ff 75 08             	pushl  0x8(%ebp)
 58c:	e8 04 fe ff ff       	call   395 <putc>
 591:	83 c4 10             	add    $0x10,%esp
        ap++;
 594:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 598:	eb 42                	jmp    5dc <printf+0x170>
      } else if(c == '%'){
 59a:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 59e:	75 17                	jne    5b7 <printf+0x14b>
        putc(fd, c);
 5a0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5a3:	0f be c0             	movsbl %al,%eax
 5a6:	83 ec 08             	sub    $0x8,%esp
 5a9:	50                   	push   %eax
 5aa:	ff 75 08             	pushl  0x8(%ebp)
 5ad:	e8 e3 fd ff ff       	call   395 <putc>
 5b2:	83 c4 10             	add    $0x10,%esp
 5b5:	eb 25                	jmp    5dc <printf+0x170>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 5b7:	83 ec 08             	sub    $0x8,%esp
 5ba:	6a 25                	push   $0x25
 5bc:	ff 75 08             	pushl  0x8(%ebp)
 5bf:	e8 d1 fd ff ff       	call   395 <putc>
 5c4:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
 5c7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5ca:	0f be c0             	movsbl %al,%eax
 5cd:	83 ec 08             	sub    $0x8,%esp
 5d0:	50                   	push   %eax
 5d1:	ff 75 08             	pushl  0x8(%ebp)
 5d4:	e8 bc fd ff ff       	call   395 <putc>
 5d9:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 5dc:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 5e3:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 5e7:	8b 55 0c             	mov    0xc(%ebp),%edx
 5ea:	8b 45 f0             	mov    -0x10(%ebp),%eax
 5ed:	01 d0                	add    %edx,%eax
 5ef:	0f b6 00             	movzbl (%eax),%eax
 5f2:	84 c0                	test   %al,%al
 5f4:	0f 85 94 fe ff ff    	jne    48e <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 5fa:	90                   	nop
 5fb:	c9                   	leave  
 5fc:	c3                   	ret    

000005fd <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 5fd:	55                   	push   %ebp
 5fe:	89 e5                	mov    %esp,%ebp
 600:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 603:	8b 45 08             	mov    0x8(%ebp),%eax
 606:	83 e8 08             	sub    $0x8,%eax
 609:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 60c:	a1 08 0b 00 00       	mov    0xb08,%eax
 611:	89 45 fc             	mov    %eax,-0x4(%ebp)
 614:	eb 24                	jmp    63a <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 616:	8b 45 fc             	mov    -0x4(%ebp),%eax
 619:	8b 00                	mov    (%eax),%eax
 61b:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 61e:	77 12                	ja     632 <free+0x35>
 620:	8b 45 f8             	mov    -0x8(%ebp),%eax
 623:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 626:	77 24                	ja     64c <free+0x4f>
 628:	8b 45 fc             	mov    -0x4(%ebp),%eax
 62b:	8b 00                	mov    (%eax),%eax
 62d:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 630:	77 1a                	ja     64c <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 632:	8b 45 fc             	mov    -0x4(%ebp),%eax
 635:	8b 00                	mov    (%eax),%eax
 637:	89 45 fc             	mov    %eax,-0x4(%ebp)
 63a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 63d:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 640:	76 d4                	jbe    616 <free+0x19>
 642:	8b 45 fc             	mov    -0x4(%ebp),%eax
 645:	8b 00                	mov    (%eax),%eax
 647:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 64a:	76 ca                	jbe    616 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 64c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 64f:	8b 40 04             	mov    0x4(%eax),%eax
 652:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 659:	8b 45 f8             	mov    -0x8(%ebp),%eax
 65c:	01 c2                	add    %eax,%edx
 65e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 661:	8b 00                	mov    (%eax),%eax
 663:	39 c2                	cmp    %eax,%edx
 665:	75 24                	jne    68b <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 667:	8b 45 f8             	mov    -0x8(%ebp),%eax
 66a:	8b 50 04             	mov    0x4(%eax),%edx
 66d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 670:	8b 00                	mov    (%eax),%eax
 672:	8b 40 04             	mov    0x4(%eax),%eax
 675:	01 c2                	add    %eax,%edx
 677:	8b 45 f8             	mov    -0x8(%ebp),%eax
 67a:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 67d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 680:	8b 00                	mov    (%eax),%eax
 682:	8b 10                	mov    (%eax),%edx
 684:	8b 45 f8             	mov    -0x8(%ebp),%eax
 687:	89 10                	mov    %edx,(%eax)
 689:	eb 0a                	jmp    695 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 68b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 68e:	8b 10                	mov    (%eax),%edx
 690:	8b 45 f8             	mov    -0x8(%ebp),%eax
 693:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 695:	8b 45 fc             	mov    -0x4(%ebp),%eax
 698:	8b 40 04             	mov    0x4(%eax),%eax
 69b:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 6a2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6a5:	01 d0                	add    %edx,%eax
 6a7:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 6aa:	75 20                	jne    6cc <free+0xcf>
    p->s.size += bp->s.size;
 6ac:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6af:	8b 50 04             	mov    0x4(%eax),%edx
 6b2:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6b5:	8b 40 04             	mov    0x4(%eax),%eax
 6b8:	01 c2                	add    %eax,%edx
 6ba:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6bd:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 6c0:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6c3:	8b 10                	mov    (%eax),%edx
 6c5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6c8:	89 10                	mov    %edx,(%eax)
 6ca:	eb 08                	jmp    6d4 <free+0xd7>
  } else
    p->s.ptr = bp;
 6cc:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6cf:	8b 55 f8             	mov    -0x8(%ebp),%edx
 6d2:	89 10                	mov    %edx,(%eax)
  freep = p;
 6d4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6d7:	a3 08 0b 00 00       	mov    %eax,0xb08
}
 6dc:	90                   	nop
 6dd:	c9                   	leave  
 6de:	c3                   	ret    

000006df <morecore>:

static Header*
morecore(uint nu)
{
 6df:	55                   	push   %ebp
 6e0:	89 e5                	mov    %esp,%ebp
 6e2:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 6e5:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 6ec:	77 07                	ja     6f5 <morecore+0x16>
    nu = 4096;
 6ee:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 6f5:	8b 45 08             	mov    0x8(%ebp),%eax
 6f8:	c1 e0 03             	shl    $0x3,%eax
 6fb:	83 ec 0c             	sub    $0xc,%esp
 6fe:	50                   	push   %eax
 6ff:	e8 79 fc ff ff       	call   37d <sbrk>
 704:	83 c4 10             	add    $0x10,%esp
 707:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 70a:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 70e:	75 07                	jne    717 <morecore+0x38>
    return 0;
 710:	b8 00 00 00 00       	mov    $0x0,%eax
 715:	eb 26                	jmp    73d <morecore+0x5e>
  hp = (Header*)p;
 717:	8b 45 f4             	mov    -0xc(%ebp),%eax
 71a:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 71d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 720:	8b 55 08             	mov    0x8(%ebp),%edx
 723:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 726:	8b 45 f0             	mov    -0x10(%ebp),%eax
 729:	83 c0 08             	add    $0x8,%eax
 72c:	83 ec 0c             	sub    $0xc,%esp
 72f:	50                   	push   %eax
 730:	e8 c8 fe ff ff       	call   5fd <free>
 735:	83 c4 10             	add    $0x10,%esp
  return freep;
 738:	a1 08 0b 00 00       	mov    0xb08,%eax
}
 73d:	c9                   	leave  
 73e:	c3                   	ret    

0000073f <malloc>:

void*
malloc(uint nbytes)
{
 73f:	55                   	push   %ebp
 740:	89 e5                	mov    %esp,%ebp
 742:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 745:	8b 45 08             	mov    0x8(%ebp),%eax
 748:	83 c0 07             	add    $0x7,%eax
 74b:	c1 e8 03             	shr    $0x3,%eax
 74e:	83 c0 01             	add    $0x1,%eax
 751:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 754:	a1 08 0b 00 00       	mov    0xb08,%eax
 759:	89 45 f0             	mov    %eax,-0x10(%ebp)
 75c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 760:	75 23                	jne    785 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 762:	c7 45 f0 00 0b 00 00 	movl   $0xb00,-0x10(%ebp)
 769:	8b 45 f0             	mov    -0x10(%ebp),%eax
 76c:	a3 08 0b 00 00       	mov    %eax,0xb08
 771:	a1 08 0b 00 00       	mov    0xb08,%eax
 776:	a3 00 0b 00 00       	mov    %eax,0xb00
    base.s.size = 0;
 77b:	c7 05 04 0b 00 00 00 	movl   $0x0,0xb04
 782:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 785:	8b 45 f0             	mov    -0x10(%ebp),%eax
 788:	8b 00                	mov    (%eax),%eax
 78a:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 78d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 790:	8b 40 04             	mov    0x4(%eax),%eax
 793:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 796:	72 4d                	jb     7e5 <malloc+0xa6>
      if(p->s.size == nunits)
 798:	8b 45 f4             	mov    -0xc(%ebp),%eax
 79b:	8b 40 04             	mov    0x4(%eax),%eax
 79e:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 7a1:	75 0c                	jne    7af <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 7a3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7a6:	8b 10                	mov    (%eax),%edx
 7a8:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7ab:	89 10                	mov    %edx,(%eax)
 7ad:	eb 26                	jmp    7d5 <malloc+0x96>
      else {
        p->s.size -= nunits;
 7af:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7b2:	8b 40 04             	mov    0x4(%eax),%eax
 7b5:	2b 45 ec             	sub    -0x14(%ebp),%eax
 7b8:	89 c2                	mov    %eax,%edx
 7ba:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7bd:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 7c0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7c3:	8b 40 04             	mov    0x4(%eax),%eax
 7c6:	c1 e0 03             	shl    $0x3,%eax
 7c9:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 7cc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7cf:	8b 55 ec             	mov    -0x14(%ebp),%edx
 7d2:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 7d5:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7d8:	a3 08 0b 00 00       	mov    %eax,0xb08
      return (void*)(p + 1);
 7dd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7e0:	83 c0 08             	add    $0x8,%eax
 7e3:	eb 3b                	jmp    820 <malloc+0xe1>
    }
    if(p == freep)
 7e5:	a1 08 0b 00 00       	mov    0xb08,%eax
 7ea:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 7ed:	75 1e                	jne    80d <malloc+0xce>
      if((p = morecore(nunits)) == 0)
 7ef:	83 ec 0c             	sub    $0xc,%esp
 7f2:	ff 75 ec             	pushl  -0x14(%ebp)
 7f5:	e8 e5 fe ff ff       	call   6df <morecore>
 7fa:	83 c4 10             	add    $0x10,%esp
 7fd:	89 45 f4             	mov    %eax,-0xc(%ebp)
 800:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 804:	75 07                	jne    80d <malloc+0xce>
        return 0;
 806:	b8 00 00 00 00       	mov    $0x0,%eax
 80b:	eb 13                	jmp    820 <malloc+0xe1>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 80d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 810:	89 45 f0             	mov    %eax,-0x10(%ebp)
 813:	8b 45 f4             	mov    -0xc(%ebp),%eax
 816:	8b 00                	mov    (%eax),%eax
 818:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 81b:	e9 6d ff ff ff       	jmp    78d <malloc+0x4e>
}
 820:	c9                   	leave  
 821:	c3                   	ret    
