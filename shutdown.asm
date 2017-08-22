
_shutdown:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "user.h"
#include "stat.h"


int main()
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	51                   	push   %ecx
   e:	83 ec 04             	sub    $0x4,%esp
	
	printf(1, "Shutting Down:\n");
  11:	83 ec 08             	sub    $0x8,%esp
  14:	68 d1 07 00 00       	push   $0x7d1
  19:	6a 01                	push   $0x1
  1b:	e8 fb 03 00 00       	call   41b <printf>
  20:	83 c4 10             	add    $0x10,%esp
  shutdown();
  23:	e8 fc 02 00 00       	call   324 <shutdown>
		
	exit();
  28:	e8 57 02 00 00       	call   284 <exit>

0000002d <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  2d:	55                   	push   %ebp
  2e:	89 e5                	mov    %esp,%ebp
  30:	57                   	push   %edi
  31:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  32:	8b 4d 08             	mov    0x8(%ebp),%ecx
  35:	8b 55 10             	mov    0x10(%ebp),%edx
  38:	8b 45 0c             	mov    0xc(%ebp),%eax
  3b:	89 cb                	mov    %ecx,%ebx
  3d:	89 df                	mov    %ebx,%edi
  3f:	89 d1                	mov    %edx,%ecx
  41:	fc                   	cld    
  42:	f3 aa                	rep stos %al,%es:(%edi)
  44:	89 ca                	mov    %ecx,%edx
  46:	89 fb                	mov    %edi,%ebx
  48:	89 5d 08             	mov    %ebx,0x8(%ebp)
  4b:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  4e:	90                   	nop
  4f:	5b                   	pop    %ebx
  50:	5f                   	pop    %edi
  51:	5d                   	pop    %ebp
  52:	c3                   	ret    

00000053 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  53:	55                   	push   %ebp
  54:	89 e5                	mov    %esp,%ebp
  56:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  59:	8b 45 08             	mov    0x8(%ebp),%eax
  5c:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  5f:	90                   	nop
  60:	8b 45 08             	mov    0x8(%ebp),%eax
  63:	8d 50 01             	lea    0x1(%eax),%edx
  66:	89 55 08             	mov    %edx,0x8(%ebp)
  69:	8b 55 0c             	mov    0xc(%ebp),%edx
  6c:	8d 4a 01             	lea    0x1(%edx),%ecx
  6f:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  72:	0f b6 12             	movzbl (%edx),%edx
  75:	88 10                	mov    %dl,(%eax)
  77:	0f b6 00             	movzbl (%eax),%eax
  7a:	84 c0                	test   %al,%al
  7c:	75 e2                	jne    60 <strcpy+0xd>
    ;
  return os;
  7e:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  81:	c9                   	leave  
  82:	c3                   	ret    

00000083 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  83:	55                   	push   %ebp
  84:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  86:	eb 08                	jmp    90 <strcmp+0xd>
    p++, q++;
  88:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  8c:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  90:	8b 45 08             	mov    0x8(%ebp),%eax
  93:	0f b6 00             	movzbl (%eax),%eax
  96:	84 c0                	test   %al,%al
  98:	74 10                	je     aa <strcmp+0x27>
  9a:	8b 45 08             	mov    0x8(%ebp),%eax
  9d:	0f b6 10             	movzbl (%eax),%edx
  a0:	8b 45 0c             	mov    0xc(%ebp),%eax
  a3:	0f b6 00             	movzbl (%eax),%eax
  a6:	38 c2                	cmp    %al,%dl
  a8:	74 de                	je     88 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
  aa:	8b 45 08             	mov    0x8(%ebp),%eax
  ad:	0f b6 00             	movzbl (%eax),%eax
  b0:	0f b6 d0             	movzbl %al,%edx
  b3:	8b 45 0c             	mov    0xc(%ebp),%eax
  b6:	0f b6 00             	movzbl (%eax),%eax
  b9:	0f b6 c0             	movzbl %al,%eax
  bc:	29 c2                	sub    %eax,%edx
  be:	89 d0                	mov    %edx,%eax
}
  c0:	5d                   	pop    %ebp
  c1:	c3                   	ret    

000000c2 <strlen>:

