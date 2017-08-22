
_zombie:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(void)
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	51                   	push   %ecx
   e:	83 ec 04             	sub    $0x4,%esp
  if(fork() > 0)
  11:	e8 65 02 00 00       	call   27b <fork>
  16:	85 c0                	test   %eax,%eax
  18:	7e 0d                	jle    27 <main+0x27>
    sleep(5);  // Let child exit before parent.
  1a:	83 ec 0c             	sub    $0xc,%esp
  1d:	6a 05                	push   $0x5
  1f:	e8 0f 03 00 00       	call   333 <sleep>
  24:	83 c4 10             	add    $0x10,%esp
  exit();
  27:	e8 57 02 00 00       	call   283 <exit>

0000002c <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  2c:	55                   	push   %ebp
  2d:	89 e5                	mov    %esp,%ebp
  2f:	57                   	push   %edi
  30:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  31:	8b 4d 08             	mov    0x8(%ebp),%ecx
  34:	8b 55 10             	mov    0x10(%ebp),%edx
  37:	8b 45 0c             	mov    0xc(%ebp),%eax
  3a:	89 cb                	mov    %ecx,%ebx
  3c:	89 df                	mov    %ebx,%edi
  3e:	89 d1                	mov    %edx,%ecx
  40:	fc                   	cld    
  41:	f3 aa                	rep stos %al,%es:(%edi)
  43:	89 ca                	mov    %ecx,%edx
  45:	89 fb                	mov    %edi,%ebx
  47:	89 5d 08             	mov    %ebx,0x8(%ebp)
  4a:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  4d:	90                   	nop
  4e:	5b                   	pop    %ebx
  4f:	5f                   	pop    %edi
  50:	5d                   	pop    %ebp
  51:	c3                   	ret    

00000052 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  52:	55                   	push   %ebp
  53:	89 e5                	mov    %esp,%ebp
  55:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  58:	8b 45 08             	mov    0x8(%ebp),%eax
  5b:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  5e:	90                   	nop
  5f:	8b 45 08             	mov    0x8(%ebp),%eax
  62:	8d 50 01             	lea    0x1(%eax),%edx
  65:	89 55 08             	mov    %edx,0x8(%ebp)
  68:	8b 55 0c             	mov    0xc(%ebp),%edx
  6b:	8d 4a 01             	lea    0x1(%edx),%ecx
  6e:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  71:	0f b6 12             	movzbl (%edx),%edx
  74:	88 10                	mov    %dl,(%eax)
  76:	0f b6 00             	movzbl (%eax),%eax
  79:	84 c0                	test   %al,%al
  7b:	75 e2                	jne    5f <strcpy+0xd>
    ;
  return os;
  7d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  80:	c9                   	leave  
  81:	c3                   	ret    

00000082 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  82:	55                   	push   %ebp
  83:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  85:	eb 08                	jmp    8f <strcmp+0xd>
    p++, q++;
  87:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  8b:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  8f:	8b 45 08             	mov    0x8(%ebp),%eax
  92:	0f b6 00             	movzbl (%eax),%eax
  95:	84 c0                	test   %al,%al
  97:	74 10                	je     a9 <strcmp+0x27>
  99:	8b 45 08             	mov    0x8(%ebp),%eax
  9c:	0f b6 10             	movzbl (%eax),%edx
  9f:	8b 45 0c             	mov    0xc(%ebp),%eax
  a2:	0f b6 00             	movzbl (%eax),%eax
  a5:	38 c2                	cmp    %al,%dl
  a7:	74 de                	je     87 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
  a9:	8b 45 08             	mov    0x8(%ebp),%eax
  ac:	0f b6 00             	movzbl (%eax),%eax
  af:	0f b6 d0             	movzbl %al,%edx
  b2:	8b 45 0c             	mov    0xc(%ebp),%eax
  b5:	0f b6 00             	movzbl (%eax),%eax
  b8:	0f b6 c0             	movzbl %al,%eax
  bb:	29 c2                	sub    %eax,%edx
  bd:	89 d0                	mov    %edx,%eax
}
  bf:	5d                   	pop    %ebp
  c0:	c3                   	ret    

000000c1 <strlen>:

uint
strlen(char *s)
{
  c1:	55                   	push   %ebp
  c2:	89 e5                	mov    %esp,%ebp
  c4:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
  c7:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  ce:	eb 04                	jmp    d4 <strlen+0x13>
  d0:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  d4:	8b 55 fc             	mov    -0x4(%ebp),%edx
  d7:	8b 45 08             	mov    0x8(%ebp),%eax
  da:	01 d0                	add    %edx,%eax
  dc:	0f b6 00             	movzbl (%eax),%eax
  df:	84 c0                	test   %al,%al
  e1:	75 ed                	jne    d0 <strlen+0xf>
    ;
  return n;
  e3:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  e6:	c9                   	leave  
  e7:	c3                   	ret    

000000e8 <memset>:

void*
memset(void *dst, int c, uint n)
{
  e8:	55                   	push   %ebp
  e9:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
  eb:	8b 45 10             	mov    0x10(%ebp),%eax
  ee:	50                   	push   %eax
  ef:	ff 75 0c             	pushl  0xc(%ebp)
  f2:	ff 75 08             	pushl  0x8(%ebp)
  f5:	e8 32 ff ff ff       	call   2c <stosb>
  fa:	83 c4 0c             	add    $0xc,%esp
  return dst;
  fd:	8b 45 08             	mov    0x8(%ebp),%eax
}
 100:	c9                   	leave  
 101:	c3                   	ret    

00000102 <strchr>:

char*
strchr(const char *s, char c)
{
 102:	55                   	push   %ebp
 103:	89 e5                	mov    %esp,%ebp
 105:	83 ec 04             	sub    $0x4,%esp
 108:	8b 45 0c             	mov    0xc(%ebp),%eax
 10b:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 10e:	eb 14                	jmp    124 <strchr+0x22>
    if(*s == c)
 110:	8b 45 08             	mov    0x8(%ebp),%eax
 113:	0f b6 00             	movzbl (%eax),%eax
 116:	3a 45 fc             	cmp    -0x4(%ebp),%al
 119:	75 05                	jne    120 <strchr+0x1e>
      return (char*)s;
 11b:	8b 45 08             	mov    0x8(%ebp),%eax
 11e:	eb 13                	jmp    133 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 120:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 124:	8b 45 08             	mov    0x8(%ebp),%eax
 127:	0f b6 00             	movzbl (%eax),%eax
 12a:	84 c0                	test   %al,%al
 12c:	75 e2                	jne    110 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 12e:	b8 00 00 00 00       	mov    $0x0,%eax
}
 133:	c9                   	leave  
 134:	c3                   	ret    

00000135 <gets>:

char*
gets(char *buf, int max)
{
 135:	55                   	push   %ebp
 136:	89 e5                	mov    %esp,%ebp
 138:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 13b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 142:	eb 42                	jmp    186 <gets+0x51>
    cc = read(0, &c, 1);
 144:	83 ec 04             	sub    $0x4,%esp
 147:	6a 01                	push   $0x1
 149:	8d 45 ef             	lea    -0x11(%ebp),%eax
 14c:	50                   	push   %eax
 14d:	6a 00                	push   $0x0
 14f:	e8 47 01 00 00       	call   29b <read>
 154:	83 c4 10             	add    $0x10,%esp
 157:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 15a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 15e:	7e 33                	jle    193 <gets+0x5e>
      break;
    buf[i++] = c;
 160:	8b 45 f4             	mov    -0xc(%ebp),%eax
 163:	8d 50 01             	lea    0x1(%eax),%edx
 166:	89 55 f4             	mov    %edx,-0xc(%ebp)
 169:	89 c2                	mov    %eax,%edx
 16b:	8b 45 08             	mov    0x8(%ebp),%eax
 16e:	01 c2                	add    %eax,%edx
 170:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 174:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 176:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 17a:	3c 0a                	cmp    $0xa,%al
 17c:	74 16                	je     194 <gets+0x5f>
 17e:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 182:	3c 0d                	cmp    $0xd,%al
 184:	74 0e                	je     194 <gets+0x5f>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 186:	8b 45 f4             	mov    -0xc(%ebp),%eax
 189:	83 c0 01             	add    $0x1,%eax
 18c:	3b 45 0c             	cmp    0xc(%ebp),%eax
 18f:	7c b3                	jl     144 <gets+0xf>
 191:	eb 01                	jmp    194 <gets+0x5f>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 193:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 194:	8b 55 f4             	mov    -0xc(%ebp),%edx
 197:	8b 45 08             	mov    0x8(%ebp),%eax
 19a:	01 d0                	add    %edx,%eax
 19c:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 19f:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1a2:	c9                   	leave  
 1a3:	c3                   	ret    

000001a4 <stat>:

int
stat(char *n, struct stat *st)
{
 1a4:	55                   	push   %ebp
 1a5:	89 e5                	mov    %esp,%ebp
 1a7:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1aa:	83 ec 08             	sub    $0x8,%esp
 1ad:	6a 00                	push   $0x0
 1af:	ff 75 08             	pushl  0x8(%ebp)
 1b2:	e8 0c 01 00 00       	call   2c3 <open>
 1b7:	83 c4 10             	add    $0x10,%esp
 1ba:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 1bd:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 1c1:	79 07                	jns    1ca <stat+0x26>
    return -1;
 1c3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 1c8:	eb 25                	jmp    1ef <stat+0x4b>
  r = fstat(fd, st);
 1ca:	83 ec 08             	sub    $0x8,%esp
 1cd:	ff 75 0c             	pushl  0xc(%ebp)
 1d0:	ff 75 f4             	pushl  -0xc(%ebp)
 1d3:	e8 03 01 00 00       	call   2db <fstat>
 1d8:	83 c4 10             	add    $0x10,%esp
 1db:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 1de:	83 ec 0c             	sub    $0xc,%esp
 1e1:	ff 75 f4             	pushl  -0xc(%ebp)
 1e4:	e8 c2 00 00 00       	call   2ab <close>
 1e9:	83 c4 10             	add    $0x10,%esp
  return r;
 1ec:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 1ef:	c9                   	leave  
 1f0:	c3                   	ret    

000001f1 <atoi>:

int
atoi(const char *s)
{
 1f1:	55                   	push   %ebp
 1f2:	89 e5                	mov    %esp,%ebp
 1f4:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 1f7:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 1fe:	eb 25                	jmp    225 <atoi+0x34>
    n = n*10 + *s++ - '0';
 200:	8b 55 fc             	mov    -0x4(%ebp),%edx
 203:	89 d0                	mov    %edx,%eax
 205:	c1 e0 02             	shl    $0x2,%eax
 208:	01 d0                	add    %edx,%eax
 20a:	01 c0                	add    %eax,%eax
 20c:	89 c1                	mov    %eax,%ecx
 20e:	8b 45 08             	mov    0x8(%ebp),%eax
 211:	8d 50 01             	lea    0x1(%eax),%edx
 214:	89 55 08             	mov    %edx,0x8(%ebp)
 217:	0f b6 00             	movzbl (%eax),%eax
 21a:	0f be c0             	movsbl %al,%eax
 21d:	01 c8                	add    %ecx,%eax
 21f:	83 e8 30             	sub    $0x30,%eax
 222:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 225:	8b 45 08             	mov    0x8(%ebp),%eax
 228:	0f b6 00             	movzbl (%eax),%eax
 22b:	3c 2f                	cmp    $0x2f,%al
 22d:	7e 0a                	jle    239 <atoi+0x48>
 22f:	8b 45 08             	mov    0x8(%ebp),%eax
 232:	0f b6 00             	movzbl (%eax),%eax
 235:	3c 39                	cmp    $0x39,%al
 237:	7e c7                	jle    200 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 239:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 23c:	c9                   	leave  
 23d:	c3                   	ret    

0000023e <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 23e:	55                   	push   %ebp
 23f:	89 e5                	mov    %esp,%ebp
 241:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 244:	8b 45 08             	mov    0x8(%ebp),%eax
 247:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 24a:	8b 45 0c             	mov    0xc(%ebp),%eax
 24d:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 250:	eb 17                	jmp    269 <memmove+0x2b>
    *dst++ = *src++;
 252:	8b 45 fc             	mov    -0x4(%ebp),%eax
 255:	8d 50 01             	lea    0x1(%eax),%edx
 258:	89 55 fc             	mov    %edx,-0x4(%ebp)
 25b:	8b 55 f8             	mov    -0x8(%ebp),%edx
 25e:	8d 4a 01             	lea    0x1(%edx),%ecx
 261:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 264:	0f b6 12             	movzbl (%edx),%edx
 267:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 269:	8b 45 10             	mov    0x10(%ebp),%eax
 26c:	8d 50 ff             	lea    -0x1(%eax),%edx
 26f:	89 55 10             	mov    %edx,0x10(%ebp)
 272:	85 c0                	test   %eax,%eax
 274:	7f dc                	jg     252 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 276:	8b 45 08             	mov    0x8(%ebp),%eax
}
 279:	c9                   	leave  
 27a:	c3                   	ret    

0000027b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 27b:	b8 01 00 00 00       	mov    $0x1,%eax
 280:	cd 40                	int    $0x40
 282:	c3                   	ret    

00000283 <exit>:
SYSCALL(exit)
 283:	b8 02 00 00 00       	mov    $0x2,%eax
 288:	cd 40                	int    $0x40
 28a:	c3                   	ret    

0000028b <wait>:
SYSCALL(wait)
 28b:	b8 03 00 00 00       	mov    $0x3,%eax
 290:	cd 40                	int    $0x40
 292:	c3                   	ret    

00000293 <pipe>:
SYSCALL(pipe)
 293:	b8 04 00 00 00       	mov    $0x4,%eax
 298:	cd 40                	int    $0x40
 29a:	c3                   	ret    

0000029b <read>:
SYSCALL(read)
 29b:	b8 05 00 00 00       	mov    $0x5,%eax
 2a0:	cd 40                	int    $0x40
 2a2:	c3                   	ret    

000002a3 <write>:
SYSCALL(write)
 2a3:	b8 10 00 00 00       	mov    $0x10,%eax
 2a8:	cd 40                	int    $0x40
 2aa:	c3                   	ret    

000002ab <close>:
SYSCALL(close)
 2ab:	b8 15 00 00 00       	mov    $0x15,%eax
 2b0:	cd 40                	int    $0x40
 2b2:	c3                   	ret    

000002b3 <kill>:
SYSCALL(kill)
 2b3:	b8 06 00 00 00       	mov    $0x6,%eax
 2b8:	cd 40                	int    $0x40
 2ba:	c3                   	ret    

000002bb <exec>:
SYSCALL(exec)
 2bb:	b8 07 00 00 00       	mov    $0x7,%eax
 2c0:	cd 40                	int    $0x40
 2c2:	c3                   	ret    

000002c3 <open>:
SYSCALL(open)
 2c3:	b8 0f 00 00 00       	mov    $0xf,%eax
 2c8:	cd 40                	int    $0x40
 2ca:	c3                   	ret    

000002cb <mknod>:
SYSCALL(mknod)
 2cb:	b8 11 00 00 00       	mov    $0x11,%eax
 2d0:	cd 40                	int    $0x40
 2d2:	c3                   	ret    

000002d3 <unlink>:
SYSCALL(unlink)
 2d3:	b8 12 00 00 00       	mov    $0x12,%eax
 2d8:	cd 40                	int    $0x40
 2da:	c3                   	ret    

000002db <fstat>:
SYSCALL(fstat)
 2db:	b8 08 00 00 00       	mov    $0x8,%eax
 2e0:	cd 40                	int    $0x40
 2e2:	c3                   	ret    

000002e3 <link>:
SYSCALL(link)
 2e3:	b8 13 00 00 00       	mov    $0x13,%eax
 2e8:	cd 40                	int    $0x40
 2ea:	c3                   	ret    

000002eb <mkdir>:
SYSCALL(mkdir)
 2eb:	b8 14 00 00 00       	mov    $0x14,%eax
 2f0:	cd 40                	int    $0x40
 2f2:	c3                   	ret    

000002f3 <chdir>:
SYSCALL(chdir)
 2f3:	b8 09 00 00 00       	mov    $0x9,%eax
 2f8:	cd 40                	int    $0x40
 2fa:	c3                   	ret    

000002fb <dup>:
SYSCALL(dup)
 2fb:	b8 0a 00 00 00       	mov    $0xa,%eax
 300:	cd 40                	int    $0x40
 302:	c3                   	ret    

00000303 <getpid>:
SYSCALL(getpid)
 303:	b8 0b 00 00 00       	mov    $0xb,%eax
 308:	cd 40                	int    $0x40
 30a:	c3                   	ret    

0000030b <getppid>:
SYSCALL(getppid)
 30b:	b8 18 00 00 00       	mov    $0x18,%eax
 310:	cd 40                	int    $0x40
 312:	c3                   	ret    

00000313 <getsyscallinfo>:
SYSCALL(getsyscallinfo)
 313:	b8 19 00 00 00       	mov    $0x19,%eax
 318:	cd 40                	int    $0x40
 31a:	c3                   	ret    

0000031b <getAllPids>:
SYSCALL(getAllPids)
 31b:	b8 16 00 00 00       	mov    $0x16,%eax
 320:	cd 40                	int    $0x40
 322:	c3                   	ret    

00000323 <shutdown>:
SYSCALL(shutdown)
 323:	b8 17 00 00 00       	mov    $0x17,%eax
 328:	cd 40                	int    $0x40
 32a:	c3                   	ret    

0000032b <sbrk>:
SYSCALL(sbrk)
 32b:	b8 0c 00 00 00       	mov    $0xc,%eax
 330:	cd 40                	int    $0x40
 332:	c3                   	ret    

00000333 <sleep>:
SYSCALL(sleep)
 333:	b8 0d 00 00 00       	mov    $0xd,%eax
 338:	cd 40                	int    $0x40
 33a:	c3                   	ret    

0000033b <uptime>:
SYSCALL(uptime)
 33b:	b8 0e 00 00 00       	mov    $0xe,%eax
 340:	cd 40                	int    $0x40
 342:	c3                   	ret    

00000343 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 343:	55                   	push   %ebp
 344:	89 e5                	mov    %esp,%ebp
 346:	83 ec 18             	sub    $0x18,%esp
 349:	8b 45 0c             	mov    0xc(%ebp),%eax
 34c:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 34f:	83 ec 04             	sub    $0x4,%esp
 352:	6a 01                	push   $0x1
 354:	8d 45 f4             	lea    -0xc(%ebp),%eax
 357:	50                   	push   %eax
 358:	ff 75 08             	pushl  0x8(%ebp)
 35b:	e8 43 ff ff ff       	call   2a3 <write>
 360:	83 c4 10             	add    $0x10,%esp
}
 363:	90                   	nop
 364:	c9                   	leave  
 365:	c3                   	ret    

00000366 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 366:	55                   	push   %ebp
 367:	89 e5                	mov    %esp,%ebp
 369:	53                   	push   %ebx
 36a:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 36d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 374:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 378:	74 17                	je     391 <printint+0x2b>
 37a:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 37e:	79 11                	jns    391 <printint+0x2b>
    neg = 1;
 380:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 387:	8b 45 0c             	mov    0xc(%ebp),%eax
 38a:	f7 d8                	neg    %eax
 38c:	89 45 ec             	mov    %eax,-0x14(%ebp)
 38f:	eb 06                	jmp    397 <printint+0x31>
  } else {
    x = xx;
 391:	8b 45 0c             	mov    0xc(%ebp),%eax
 394:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 397:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 39e:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 3a1:	8d 41 01             	lea    0x1(%ecx),%eax
 3a4:	89 45 f4             	mov    %eax,-0xc(%ebp)
 3a7:	8b 5d 10             	mov    0x10(%ebp),%ebx
 3aa:	8b 45 ec             	mov    -0x14(%ebp),%eax
 3ad:	ba 00 00 00 00       	mov    $0x0,%edx
 3b2:	f7 f3                	div    %ebx
 3b4:	89 d0                	mov    %edx,%eax
 3b6:	0f b6 80 20 0a 00 00 	movzbl 0xa20(%eax),%eax
 3bd:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 3c1:	8b 5d 10             	mov    0x10(%ebp),%ebx
 3c4:	8b 45 ec             	mov    -0x14(%ebp),%eax
 3c7:	ba 00 00 00 00       	mov    $0x0,%edx
 3cc:	f7 f3                	div    %ebx
 3ce:	89 45 ec             	mov    %eax,-0x14(%ebp)
 3d1:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 3d5:	75 c7                	jne    39e <printint+0x38>
  if(neg)
 3d7:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 3db:	74 2d                	je     40a <printint+0xa4>
    buf[i++] = '-';
 3dd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3e0:	8d 50 01             	lea    0x1(%eax),%edx
 3e3:	89 55 f4             	mov    %edx,-0xc(%ebp)
 3e6:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 3eb:	eb 1d                	jmp    40a <printint+0xa4>
    putc(fd, buf[i]);
 3ed:	8d 55 dc             	lea    -0x24(%ebp),%edx
 3f0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3f3:	01 d0                	add    %edx,%eax
 3f5:	0f b6 00             	movzbl (%eax),%eax
 3f8:	0f be c0             	movsbl %al,%eax
 3fb:	83 ec 08             	sub    $0x8,%esp
 3fe:	50                   	push   %eax
 3ff:	ff 75 08             	pushl  0x8(%ebp)
 402:	e8 3c ff ff ff       	call   343 <putc>
 407:	83 c4 10             	add    $0x10,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 40a:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 40e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 412:	79 d9                	jns    3ed <printint+0x87>
    putc(fd, buf[i]);
}
 414:	90                   	nop
 415:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 418:	c9                   	leave  
 419:	c3                   	ret    

0000041a <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 41a:	55                   	push   %ebp
 41b:	89 e5                	mov    %esp,%ebp
 41d:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 420:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 427:	8d 45 0c             	lea    0xc(%ebp),%eax
 42a:	83 c0 04             	add    $0x4,%eax
 42d:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 430:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 437:	e9 59 01 00 00       	jmp    595 <printf+0x17b>
    c = fmt[i] & 0xff;
 43c:	8b 55 0c             	mov    0xc(%ebp),%edx
 43f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 442:	01 d0                	add    %edx,%eax
 444:	0f b6 00             	movzbl (%eax),%eax
 447:	0f be c0             	movsbl %al,%eax
 44a:	25 ff 00 00 00       	and    $0xff,%eax
 44f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 452:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 456:	75 2c                	jne    484 <printf+0x6a>
      if(c == '%'){
 458:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 45c:	75 0c                	jne    46a <printf+0x50>
        state = '%';
 45e:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 465:	e9 27 01 00 00       	jmp    591 <printf+0x177>
      } else {
        putc(fd, c);
 46a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 46d:	0f be c0             	movsbl %al,%eax
 470:	83 ec 08             	sub    $0x8,%esp
 473:	50                   	push   %eax
 474:	ff 75 08             	pushl  0x8(%ebp)
 477:	e8 c7 fe ff ff       	call   343 <putc>
 47c:	83 c4 10             	add    $0x10,%esp
 47f:	e9 0d 01 00 00       	jmp    591 <printf+0x177>
      }
    } else if(state == '%'){
 484:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 488:	0f 85 03 01 00 00    	jne    591 <printf+0x177>
      if(c == 'd'){
 48e:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 492:	75 1e                	jne    4b2 <printf+0x98>
        printint(fd, *ap, 10, 1);
 494:	8b 45 e8             	mov    -0x18(%ebp),%eax
 497:	8b 00                	mov    (%eax),%eax
 499:	6a 01                	push   $0x1
 49b:	6a 0a                	push   $0xa
 49d:	50                   	push   %eax
 49e:	ff 75 08             	pushl  0x8(%ebp)
 4a1:	e8 c0 fe ff ff       	call   366 <printint>
 4a6:	83 c4 10             	add    $0x10,%esp
        ap++;
 4a9:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 4ad:	e9 d8 00 00 00       	jmp    58a <printf+0x170>
      } else if(c == 'x' || c == 'p'){
 4b2:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 4b6:	74 06                	je     4be <printf+0xa4>
 4b8:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 4bc:	75 1e                	jne    4dc <printf+0xc2>
        printint(fd, *ap, 16, 0);
 4be:	8b 45 e8             	mov    -0x18(%ebp),%eax
 4c1:	8b 00                	mov    (%eax),%eax
 4c3:	6a 00                	push   $0x0
 4c5:	6a 10                	push   $0x10
 4c7:	50                   	push   %eax
 4c8:	ff 75 08             	pushl  0x8(%ebp)
 4cb:	e8 96 fe ff ff       	call   366 <printint>
 4d0:	83 c4 10             	add    $0x10,%esp
        ap++;
 4d3:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 4d7:	e9 ae 00 00 00       	jmp    58a <printf+0x170>
      } else if(c == 's'){
 4dc:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 4e0:	75 43                	jne    525 <printf+0x10b>
        s = (char*)*ap;
 4e2:	8b 45 e8             	mov    -0x18(%ebp),%eax
 4e5:	8b 00                	mov    (%eax),%eax
 4e7:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 4ea:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 4ee:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 4f2:	75 25                	jne    519 <printf+0xff>
          s = "(null)";
 4f4:	c7 45 f4 d0 07 00 00 	movl   $0x7d0,-0xc(%ebp)
        while(*s != 0){
 4fb:	eb 1c                	jmp    519 <printf+0xff>
          putc(fd, *s);
 4fd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 500:	0f b6 00             	movzbl (%eax),%eax
 503:	0f be c0             	movsbl %al,%eax
 506:	83 ec 08             	sub    $0x8,%esp
 509:	50                   	push   %eax
 50a:	ff 75 08             	pushl  0x8(%ebp)
 50d:	e8 31 fe ff ff       	call   343 <putc>
 512:	83 c4 10             	add    $0x10,%esp
          s++;
 515:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 519:	8b 45 f4             	mov    -0xc(%ebp),%eax
 51c:	0f b6 00             	movzbl (%eax),%eax
 51f:	84 c0                	test   %al,%al
 521:	75 da                	jne    4fd <printf+0xe3>
 523:	eb 65                	jmp    58a <printf+0x170>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 525:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 529:	75 1d                	jne    548 <printf+0x12e>
        putc(fd, *ap);
 52b:	8b 45 e8             	mov    -0x18(%ebp),%eax
 52e:	8b 00                	mov    (%eax),%eax
 530:	0f be c0             	movsbl %al,%eax
 533:	83 ec 08             	sub    $0x8,%esp
 536:	50                   	push   %eax
 537:	ff 75 08             	pushl  0x8(%ebp)
 53a:	e8 04 fe ff ff       	call   343 <putc>
 53f:	83 c4 10             	add    $0x10,%esp
        ap++;
 542:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 546:	eb 42                	jmp    58a <printf+0x170>
      } else if(c == '%'){
 548:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 54c:	75 17                	jne    565 <printf+0x14b>
        putc(fd, c);
 54e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 551:	0f be c0             	movsbl %al,%eax
 554:	83 ec 08             	sub    $0x8,%esp
 557:	50                   	push   %eax
 558:	ff 75 08             	pushl  0x8(%ebp)
 55b:	e8 e3 fd ff ff       	call   343 <putc>
 560:	83 c4 10             	add    $0x10,%esp
 563:	eb 25                	jmp    58a <printf+0x170>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 565:	83 ec 08             	sub    $0x8,%esp
 568:	6a 25                	push   $0x25
 56a:	ff 75 08             	pushl  0x8(%ebp)
 56d:	e8 d1 fd ff ff       	call   343 <putc>
 572:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
 575:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 578:	0f be c0             	movsbl %al,%eax
 57b:	83 ec 08             	sub    $0x8,%esp
 57e:	50                   	push   %eax
 57f:	ff 75 08             	pushl  0x8(%ebp)
 582:	e8 bc fd ff ff       	call   343 <putc>
 587:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 58a:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 591:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 595:	8b 55 0c             	mov    0xc(%ebp),%edx
 598:	8b 45 f0             	mov    -0x10(%ebp),%eax
 59b:	01 d0                	add    %edx,%eax
 59d:	0f b6 00             	movzbl (%eax),%eax
 5a0:	84 c0                	test   %al,%al
 5a2:	0f 85 94 fe ff ff    	jne    43c <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 5a8:	90                   	nop
 5a9:	c9                   	leave  
 5aa:	c3                   	ret    

000005ab <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 5ab:	55                   	push   %ebp
 5ac:	89 e5                	mov    %esp,%ebp
 5ae:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 5b1:	8b 45 08             	mov    0x8(%ebp),%eax
 5b4:	83 e8 08             	sub    $0x8,%eax
 5b7:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5ba:	a1 3c 0a 00 00       	mov    0xa3c,%eax
 5bf:	89 45 fc             	mov    %eax,-0x4(%ebp)
 5c2:	eb 24                	jmp    5e8 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5c4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 5c7:	8b 00                	mov    (%eax),%eax
 5c9:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 5cc:	77 12                	ja     5e0 <free+0x35>
 5ce:	8b 45 f8             	mov    -0x8(%ebp),%eax
 5d1:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 5d4:	77 24                	ja     5fa <free+0x4f>
 5d6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 5d9:	8b 00                	mov    (%eax),%eax
 5db:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 5de:	77 1a                	ja     5fa <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5e0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 5e3:	8b 00                	mov    (%eax),%eax
 5e5:	89 45 fc             	mov    %eax,-0x4(%ebp)
 5e8:	8b 45 f8             	mov    -0x8(%ebp),%eax
 5eb:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 5ee:	76 d4                	jbe    5c4 <free+0x19>
 5f0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 5f3:	8b 00                	mov    (%eax),%eax
 5f5:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 5f8:	76 ca                	jbe    5c4 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 5fa:	8b 45 f8             	mov    -0x8(%ebp),%eax
 5fd:	8b 40 04             	mov    0x4(%eax),%eax
 600:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 607:	8b 45 f8             	mov    -0x8(%ebp),%eax
 60a:	01 c2                	add    %eax,%edx
 60c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 60f:	8b 00                	mov    (%eax),%eax
 611:	39 c2                	cmp    %eax,%edx
 613:	75 24                	jne    639 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 615:	8b 45 f8             	mov    -0x8(%ebp),%eax
 618:	8b 50 04             	mov    0x4(%eax),%edx
 61b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 61e:	8b 00                	mov    (%eax),%eax
 620:	8b 40 04             	mov    0x4(%eax),%eax
 623:	01 c2                	add    %eax,%edx
 625:	8b 45 f8             	mov    -0x8(%ebp),%eax
 628:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 62b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 62e:	8b 00                	mov    (%eax),%eax
 630:	8b 10                	mov    (%eax),%edx
 632:	8b 45 f8             	mov    -0x8(%ebp),%eax
 635:	89 10                	mov    %edx,(%eax)
 637:	eb 0a                	jmp    643 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 639:	8b 45 fc             	mov    -0x4(%ebp),%eax
 63c:	8b 10                	mov    (%eax),%edx
 63e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 641:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 643:	8b 45 fc             	mov    -0x4(%ebp),%eax
 646:	8b 40 04             	mov    0x4(%eax),%eax
 649:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 650:	8b 45 fc             	mov    -0x4(%ebp),%eax
 653:	01 d0                	add    %edx,%eax
 655:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 658:	75 20                	jne    67a <free+0xcf>
    p->s.size += bp->s.size;
 65a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 65d:	8b 50 04             	mov    0x4(%eax),%edx
 660:	8b 45 f8             	mov    -0x8(%ebp),%eax
 663:	8b 40 04             	mov    0x4(%eax),%eax
 666:	01 c2                	add    %eax,%edx
 668:	8b 45 fc             	mov    -0x4(%ebp),%eax
 66b:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 66e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 671:	8b 10                	mov    (%eax),%edx
 673:	8b 45 fc             	mov    -0x4(%ebp),%eax
 676:	89 10                	mov    %edx,(%eax)
 678:	eb 08                	jmp    682 <free+0xd7>
  } else
    p->s.ptr = bp;
 67a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 67d:	8b 55 f8             	mov    -0x8(%ebp),%edx
 680:	89 10                	mov    %edx,(%eax)
  freep = p;
 682:	8b 45 fc             	mov    -0x4(%ebp),%eax
 685:	a3 3c 0a 00 00       	mov    %eax,0xa3c
}
 68a:	90                   	nop
 68b:	c9                   	leave  
 68c:	c3                   	ret    

0000068d <morecore>:

static Header*
morecore(uint nu)
{
 68d:	55                   	push   %ebp
 68e:	89 e5                	mov    %esp,%ebp
 690:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 693:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 69a:	77 07                	ja     6a3 <morecore+0x16>
    nu = 4096;
 69c:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 6a3:	8b 45 08             	mov    0x8(%ebp),%eax
 6a6:	c1 e0 03             	shl    $0x3,%eax
 6a9:	83 ec 0c             	sub    $0xc,%esp
 6ac:	50                   	push   %eax
 6ad:	e8 79 fc ff ff       	call   32b <sbrk>
 6b2:	83 c4 10             	add    $0x10,%esp
 6b5:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 6b8:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 6bc:	75 07                	jne    6c5 <morecore+0x38>
    return 0;
 6be:	b8 00 00 00 00       	mov    $0x0,%eax
 6c3:	eb 26                	jmp    6eb <morecore+0x5e>
  hp = (Header*)p;
 6c5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6c8:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 6cb:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6ce:	8b 55 08             	mov    0x8(%ebp),%edx
 6d1:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 6d4:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6d7:	83 c0 08             	add    $0x8,%eax
 6da:	83 ec 0c             	sub    $0xc,%esp
 6dd:	50                   	push   %eax
 6de:	e8 c8 fe ff ff       	call   5ab <free>
 6e3:	83 c4 10             	add    $0x10,%esp
  return freep;
 6e6:	a1 3c 0a 00 00       	mov    0xa3c,%eax
}
 6eb:	c9                   	leave  
 6ec:	c3                   	ret    

000006ed <malloc>:

void*
malloc(uint nbytes)
{
 6ed:	55                   	push   %ebp
 6ee:	89 e5                	mov    %esp,%ebp
 6f0:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6f3:	8b 45 08             	mov    0x8(%ebp),%eax
 6f6:	83 c0 07             	add    $0x7,%eax
 6f9:	c1 e8 03             	shr    $0x3,%eax
 6fc:	83 c0 01             	add    $0x1,%eax
 6ff:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 702:	a1 3c 0a 00 00       	mov    0xa3c,%eax
 707:	89 45 f0             	mov    %eax,-0x10(%ebp)
 70a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 70e:	75 23                	jne    733 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 710:	c7 45 f0 34 0a 00 00 	movl   $0xa34,-0x10(%ebp)
 717:	8b 45 f0             	mov    -0x10(%ebp),%eax
 71a:	a3 3c 0a 00 00       	mov    %eax,0xa3c
 71f:	a1 3c 0a 00 00       	mov    0xa3c,%eax
 724:	a3 34 0a 00 00       	mov    %eax,0xa34
    base.s.size = 0;
 729:	c7 05 38 0a 00 00 00 	movl   $0x0,0xa38
 730:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 733:	8b 45 f0             	mov    -0x10(%ebp),%eax
 736:	8b 00                	mov    (%eax),%eax
 738:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 73b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 73e:	8b 40 04             	mov    0x4(%eax),%eax
 741:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 744:	72 4d                	jb     793 <malloc+0xa6>
      if(p->s.size == nunits)
 746:	8b 45 f4             	mov    -0xc(%ebp),%eax
 749:	8b 40 04             	mov    0x4(%eax),%eax
 74c:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 74f:	75 0c                	jne    75d <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 751:	8b 45 f4             	mov    -0xc(%ebp),%eax
 754:	8b 10                	mov    (%eax),%edx
 756:	8b 45 f0             	mov    -0x10(%ebp),%eax
 759:	89 10                	mov    %edx,(%eax)
 75b:	eb 26                	jmp    783 <malloc+0x96>
      else {
        p->s.size -= nunits;
 75d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 760:	8b 40 04             	mov    0x4(%eax),%eax
 763:	2b 45 ec             	sub    -0x14(%ebp),%eax
 766:	89 c2                	mov    %eax,%edx
 768:	8b 45 f4             	mov    -0xc(%ebp),%eax
 76b:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 76e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 771:	8b 40 04             	mov    0x4(%eax),%eax
 774:	c1 e0 03             	shl    $0x3,%eax
 777:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 77a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 77d:	8b 55 ec             	mov    -0x14(%ebp),%edx
 780:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 783:	8b 45 f0             	mov    -0x10(%ebp),%eax
 786:	a3 3c 0a 00 00       	mov    %eax,0xa3c
      return (void*)(p + 1);
 78b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 78e:	83 c0 08             	add    $0x8,%eax
 791:	eb 3b                	jmp    7ce <malloc+0xe1>
    }
    if(p == freep)
 793:	a1 3c 0a 00 00       	mov    0xa3c,%eax
 798:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 79b:	75 1e                	jne    7bb <malloc+0xce>
      if((p = morecore(nunits)) == 0)
 79d:	83 ec 0c             	sub    $0xc,%esp
 7a0:	ff 75 ec             	pushl  -0x14(%ebp)
 7a3:	e8 e5 fe ff ff       	call   68d <morecore>
 7a8:	83 c4 10             	add    $0x10,%esp
 7ab:	89 45 f4             	mov    %eax,-0xc(%ebp)
 7ae:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 7b2:	75 07                	jne    7bb <malloc+0xce>
        return 0;
 7b4:	b8 00 00 00 00       	mov    $0x0,%eax
 7b9:	eb 13                	jmp    7ce <malloc+0xe1>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7bb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7be:	89 45 f0             	mov    %eax,-0x10(%ebp)
 7c1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7c4:	8b 00                	mov    (%eax),%eax
 7c6:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 7c9:	e9 6d ff ff ff       	jmp    73b <malloc+0x4e>
}
 7ce:	c9                   	leave  
 7cf:	c3                   	ret    