uint
strlen(char *s)
{
  c2:	55                   	push   %ebp
  c3:	89 e5                	mov    %esp,%ebp
  c5:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
  c8:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  cf:	eb 04                	jmp    d5 <strlen+0x13>
  d1:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  d5:	8b 55 fc             	mov    -0x4(%ebp),%edx
  d8:	8b 45 08             	mov    0x8(%ebp),%eax
  db:	01 d0                	add    %edx,%eax
  dd:	0f b6 00             	movzbl (%eax),%eax
  e0:	84 c0                	test   %al,%al
  e2:	75 ed                	jne    d1 <strlen+0xf>
    ;
  return n;
  e4:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  e7:	c9                   	leave  
  e8:	c3                   	ret    

000000e9 <memset>:

void*
memset(void *dst, int c, uint n)
{
  e9:	55                   	push   %ebp
  ea:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
  ec:	8b 45 10             	mov    0x10(%ebp),%eax
  ef:	50                   	push   %eax
  f0:	ff 75 0c             	pushl  0xc(%ebp)
  f3:	ff 75 08             	pushl  0x8(%ebp)
  f6:	e8 32 ff ff ff       	call   2d <stosb>
  fb:	83 c4 0c             	add    $0xc,%esp
  return dst;
  fe:	8b 45 08             	mov    0x8(%ebp),%eax
}
 101:	c9                   	leave  
 102:	c3                   	ret    

00000103 <strchr>:

char*
strchr(const char *s, char c)
{
 103:	55                   	push   %ebp
 104:	89 e5                	mov    %esp,%ebp
 106:	83 ec 04             	sub    $0x4,%esp
 109:	8b 45 0c             	mov    0xc(%ebp),%eax
 10c:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 10f:	eb 14                	jmp    125 <strchr+0x22>
    if(*s == c)
 111:	8b 45 08             	mov    0x8(%ebp),%eax
 114:	0f b6 00             	movzbl (%eax),%eax
 117:	3a 45 fc             	cmp    -0x4(%ebp),%al
 11a:	75 05                	jne    121 <strchr+0x1e>
      return (char*)s;
 11c:	8b 45 08             	mov    0x8(%ebp),%eax
 11f:	eb 13                	jmp    134 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 121:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 125:	8b 45 08             	mov    0x8(%ebp),%eax
 128:	0f b6 00             	movzbl (%eax),%eax
 12b:	84 c0                	test   %al,%al
 12d:	75 e2                	jne    111 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 12f:	b8 00 00 00 00       	mov    $0x0,%eax
}
 134:	c9                   	leave  
 135:	c3                   	ret    

00000136 <gets>:

char*
gets(char *buf, int max)
{
 136:	55                   	push   %ebp
 137:	89 e5                	mov    %esp,%ebp
 139:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 13c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 143:	eb 42                	jmp    187 <gets+0x51>
    cc = read(0, &c, 1);
 145:	83 ec 04             	sub    $0x4,%esp
 148:	6a 01                	push   $0x1
 14a:	8d 45 ef             	lea    -0x11(%ebp),%eax
 14d:	50                   	push   %eax
 14e:	6a 00                	push   $0x0
 150:	e8 47 01 00 00       	call   29c <read>
 155:	83 c4 10             	add    $0x10,%esp
 158:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 15b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 15f:	7e 33                	jle    194 <gets+0x5e>
      break;
    buf[i++] = c;
 161:	8b 45 f4             	mov    -0xc(%ebp),%eax
 164:	8d 50 01             	lea    0x1(%eax),%edx
 167:	89 55 f4             	mov    %edx,-0xc(%ebp)
 16a:	89 c2                	mov    %eax,%edx
 16c:	8b 45 08             	mov    0x8(%ebp),%eax
 16f:	01 c2                	add    %eax,%edx
 171:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 175:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 177:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 17b:	3c 0a                	cmp    $0xa,%al
 17d:	74 16                	je     195 <gets+0x5f>
 17f:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 183:	3c 0d                	cmp    $0xd,%al
 185:	74 0e                	je     195 <gets+0x5f>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 187:	8b 45 f4             	mov    -0xc(%ebp),%eax
 18a:	83 c0 01             	add    $0x1,%eax
 18d:	3b 45 0c             	cmp    0xc(%ebp),%eax
 190:	7c b3                	jl     145 <gets+0xf>
 192:	eb 01                	jmp    195 <gets+0x5f>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 194:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 195:	8b 55 f4             	mov    -0xc(%ebp),%edx
 198:	8b 45 08             	mov    0x8(%ebp),%eax
 19b:	01 d0                	add    %edx,%eax
 19d:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 1a0:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1a3:	c9                   	leave  
 1a4:	c3                   	ret    

000001a5 <stat>:

int
stat(char *n, struct stat *st)
{
 1a5:	55                   	push   %ebp
 1a6:	89 e5                	mov    %esp,%ebp
 1a8:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1ab:	83 ec 08             	sub    $0x8,%esp
 1ae:	6a 00                	push   $0x0
 1b0:	ff 75 08             	pushl  0x8(%ebp)
 1b3:	e8 0c 01 00 00       	call   2c4 <open>
 1b8:	83 c4 10             	add    $0x10,%esp
 1bb:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 1be:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 1c2:	79 07                	jns    1cb <stat+0x26>
    return -1;
 1c4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 1c9:	eb 25                	jmp    1f0 <stat+0x4b>
  r = fstat(fd, st);
 1cb:	83 ec 08             	sub    $0x8,%esp
 1ce:	ff 75 0c             	pushl  0xc(%ebp)
 1d1:	ff 75 f4             	pushl  -0xc(%ebp)
 1d4:	e8 03 01 00 00       	call   2dc <fstat>
 1d9:	83 c4 10             	add    $0x10,%esp
 1dc:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 1df:	83 ec 0c             	sub    $0xc,%esp
 1e2:	ff 75 f4             	pushl  -0xc(%ebp)
 1e5:	e8 c2 00 00 00       	call   2ac <close>
 1ea:	83 c4 10             	add    $0x10,%esp
  return r;
 1ed:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 1f0:	c9                   	leave  
 1f1:	c3                   	ret    

000001f2 <atoi>:

int
atoi(const char *s)
{
 1f2:	55                   	push   %ebp
 1f3:	89 e5                	mov    %esp,%ebp
 1f5:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 1f8:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 1ff:	eb 25                	jmp    226 <atoi+0x34>
    n = n*10 + *s++ - '0';
 201:	8b 55 fc             	mov    -0x4(%ebp),%edx
 204:	89 d0                	mov    %edx,%eax
 206:	c1 e0 02             	shl    $0x2,%eax
 209:	01 d0                	add    %edx,%eax
 20b:	01 c0                	add    %eax,%eax
 20d:	89 c1                	mov    %eax,%ecx
 20f:	8b 45 08             	mov    0x8(%ebp),%eax
 212:	8d 50 01             	lea    0x1(%eax),%edx
 215:	89 55 08             	mov    %edx,0x8(%ebp)
 218:	0f b6 00             	movzbl (%eax),%eax
 21b:	0f be c0             	movsbl %al,%eax
 21e:	01 c8                	add    %ecx,%eax
 220:	83 e8 30             	sub    $0x30,%eax
 223:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 226:	8b 45 08             	mov    0x8(%ebp),%eax
 229:	0f b6 00             	movzbl (%eax),%eax
 22c:	3c 2f                	cmp    $0x2f,%al
 22e:	7e 0a                	jle    23a <atoi+0x48>
 230:	8b 45 08             	mov    0x8(%ebp),%eax
 233:	0f b6 00             	movzbl (%eax),%eax
 236:	3c 39                	cmp    $0x39,%al
 238:	7e c7                	jle    201 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 23a:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 23d:	c9                   	leave  
 23e:	c3                   	ret    

0000023f <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 23f:	55                   	push   %ebp
 240:	89 e5                	mov    %esp,%ebp
 242:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 245:	8b 45 08             	mov    0x8(%ebp),%eax
 248:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 24b:	8b 45 0c             	mov    0xc(%ebp),%eax
 24e:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 251:	eb 17                	jmp    26a <memmove+0x2b>
    *dst++ = *src++;
 253:	8b 45 fc             	mov    -0x4(%ebp),%eax
 256:	8d 50 01             	lea    0x1(%eax),%edx
 259:	89 55 fc             	mov    %edx,-0x4(%ebp)
 25c:	8b 55 f8             	mov    -0x8(%ebp),%edx
 25f:	8d 4a 01             	lea    0x1(%edx),%ecx
 262:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 265:	0f b6 12             	movzbl (%edx),%edx
 268:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 26a:	8b 45 10             	mov    0x10(%ebp),%eax
 26d:	8d 50 ff             	lea    -0x1(%eax),%edx
 270:	89 55 10             	mov    %edx,0x10(%ebp)
 273:	85 c0                	test   %eax,%eax
 275:	7f dc                	jg     253 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 277:	8b 45 08             	mov    0x8(%ebp),%eax
}
 27a:	c9                   	leave  
 27b:	c3                   	ret    

0000027c <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 27c:	b8 01 00 00 00       	mov    $0x1,%eax
 281:	cd 40                	int    $0x40
 283:	c3                   	ret    

00000284 <exit>:
SYSCALL(exit)
 284:	b8 02 00 00 00       	mov    $0x2,%eax
 289:	cd 40                	int    $0x40
 28b:	c3                   	ret    

0000028c <wait>:
SYSCALL(wait)
 28c:	b8 03 00 00 00       	mov    $0x3,%eax
 291:	cd 40                	int    $0x40
 293:	c3                   	ret    

00000294 <pipe>:
SYSCALL(pipe)
 294:	b8 04 00 00 00       	mov    $0x4,%eax
 299:	cd 40                	int    $0x40
 29b:	c3                   	ret    

0000029c <read>:
SYSCALL(read)
 29c:	b8 05 00 00 00       	mov    $0x5,%eax
 2a1:	cd 40                	int    $0x40
 2a3:	c3                   	ret    

000002a4 <write>:
SYSCALL(write)
 2a4:	b8 10 00 00 00       	mov    $0x10,%eax
 2a9:	cd 40                	int    $0x40
 2ab:	c3                   	ret    

000002ac <close>:
SYSCALL(close)
 2ac:	b8 15 00 00 00       	mov    $0x15,%eax
 2b1:	cd 40                	int    $0x40
 2b3:	c3                   	ret    

000002b4 <kill>:
SYSCALL(kill)
 2b4:	b8 06 00 00 00       	mov    $0x6,%eax
 2b9:	cd 40                	int    $0x40
 2bb:	c3                   	ret    

000002bc <exec>:
SYSCALL(exec)
 2bc:	b8 07 00 00 00       	mov    $0x7,%eax
 2c1:	cd 40                	int    $0x40
 2c3:	c3                   	ret    

000002c4 <open>:
SYSCALL(open)
 2c4:	b8 0f 00 00 00       	mov    $0xf,%eax
 2c9:	cd 40                	int    $0x40
 2cb:	c3                   	ret    

000002cc <mknod>:
SYSCALL(mknod)
 2cc:	b8 11 00 00 00       	mov    $0x11,%eax
 2d1:	cd 40                	int    $0x40
 2d3:	c3                   	ret    

000002d4 <unlink>:
SYSCALL(unlink)
 2d4:	b8 12 00 00 00       	mov    $0x12,%eax
 2d9:	cd 40                	int    $0x40
 2db:	c3                   	ret    

000002dc <fstat>:
SYSCALL(fstat)
 2dc:	b8 08 00 00 00       	mov    $0x8,%eax
 2e1:	cd 40                	int    $0x40
 2e3:	c3                   	ret    

000002e4 <link>:
SYSCALL(link)
 2e4:	b8 13 00 00 00       	mov    $0x13,%eax
 2e9:	cd 40                	int    $0x40
 2eb:	c3                   	ret    

000002ec <mkdir>:
SYSCALL(mkdir)
 2ec:	b8 14 00 00 00       	mov    $0x14,%eax
 2f1:	cd 40                	int    $0x40
 2f3:	c3                   	ret    

000002f4 <chdir>:
SYSCALL(chdir)
 2f4:	b8 09 00 00 00       	mov    $0x9,%eax
 2f9:	cd 40                	int    $0x40
 2fb:	c3                   	ret    

000002fc <dup>:
SYSCALL(dup)
 2fc:	b8 0a 00 00 00       	mov    $0xa,%eax
 301:	cd 40                	int    $0x40
 303:	c3                   	ret    

00000304 <getpid>:
SYSCALL(getpid)
 304:	b8 0b 00 00 00       	mov    $0xb,%eax
 309:	cd 40                	int    $0x40
 30b:	c3                   	ret    

0000030c <getppid>:
SYSCALL(getppid)
 30c:	b8 18 00 00 00       	mov    $0x18,%eax
 311:	cd 40                	int    $0x40
 313:	c3                   	ret    

00000314 <getsyscallinfo>:
SYSCALL(getsyscallinfo)
 314:	b8 19 00 00 00       	mov    $0x19,%eax
 319:	cd 40                	int    $0x40
 31b:	c3                   	ret    

0000031c <getAllPids>:
SYSCALL(getAllPids)
 31c:	b8 16 00 00 00       	mov    $0x16,%eax
 321:	cd 40                	int    $0x40
 323:	c3                   	ret    

00000324 <shutdown>:
SYSCALL(shutdown)
 324:	b8 17 00 00 00       	mov    $0x17,%eax
 329:	cd 40                	int    $0x40
 32b:	c3                   	ret    

0000032c <sbrk>:
SYSCALL(sbrk)
 32c:	b8 0c 00 00 00       	mov    $0xc,%eax
 331:	cd 40                	int    $0x40
 333:	c3                   	ret    

00000334 <sleep>:
SYSCALL(sleep)
 334:	b8 0d 00 00 00       	mov    $0xd,%eax
 339:	cd 40                	int    $0x40
 33b:	c3                   	ret    

0000033c <uptime>:
SYSCALL(uptime)
 33c:	b8 0e 00 00 00       	mov    $0xe,%eax
 341:	cd 40                	int    $0x40
 343:	c3                   	ret    

00000344 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 344:	55                   	push   %ebp
 345:	89 e5                	mov    %esp,%ebp
 347:	83 ec 18             	sub    $0x18,%esp
 34a:	8b 45 0c             	mov    0xc(%ebp),%eax
 34d:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 350:	83 ec 04             	sub    $0x4,%esp
 353:	6a 01                	push   $0x1
 355:	8d 45 f4             	lea    -0xc(%ebp),%eax
 358:	50                   	push   %eax
 359:	ff 75 08             	pushl  0x8(%ebp)
 35c:	e8 43 ff ff ff       	call   2a4 <write>
 361:	83 c4 10             	add    $0x10,%esp
}
 364:	90                   	nop
 365:	c9                   	leave  
 366:	c3                   	ret    

00000367 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 367:	55                   	push   %ebp
 368:	89 e5                	mov    %esp,%ebp
 36a:	53                   	push   %ebx
 36b:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 36e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 375:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 379:	74 17                	je     392 <printint+0x2b>
 37b:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 37f:	79 11                	jns    392 <printint+0x2b>
    neg = 1;
 381:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 388:	8b 45 0c             	mov    0xc(%ebp),%eax
 38b:	f7 d8                	neg    %eax
 38d:	89 45 ec             	mov    %eax,-0x14(%ebp)
 390:	eb 06                	jmp    398 <printint+0x31>
  } else {
    x = xx;
 392:	8b 45 0c             	mov    0xc(%ebp),%eax
 395:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 398:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 39f:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 3a2:	8d 41 01             	lea    0x1(%ecx),%eax
 3a5:	89 45 f4             	mov    %eax,-0xc(%ebp)
 3a8:	8b 5d 10             	mov    0x10(%ebp),%ebx
 3ab:	8b 45 ec             	mov    -0x14(%ebp),%eax
 3ae:	ba 00 00 00 00       	mov    $0x0,%edx
 3b3:	f7 f3                	div    %ebx
 3b5:	89 d0                	mov    %edx,%eax
 3b7:	0f b6 80 30 0a 00 00 	movzbl 0xa30(%eax),%eax
 3be:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 3c2:	8b 5d 10             	mov    0x10(%ebp),%ebx
 3c5:	8b 45 ec             	mov    -0x14(%ebp),%eax
 3c8:	ba 00 00 00 00       	mov    $0x0,%edx
 3cd:	f7 f3                	div    %ebx
 3cf:	89 45 ec             	mov    %eax,-0x14(%ebp)
 3d2:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 3d6:	75 c7                	jne    39f <printint+0x38>
  if(neg)
 3d8:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 3dc:	74 2d                	je     40b <printint+0xa4>
    buf[i++] = '-';
 3de:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3e1:	8d 50 01             	lea    0x1(%eax),%edx
 3e4:	89 55 f4             	mov    %edx,-0xc(%ebp)
 3e7:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 3ec:	eb 1d                	jmp    40b <printint+0xa4>
    putc(fd, buf[i]);
 3ee:	8d 55 dc             	lea    -0x24(%ebp),%edx
 3f1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3f4:	01 d0                	add    %edx,%eax
 3f6:	0f b6 00             	movzbl (%eax),%eax
 3f9:	0f be c0             	movsbl %al,%eax
 3fc:	83 ec 08             	sub    $0x8,%esp
 3ff:	50                   	push   %eax
 400:	ff 75 08             	pushl  0x8(%ebp)
 403:	e8 3c ff ff ff       	call   344 <putc>
 408:	83 c4 10             	add    $0x10,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 40b:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 40f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 413:	79 d9                	jns    3ee <printint+0x87>
    putc(fd, buf[i]);
}
 415:	90                   	nop
 416:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 419:	c9                   	leave  
 41a:	c3                   	ret    

0000041b <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 41b:	55                   	push   %ebp
 41c:	89 e5                	mov    %esp,%ebp
 41e:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 421:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 428:	8d 45 0c             	lea    0xc(%ebp),%eax
 42b:	83 c0 04             	add    $0x4,%eax
 42e:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 431:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 438:	e9 59 01 00 00       	jmp    596 <printf+0x17b>
    c = fmt[i] & 0xff;
 43d:	8b 55 0c             	mov    0xc(%ebp),%edx
 440:	8b 45 f0             	mov    -0x10(%ebp),%eax
 443:	01 d0                	add    %edx,%eax
 445:	0f b6 00             	movzbl (%eax),%eax
 448:	0f be c0             	movsbl %al,%eax
 44b:	25 ff 00 00 00       	and    $0xff,%eax
 450:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 453:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 457:	75 2c                	jne    485 <printf+0x6a>
      if(c == '%'){
 459:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 45d:	75 0c                	jne    46b <printf+0x50>
        state = '%';
 45f:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 466:	e9 27 01 00 00       	jmp    592 <printf+0x177>
      } else {
        putc(fd, c);
 46b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 46e:	0f be c0             	movsbl %al,%eax
 471:	83 ec 08             	sub    $0x8,%esp
 474:	50                   	push   %eax
 475:	ff 75 08             	pushl  0x8(%ebp)
 478:	e8 c7 fe ff ff       	call   344 <putc>
 47d:	83 c4 10             	add    $0x10,%esp
 480:	e9 0d 01 00 00       	jmp    592 <printf+0x177>
      }
    } else if(state == '%'){
 485:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 489:	0f 85 03 01 00 00    	jne    592 <printf+0x177>
      if(c == 'd'){
 48f:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 493:	75 1e                	jne    4b3 <printf+0x98>
        printint(fd, *ap, 10, 1);
 495:	8b 45 e8             	mov    -0x18(%ebp),%eax
 498:	8b 00                	mov    (%eax),%eax
 49a:	6a 01                	push   $0x1
 49c:	6a 0a                	push   $0xa
 49e:	50                   	push   %eax
 49f:	ff 75 08             	pushl  0x8(%ebp)
 4a2:	e8 c0 fe ff ff       	call   367 <printint>
 4a7:	83 c4 10             	add    $0x10,%esp
        ap++;
 4aa:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 4ae:	e9 d8 00 00 00       	jmp    58b <printf+0x170>
      } else if(c == 'x' || c == 'p'){
 4b3:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 4b7:	74 06                	je     4bf <printf+0xa4>
 4b9:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 4bd:	75 1e                	jne    4dd <printf+0xc2>
        printint(fd, *ap, 16, 0);
 4bf:	8b 45 e8             	mov    -0x18(%ebp),%eax
 4c2:	8b 00                	mov    (%eax),%eax
 4c4:	6a 00                	push   $0x0
 4c6:	6a 10                	push   $0x10
 4c8:	50                   	push   %eax
 4c9:	ff 75 08             	pushl  0x8(%ebp)
 4cc:	e8 96 fe ff ff       	call   367 <printint>
 4d1:	83 c4 10             	add    $0x10,%esp
        ap++;
 4d4:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 4d8:	e9 ae 00 00 00       	jmp    58b <printf+0x170>
      } else if(c == 's'){
 4dd:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 4e1:	75 43                	jne    526 <printf+0x10b>
        s = (char*)*ap;
 4e3:	8b 45 e8             	mov    -0x18(%ebp),%eax
 4e6:	8b 00                	mov    (%eax),%eax
 4e8:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 4eb:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 4ef:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 4f3:	75 25                	jne    51a <printf+0xff>
          s = "(null)";
 4f5:	c7 45 f4 e1 07 00 00 	movl   $0x7e1,-0xc(%ebp)
        while(*s != 0){
 4fc:	eb 1c                	jmp    51a <printf+0xff>
          putc(fd, *s);
 4fe:	8b 45 f4             	mov    -0xc(%ebp),%eax
 501:	0f b6 00             	movzbl (%eax),%eax
 504:	0f be c0             	movsbl %al,%eax
 507:	83 ec 08             	sub    $0x8,%esp
 50a:	50                   	push   %eax
 50b:	ff 75 08             	pushl  0x8(%ebp)
 50e:	e8 31 fe ff ff       	call   344 <putc>
 513:	83 c4 10             	add    $0x10,%esp
          s++;
 516:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 51a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 51d:	0f b6 00             	movzbl (%eax),%eax
 520:	84 c0                	test   %al,%al
 522:	75 da                	jne    4fe <printf+0xe3>
 524:	eb 65                	jmp    58b <printf+0x170>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 526:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 52a:	75 1d                	jne    549 <printf+0x12e>
        putc(fd, *ap);
 52c:	8b 45 e8             	mov    -0x18(%ebp),%eax
 52f:	8b 00                	mov    (%eax),%eax
 531:	0f be c0             	movsbl %al,%eax
 534:	83 ec 08             	sub    $0x8,%esp
 537:	50                   	push   %eax
 538:	ff 75 08             	pushl  0x8(%ebp)
 53b:	e8 04 fe ff ff       	call   344 <putc>
 540:	83 c4 10             	add    $0x10,%esp
        ap++;
 543:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 547:	eb 42                	jmp    58b <printf+0x170>
      } else if(c == '%'){
 549:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 54d:	75 17                	jne    566 <printf+0x14b>
        putc(fd, c);
 54f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 552:	0f be c0             	movsbl %al,%eax
 555:	83 ec 08             	sub    $0x8,%esp
 558:	50                   	push   %eax
 559:	ff 75 08             	pushl  0x8(%ebp)
 55c:	e8 e3 fd ff ff       	call   344 <putc>
 561:	83 c4 10             	add    $0x10,%esp
 564:	eb 25                	jmp    58b <printf+0x170>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 566:	83 ec 08             	sub    $0x8,%esp
 569:	6a 25                	push   $0x25
 56b:	ff 75 08             	pushl  0x8(%ebp)
 56e:	e8 d1 fd ff ff       	call   344 <putc>
 573:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
 576:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 579:	0f be c0             	movsbl %al,%eax
 57c:	83 ec 08             	sub    $0x8,%esp
 57f:	50                   	push   %eax
 580:	ff 75 08             	pushl  0x8(%ebp)
 583:	e8 bc fd ff ff       	call   344 <putc>
 588:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 58b:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 592:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 596:	8b 55 0c             	mov    0xc(%ebp),%edx
 599:	8b 45 f0             	mov    -0x10(%ebp),%eax
 59c:	01 d0                	add    %edx,%eax
 59e:	0f b6 00             	movzbl (%eax),%eax
 5a1:	84 c0                	test   %al,%al
 5a3:	0f 85 94 fe ff ff    	jne    43d <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 5a9:	90                   	nop
 5aa:	c9                   	leave  
 5ab:	c3                   	ret    

000005ac <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 5ac:	55                   	push   %ebp
 5ad:	89 e5                	mov    %esp,%ebp
 5af:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 5b2:	8b 45 08             	mov    0x8(%ebp),%eax
 5b5:	83 e8 08             	sub    $0x8,%eax
 5b8:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5bb:	a1 4c 0a 00 00       	mov    0xa4c,%eax
 5c0:	89 45 fc             	mov    %eax,-0x4(%ebp)
 5c3:	eb 24                	jmp    5e9 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5c5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 5c8:	8b 00                	mov    (%eax),%eax
 5ca:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 5cd:	77 12                	ja     5e1 <free+0x35>
 5cf:	8b 45 f8             	mov    -0x8(%ebp),%eax
 5d2:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 5d5:	77 24                	ja     5fb <free+0x4f>
 5d7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 5da:	8b 00                	mov    (%eax),%eax
 5dc:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 5df:	77 1a                	ja     5fb <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5e1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 5e4:	8b 00                	mov    (%eax),%eax
 5e6:	89 45 fc             	mov    %eax,-0x4(%ebp)
 5e9:	8b 45 f8             	mov    -0x8(%ebp),%eax
 5ec:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 5ef:	76 d4                	jbe    5c5 <free+0x19>
 5f1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 5f4:	8b 00                	mov    (%eax),%eax
 5f6:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 5f9:	76 ca                	jbe    5c5 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 5fb:	8b 45 f8             	mov    -0x8(%ebp),%eax
 5fe:	8b 40 04             	mov    0x4(%eax),%eax
 601:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 608:	8b 45 f8             	mov    -0x8(%ebp),%eax
 60b:	01 c2                	add    %eax,%edx
 60d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 610:	8b 00                	mov    (%eax),%eax
 612:	39 c2                	cmp    %eax,%edx
 614:	75 24                	jne    63a <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 616:	8b 45 f8             	mov    -0x8(%ebp),%eax
 619:	8b 50 04             	mov    0x4(%eax),%edx
 61c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 61f:	8b 00                	mov    (%eax),%eax
 621:	8b 40 04             	mov    0x4(%eax),%eax
 624:	01 c2                	add    %eax,%edx
 626:	8b 45 f8             	mov    -0x8(%ebp),%eax
 629:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 62c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 62f:	8b 00                	mov    (%eax),%eax
 631:	8b 10                	mov    (%eax),%edx
 633:	8b 45 f8             	mov    -0x8(%ebp),%eax
 636:	89 10                	mov    %edx,(%eax)
 638:	eb 0a                	jmp    644 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 63a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 63d:	8b 10                	mov    (%eax),%edx
 63f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 642:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 644:	8b 45 fc             	mov    -0x4(%ebp),%eax
 647:	8b 40 04             	mov    0x4(%eax),%eax
 64a:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 651:	8b 45 fc             	mov    -0x4(%ebp),%eax
 654:	01 d0                	add    %edx,%eax
 656:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 659:	75 20                	jne    67b <free+0xcf>
    p->s.size += bp->s.size;
 65b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 65e:	8b 50 04             	mov    0x4(%eax),%edx
 661:	8b 45 f8             	mov    -0x8(%ebp),%eax
 664:	8b 40 04             	mov    0x4(%eax),%eax
 667:	01 c2                	add    %eax,%edx
 669:	8b 45 fc             	mov    -0x4(%ebp),%eax
 66c:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 66f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 672:	8b 10                	mov    (%eax),%edx
 674:	8b 45 fc             	mov    -0x4(%ebp),%eax
 677:	89 10                	mov    %edx,(%eax)
 679:	eb 08                	jmp    683 <free+0xd7>
  } else
    p->s.ptr = bp;
 67b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 67e:	8b 55 f8             	mov    -0x8(%ebp),%edx
 681:	89 10                	mov    %edx,(%eax)
  freep = p;
 683:	8b 45 fc             	mov    -0x4(%ebp),%eax
 686:	a3 4c 0a 00 00       	mov    %eax,0xa4c
}
 68b:	90                   	nop
 68c:	c9                   	leave  
 68d:	c3                   	ret    

0000068e <morecore>:

static Header*
morecore(uint nu)
{
 68e:	55                   	push   %ebp
 68f:	89 e5                	mov    %esp,%ebp
 691:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 694:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 69b:	77 07                	ja     6a4 <morecore+0x16>
    nu = 4096;
 69d:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 6a4:	8b 45 08             	mov    0x8(%ebp),%eax
 6a7:	c1 e0 03             	shl    $0x3,%eax
 6aa:	83 ec 0c             	sub    $0xc,%esp
 6ad:	50                   	push   %eax
 6ae:	e8 79 fc ff ff       	call   32c <sbrk>
 6b3:	83 c4 10             	add    $0x10,%esp
 6b6:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 6b9:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 6bd:	75 07                	jne    6c6 <morecore+0x38>
    return 0;
 6bf:	b8 00 00 00 00       	mov    $0x0,%eax
 6c4:	eb 26                	jmp    6ec <morecore+0x5e>
  hp = (Header*)p;
 6c6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6c9:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 6cc:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6cf:	8b 55 08             	mov    0x8(%ebp),%edx
 6d2:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 6d5:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6d8:	83 c0 08             	add    $0x8,%eax
 6db:	83 ec 0c             	sub    $0xc,%esp
 6de:	50                   	push   %eax
 6df:	e8 c8 fe ff ff       	call   5ac <free>
 6e4:	83 c4 10             	add    $0x10,%esp
  return freep;
 6e7:	a1 4c 0a 00 00       	mov    0xa4c,%eax
}
 6ec:	c9                   	leave  
 6ed:	c3                   	ret    

000006ee <malloc>:

void*
malloc(uint nbytes)
{
 6ee:	55                   	push   %ebp
 6ef:	89 e5                	mov    %esp,%ebp
 6f1:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6f4:	8b 45 08             	mov    0x8(%ebp),%eax
 6f7:	83 c0 07             	add    $0x7,%eax
 6fa:	c1 e8 03             	shr    $0x3,%eax
 6fd:	83 c0 01             	add    $0x1,%eax
 700:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 703:	a1 4c 0a 00 00       	mov    0xa4c,%eax
 708:	89 45 f0             	mov    %eax,-0x10(%ebp)
 70b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 70f:	75 23                	jne    734 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 711:	c7 45 f0 44 0a 00 00 	movl   $0xa44,-0x10(%ebp)
 718:	8b 45 f0             	mov    -0x10(%ebp),%eax
 71b:	a3 4c 0a 00 00       	mov    %eax,0xa4c
 720:	a1 4c 0a 00 00       	mov    0xa4c,%eax
 725:	a3 44 0a 00 00       	mov    %eax,0xa44
    base.s.size = 0;
 72a:	c7 05 48 0a 00 00 00 	movl   $0x0,0xa48
 731:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 734:	8b 45 f0             	mov    -0x10(%ebp),%eax
 737:	8b 00                	mov    (%eax),%eax
 739:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 73c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 73f:	8b 40 04             	mov    0x4(%eax),%eax
 742:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 745:	72 4d                	jb     794 <malloc+0xa6>
      if(p->s.size == nunits)
 747:	8b 45 f4             	mov    -0xc(%ebp),%eax
 74a:	8b 40 04             	mov    0x4(%eax),%eax
 74d:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 750:	75 0c                	jne    75e <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 752:	8b 45 f4             	mov    -0xc(%ebp),%eax
 755:	8b 10                	mov    (%eax),%edx
 757:	8b 45 f0             	mov    -0x10(%ebp),%eax
 75a:	89 10                	mov    %edx,(%eax)
 75c:	eb 26                	jmp    784 <malloc+0x96>
      else {
        p->s.size -= nunits;
 75e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 761:	8b 40 04             	mov    0x4(%eax),%eax
 764:	2b 45 ec             	sub    -0x14(%ebp),%eax
 767:	89 c2                	mov    %eax,%edx
 769:	8b 45 f4             	mov    -0xc(%ebp),%eax
 76c:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 76f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 772:	8b 40 04             	mov    0x4(%eax),%eax
 775:	c1 e0 03             	shl    $0x3,%eax
 778:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 77b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 77e:	8b 55 ec             	mov    -0x14(%ebp),%edx
 781:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 784:	8b 45 f0             	mov    -0x10(%ebp),%eax
 787:	a3 4c 0a 00 00       	mov    %eax,0xa4c
      return (void*)(p + 1);
 78c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 78f:	83 c0 08             	add    $0x8,%eax
 792:	eb 3b                	jmp    7cf <malloc+0xe1>
    }
    if(p == freep)
 794:	a1 4c 0a 00 00       	mov    0xa4c,%eax
 799:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 79c:	75 1e                	jne    7bc <malloc+0xce>
      if((p = morecore(nunits)) == 0)
 79e:	83 ec 0c             	sub    $0xc,%esp
 7a1:	ff 75 ec             	pushl  -0x14(%ebp)
 7a4:	e8 e5 fe ff ff       	call   68e <morecore>
 7a9:	83 c4 10             	add    $0x10,%esp
 7ac:	89 45 f4             	mov    %eax,-0xc(%ebp)
 7af:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 7b3:	75 07                	jne    7bc <malloc+0xce>
        return 0;
 7b5:	b8 00 00 00 00       	mov    $0x0,%eax
 7ba:	eb 13                	jmp    7cf <malloc+0xe1>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7bc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7bf:	89 45 f0             	mov    %eax,-0x10(%ebp)
 7c2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7c5:	8b 00                	mov    (%eax),%eax
 7c7:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 7ca:	e9 6d ff ff ff       	jmp    73c <malloc+0x4e>
}
 7cf:	c9                   	leave  
 7d0:	c3                   	ret    
