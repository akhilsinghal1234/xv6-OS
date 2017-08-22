
_syscallinfo:     file format elf32-i386


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
	
	printf(1, "Getting Number Of system calls:\n");
  11:	83 ec 08             	sub    $0x8,%esp
  14:	68 e4 07 00 00       	push   $0x7e4
  19:	6a 01                	push   $0x1
  1b:	e8 0e 04 00 00       	call   42e <printf>
  20:	83 c4 10             	add    $0x10,%esp
  printf(2, "%d\n",getsyscallinfo());
  23:	e8 ff 02 00 00       	call   327 <getsyscallinfo>
  28:	83 ec 04             	sub    $0x4,%esp
  2b:	50                   	push   %eax
  2c:	68 05 08 00 00       	push   $0x805
  31:	6a 02                	push   $0x2
  33:	e8 f6 03 00 00       	call   42e <printf>
  38:	83 c4 10             	add    $0x10,%esp
  
	exit();
  3b:	e8 57 02 00 00       	call   297 <exit>

00000040 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  40:	55                   	push   %ebp
  41:	89 e5                	mov    %esp,%ebp
  43:	57                   	push   %edi
  44:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  45:	8b 4d 08             	mov    0x8(%ebp),%ecx
  48:	8b 55 10             	mov    0x10(%ebp),%edx
  4b:	8b 45 0c             	mov    0xc(%ebp),%eax
  4e:	89 cb                	mov    %ecx,%ebx
  50:	89 df                	mov    %ebx,%edi
  52:	89 d1                	mov    %edx,%ecx
  54:	fc                   	cld    
  55:	f3 aa                	rep stos %al,%es:(%edi)
  57:	89 ca                	mov    %ecx,%edx
  59:	89 fb                	mov    %edi,%ebx
  5b:	89 5d 08             	mov    %ebx,0x8(%ebp)
  5e:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  61:	90                   	nop
  62:	5b                   	pop    %ebx
  63:	5f                   	pop    %edi
  64:	5d                   	pop    %ebp
  65:	c3                   	ret    

00000066 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  66:	55                   	push   %ebp
  67:	89 e5                	mov    %esp,%ebp
  69:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  6c:	8b 45 08             	mov    0x8(%ebp),%eax
  6f:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  72:	90                   	nop
  73:	8b 45 08             	mov    0x8(%ebp),%eax
  76:	8d 50 01             	lea    0x1(%eax),%edx
  79:	89 55 08             	mov    %edx,0x8(%ebp)
  7c:	8b 55 0c             	mov    0xc(%ebp),%edx
  7f:	8d 4a 01             	lea    0x1(%edx),%ecx
  82:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  85:	0f b6 12             	movzbl (%edx),%edx
  88:	88 10                	mov    %dl,(%eax)
  8a:	0f b6 00             	movzbl (%eax),%eax
  8d:	84 c0                	test   %al,%al
  8f:	75 e2                	jne    73 <strcpy+0xd>
    ;
  return os;
  91:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  94:	c9                   	leave  
  95:	c3                   	ret    

00000096 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  96:	55                   	push   %ebp
  97:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  99:	eb 08                	jmp    a3 <strcmp+0xd>
    p++, q++;
  9b:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  9f:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  a3:	8b 45 08             	mov    0x8(%ebp),%eax
  a6:	0f b6 00             	movzbl (%eax),%eax
  a9:	84 c0                	test   %al,%al
  ab:	74 10                	je     bd <strcmp+0x27>
  ad:	8b 45 08             	mov    0x8(%ebp),%eax
  b0:	0f b6 10             	movzbl (%eax),%edx
  b3:	8b 45 0c             	mov    0xc(%ebp),%eax
  b6:	0f b6 00             	movzbl (%eax),%eax
  b9:	38 c2                	cmp    %al,%dl
  bb:	74 de                	je     9b <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
  bd:	8b 45 08             	mov    0x8(%ebp),%eax
  c0:	0f b6 00             	movzbl (%eax),%eax
  c3:	0f b6 d0             	movzbl %al,%edx
  c6:	8b 45 0c             	mov    0xc(%ebp),%eax
  c9:	0f b6 00             	movzbl (%eax),%eax
  cc:	0f b6 c0             	movzbl %al,%eax
  cf:	29 c2                	sub    %eax,%edx
  d1:	89 d0                	mov    %edx,%eax
}
  d3:	5d                   	pop    %ebp
  d4:	c3                   	ret    

000000d5 <strlen>:

uint
strlen(char *s)
{
  d5:	55                   	push   %ebp
  d6:	89 e5                	mov    %esp,%ebp
  d8:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
  db:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  e2:	eb 04                	jmp    e8 <strlen+0x13>
  e4:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  e8:	8b 55 fc             	mov    -0x4(%ebp),%edx
  eb:	8b 45 08             	mov    0x8(%ebp),%eax
  ee:	01 d0                	add    %edx,%eax
  f0:	0f b6 00             	movzbl (%eax),%eax
  f3:	84 c0                	test   %al,%al
  f5:	75 ed                	jne    e4 <strlen+0xf>
    ;
  return n;
  f7:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  fa:	c9                   	leave  
  fb:	c3                   	ret    

000000fc <memset>:

void*
memset(void *dst, int c, uint n)
{
  fc:	55                   	push   %ebp
  fd:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
  ff:	8b 45 10             	mov    0x10(%ebp),%eax
 102:	50                   	push   %eax
 103:	ff 75 0c             	pushl  0xc(%ebp)
 106:	ff 75 08             	pushl  0x8(%ebp)
 109:	e8 32 ff ff ff       	call   40 <stosb>
 10e:	83 c4 0c             	add    $0xc,%esp
  return dst;
 111:	8b 45 08             	mov    0x8(%ebp),%eax
}
 114:	c9                   	leave  
 115:	c3                   	ret    

00000116 <strchr>:

char*
strchr(const char *s, char c)
{
 116:	55                   	push   %ebp
 117:	89 e5                	mov    %esp,%ebp
 119:	83 ec 04             	sub    $0x4,%esp
 11c:	8b 45 0c             	mov    0xc(%ebp),%eax
 11f:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 122:	eb 14                	jmp    138 <strchr+0x22>
    if(*s == c)
 124:	8b 45 08             	mov    0x8(%ebp),%eax
 127:	0f b6 00             	movzbl (%eax),%eax
 12a:	3a 45 fc             	cmp    -0x4(%ebp),%al
 12d:	75 05                	jne    134 <strchr+0x1e>
      return (char*)s;
 12f:	8b 45 08             	mov    0x8(%ebp),%eax
 132:	eb 13                	jmp    147 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 134:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 138:	8b 45 08             	mov    0x8(%ebp),%eax
 13b:	0f b6 00             	movzbl (%eax),%eax
 13e:	84 c0                	test   %al,%al
 140:	75 e2                	jne    124 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 142:	b8 00 00 00 00       	mov    $0x0,%eax
}
 147:	c9                   	leave  
 148:	c3                   	ret    

00000149 <gets>:

char*
gets(char *buf, int max)
{
 149:	55                   	push   %ebp
 14a:	89 e5                	mov    %esp,%ebp
 14c:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 14f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 156:	eb 42                	jmp    19a <gets+0x51>
    cc = read(0, &c, 1);
 158:	83 ec 04             	sub    $0x4,%esp
 15b:	6a 01                	push   $0x1
 15d:	8d 45 ef             	lea    -0x11(%ebp),%eax
 160:	50                   	push   %eax
 161:	6a 00                	push   $0x0
 163:	e8 47 01 00 00       	call   2af <read>
 168:	83 c4 10             	add    $0x10,%esp
 16b:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 16e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 172:	7e 33                	jle    1a7 <gets+0x5e>
      break;
    buf[i++] = c;
 174:	8b 45 f4             	mov    -0xc(%ebp),%eax
 177:	8d 50 01             	lea    0x1(%eax),%edx
 17a:	89 55 f4             	mov    %edx,-0xc(%ebp)
 17d:	89 c2                	mov    %eax,%edx
 17f:	8b 45 08             	mov    0x8(%ebp),%eax
 182:	01 c2                	add    %eax,%edx
 184:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 188:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 18a:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 18e:	3c 0a                	cmp    $0xa,%al
 190:	74 16                	je     1a8 <gets+0x5f>
 192:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 196:	3c 0d                	cmp    $0xd,%al
 198:	74 0e                	je     1a8 <gets+0x5f>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 19a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 19d:	83 c0 01             	add    $0x1,%eax
 1a0:	3b 45 0c             	cmp    0xc(%ebp),%eax
 1a3:	7c b3                	jl     158 <gets+0xf>
 1a5:	eb 01                	jmp    1a8 <gets+0x5f>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 1a7:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 1a8:	8b 55 f4             	mov    -0xc(%ebp),%edx
 1ab:	8b 45 08             	mov    0x8(%ebp),%eax
 1ae:	01 d0                	add    %edx,%eax
 1b0:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 1b3:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1b6:	c9                   	leave  
 1b7:	c3                   	ret    

000001b8 <stat>:

int
stat(char *n, struct stat *st)
{
 1b8:	55                   	push   %ebp
 1b9:	89 e5                	mov    %esp,%ebp
 1bb:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1be:	83 ec 08             	sub    $0x8,%esp
 1c1:	6a 00                	push   $0x0
 1c3:	ff 75 08             	pushl  0x8(%ebp)
 1c6:	e8 0c 01 00 00       	call   2d7 <open>
 1cb:	83 c4 10             	add    $0x10,%esp
 1ce:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 1d1:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 1d5:	79 07                	jns    1de <stat+0x26>
    return -1;
 1d7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 1dc:	eb 25                	jmp    203 <stat+0x4b>
  r = fstat(fd, st);
 1de:	83 ec 08             	sub    $0x8,%esp
 1e1:	ff 75 0c             	pushl  0xc(%ebp)
 1e4:	ff 75 f4             	pushl  -0xc(%ebp)
 1e7:	e8 03 01 00 00       	call   2ef <fstat>
 1ec:	83 c4 10             	add    $0x10,%esp
 1ef:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 1f2:	83 ec 0c             	sub    $0xc,%esp
 1f5:	ff 75 f4             	pushl  -0xc(%ebp)
 1f8:	e8 c2 00 00 00       	call   2bf <close>
 1fd:	83 c4 10             	add    $0x10,%esp
  return r;
 200:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 203:	c9                   	leave  
 204:	c3                   	ret    

00000205 <atoi>:

int
atoi(const char *s)
{
 205:	55                   	push   %ebp
 206:	89 e5                	mov    %esp,%ebp
 208:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 20b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 212:	eb 25                	jmp    239 <atoi+0x34>
    n = n*10 + *s++ - '0';
 214:	8b 55 fc             	mov    -0x4(%ebp),%edx
 217:	89 d0                	mov    %edx,%eax
 219:	c1 e0 02             	shl    $0x2,%eax
 21c:	01 d0                	add    %edx,%eax
 21e:	01 c0                	add    %eax,%eax
 220:	89 c1                	mov    %eax,%ecx
 222:	8b 45 08             	mov    0x8(%ebp),%eax
 225:	8d 50 01             	lea    0x1(%eax),%edx
 228:	89 55 08             	mov    %edx,0x8(%ebp)
 22b:	0f b6 00             	movzbl (%eax),%eax
 22e:	0f be c0             	movsbl %al,%eax
 231:	01 c8                	add    %ecx,%eax
 233:	83 e8 30             	sub    $0x30,%eax
 236:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 239:	8b 45 08             	mov    0x8(%ebp),%eax
 23c:	0f b6 00             	movzbl (%eax),%eax
 23f:	3c 2f                	cmp    $0x2f,%al
 241:	7e 0a                	jle    24d <atoi+0x48>
 243:	8b 45 08             	mov    0x8(%ebp),%eax
 246:	0f b6 00             	movzbl (%eax),%eax
 249:	3c 39                	cmp    $0x39,%al
 24b:	7e c7                	jle    214 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 24d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 250:	c9                   	leave  
 251:	c3                   	ret    

00000252 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 252:	55                   	push   %ebp
 253:	89 e5                	mov    %esp,%ebp
 255:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 258:	8b 45 08             	mov    0x8(%ebp),%eax
 25b:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 25e:	8b 45 0c             	mov    0xc(%ebp),%eax
 261:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 264:	eb 17                	jmp    27d <memmove+0x2b>
    *dst++ = *src++;
 266:	8b 45 fc             	mov    -0x4(%ebp),%eax
 269:	8d 50 01             	lea    0x1(%eax),%edx
 26c:	89 55 fc             	mov    %edx,-0x4(%ebp)
 26f:	8b 55 f8             	mov    -0x8(%ebp),%edx
 272:	8d 4a 01             	lea    0x1(%edx),%ecx
 275:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 278:	0f b6 12             	movzbl (%edx),%edx
 27b:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 27d:	8b 45 10             	mov    0x10(%ebp),%eax
 280:	8d 50 ff             	lea    -0x1(%eax),%edx
 283:	89 55 10             	mov    %edx,0x10(%ebp)
 286:	85 c0                	test   %eax,%eax
 288:	7f dc                	jg     266 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 28a:	8b 45 08             	mov    0x8(%ebp),%eax
}
 28d:	c9                   	leave  
 28e:	c3                   	ret    

0000028f <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 28f:	b8 01 00 00 00       	mov    $0x1,%eax
 294:	cd 40                	int    $0x40
 296:	c3                   	ret    

00000297 <exit>:
SYSCALL(exit)
 297:	b8 02 00 00 00       	mov    $0x2,%eax
 29c:	cd 40                	int    $0x40
 29e:	c3                   	ret    

0000029f <wait>:
SYSCALL(wait)
 29f:	b8 03 00 00 00       	mov    $0x3,%eax
 2a4:	cd 40                	int    $0x40
 2a6:	c3                   	ret    

000002a7 <pipe>:
SYSCALL(pipe)
 2a7:	b8 04 00 00 00       	mov    $0x4,%eax
 2ac:	cd 40                	int    $0x40
 2ae:	c3                   	ret    

000002af <read>:
SYSCALL(read)
 2af:	b8 05 00 00 00       	mov    $0x5,%eax
 2b4:	cd 40                	int    $0x40
 2b6:	c3                   	ret    

000002b7 <write>:
SYSCALL(write)
 2b7:	b8 10 00 00 00       	mov    $0x10,%eax
 2bc:	cd 40                	int    $0x40
 2be:	c3                   	ret    

000002bf <close>:
SYSCALL(close)
 2bf:	b8 15 00 00 00       	mov    $0x15,%eax
 2c4:	cd 40                	int    $0x40
 2c6:	c3                   	ret    

000002c7 <kill>:
SYSCALL(kill)
 2c7:	b8 06 00 00 00       	mov    $0x6,%eax
 2cc:	cd 40                	int    $0x40
 2ce:	c3                   	ret    

000002cf <exec>:
SYSCALL(exec)
 2cf:	b8 07 00 00 00       	mov    $0x7,%eax
 2d4:	cd 40                	int    $0x40
 2d6:	c3                   	ret    

000002d7 <open>:
SYSCALL(open)
 2d7:	b8 0f 00 00 00       	mov    $0xf,%eax
 2dc:	cd 40                	int    $0x40
 2de:	c3                   	ret    

000002df <mknod>:
SYSCALL(mknod)
 2df:	b8 11 00 00 00       	mov    $0x11,%eax
 2e4:	cd 40                	int    $0x40
 2e6:	c3                   	ret    

000002e7 <unlink>:
SYSCALL(unlink)
 2e7:	b8 12 00 00 00       	mov    $0x12,%eax
 2ec:	cd 40                	int    $0x40
 2ee:	c3                   	ret    

000002ef <fstat>:
SYSCALL(fstat)
 2ef:	b8 08 00 00 00       	mov    $0x8,%eax
 2f4:	cd 40                	int    $0x40
 2f6:	c3                   	ret    

000002f7 <link>:
SYSCALL(link)
 2f7:	b8 13 00 00 00       	mov    $0x13,%eax
 2fc:	cd 40                	int    $0x40
 2fe:	c3                   	ret    

000002ff <mkdir>:
SYSCALL(mkdir)
 2ff:	b8 14 00 00 00       	mov    $0x14,%eax
 304:	cd 40                	int    $0x40
 306:	c3                   	ret    

00000307 <chdir>:
SYSCALL(chdir)
 307:	b8 09 00 00 00       	mov    $0x9,%eax
 30c:	cd 40                	int    $0x40
 30e:	c3                   	ret    

0000030f <dup>:
SYSCALL(dup)
 30f:	b8 0a 00 00 00       	mov    $0xa,%eax
 314:	cd 40                	int    $0x40
 316:	c3                   	ret    

00000317 <getpid>:
SYSCALL(getpid)
 317:	b8 0b 00 00 00       	mov    $0xb,%eax
 31c:	cd 40                	int    $0x40
 31e:	c3                   	ret    

0000031f <getppid>:
SYSCALL(getppid)
 31f:	b8 18 00 00 00       	mov    $0x18,%eax
 324:	cd 40                	int    $0x40
 326:	c3                   	ret    

00000327 <getsyscallinfo>:
SYSCALL(getsyscallinfo)
 327:	b8 19 00 00 00       	mov    $0x19,%eax
 32c:	cd 40                	int    $0x40
 32e:	c3                   	ret    

0000032f <getAllPids>:
SYSCALL(getAllPids)
 32f:	b8 16 00 00 00       	mov    $0x16,%eax
 334:	cd 40                	int    $0x40
 336:	c3                   	ret    

00000337 <shutdown>:
SYSCALL(shutdown)
 337:	b8 17 00 00 00       	mov    $0x17,%eax
 33c:	cd 40                	int    $0x40
 33e:	c3                   	ret    

0000033f <sbrk>:
SYSCALL(sbrk)
 33f:	b8 0c 00 00 00       	mov    $0xc,%eax
 344:	cd 40                	int    $0x40
 346:	c3                   	ret    

00000347 <sleep>:
SYSCALL(sleep)
 347:	b8 0d 00 00 00       	mov    $0xd,%eax
 34c:	cd 40                	int    $0x40
 34e:	c3                   	ret    

0000034f <uptime>:
SYSCALL(uptime)
 34f:	b8 0e 00 00 00       	mov    $0xe,%eax
 354:	cd 40                	int    $0x40
 356:	c3                   	ret    

00000357 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 357:	55                   	push   %ebp
 358:	89 e5                	mov    %esp,%ebp
 35a:	83 ec 18             	sub    $0x18,%esp
 35d:	8b 45 0c             	mov    0xc(%ebp),%eax
 360:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 363:	83 ec 04             	sub    $0x4,%esp
 366:	6a 01                	push   $0x1
 368:	8d 45 f4             	lea    -0xc(%ebp),%eax
 36b:	50                   	push   %eax
 36c:	ff 75 08             	pushl  0x8(%ebp)
 36f:	e8 43 ff ff ff       	call   2b7 <write>
 374:	83 c4 10             	add    $0x10,%esp
}
 377:	90                   	nop
 378:	c9                   	leave  
 379:	c3                   	ret    

0000037a <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 37a:	55                   	push   %ebp
 37b:	89 e5                	mov    %esp,%ebp
 37d:	53                   	push   %ebx
 37e:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 381:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 388:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 38c:	74 17                	je     3a5 <printint+0x2b>
 38e:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 392:	79 11                	jns    3a5 <printint+0x2b>
    neg = 1;
 394:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 39b:	8b 45 0c             	mov    0xc(%ebp),%eax
 39e:	f7 d8                	neg    %eax
 3a0:	89 45 ec             	mov    %eax,-0x14(%ebp)
 3a3:	eb 06                	jmp    3ab <printint+0x31>
  } else {
    x = xx;
 3a5:	8b 45 0c             	mov    0xc(%ebp),%eax
 3a8:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 3ab:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 3b2:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 3b5:	8d 41 01             	lea    0x1(%ecx),%eax
 3b8:	89 45 f4             	mov    %eax,-0xc(%ebp)
 3bb:	8b 5d 10             	mov    0x10(%ebp),%ebx
 3be:	8b 45 ec             	mov    -0x14(%ebp),%eax
 3c1:	ba 00 00 00 00       	mov    $0x0,%edx
 3c6:	f7 f3                	div    %ebx
 3c8:	89 d0                	mov    %edx,%eax
 3ca:	0f b6 80 58 0a 00 00 	movzbl 0xa58(%eax),%eax
 3d1:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 3d5:	8b 5d 10             	mov    0x10(%ebp),%ebx
 3d8:	8b 45 ec             	mov    -0x14(%ebp),%eax
 3db:	ba 00 00 00 00       	mov    $0x0,%edx
 3e0:	f7 f3                	div    %ebx
 3e2:	89 45 ec             	mov    %eax,-0x14(%ebp)
 3e5:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 3e9:	75 c7                	jne    3b2 <printint+0x38>
  if(neg)
 3eb:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 3ef:	74 2d                	je     41e <printint+0xa4>
    buf[i++] = '-';
 3f1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3f4:	8d 50 01             	lea    0x1(%eax),%edx
 3f7:	89 55 f4             	mov    %edx,-0xc(%ebp)
 3fa:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 3ff:	eb 1d                	jmp    41e <printint+0xa4>
    putc(fd, buf[i]);
 401:	8d 55 dc             	lea    -0x24(%ebp),%edx
 404:	8b 45 f4             	mov    -0xc(%ebp),%eax
 407:	01 d0                	add    %edx,%eax
 409:	0f b6 00             	movzbl (%eax),%eax
 40c:	0f be c0             	movsbl %al,%eax
 40f:	83 ec 08             	sub    $0x8,%esp
 412:	50                   	push   %eax
 413:	ff 75 08             	pushl  0x8(%ebp)
 416:	e8 3c ff ff ff       	call   357 <putc>
 41b:	83 c4 10             	add    $0x10,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 41e:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 422:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 426:	79 d9                	jns    401 <printint+0x87>
    putc(fd, buf[i]);
}
 428:	90                   	nop
 429:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 42c:	c9                   	leave  
 42d:	c3                   	ret    

0000042e <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 42e:	55                   	push   %ebp
 42f:	89 e5                	mov    %esp,%ebp
 431:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 434:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 43b:	8d 45 0c             	lea    0xc(%ebp),%eax
 43e:	83 c0 04             	add    $0x4,%eax
 441:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 444:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 44b:	e9 59 01 00 00       	jmp    5a9 <printf+0x17b>
    c = fmt[i] & 0xff;
 450:	8b 55 0c             	mov    0xc(%ebp),%edx
 453:	8b 45 f0             	mov    -0x10(%ebp),%eax
 456:	01 d0                	add    %edx,%eax
 458:	0f b6 00             	movzbl (%eax),%eax
 45b:	0f be c0             	movsbl %al,%eax
 45e:	25 ff 00 00 00       	and    $0xff,%eax
 463:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 466:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 46a:	75 2c                	jne    498 <printf+0x6a>
      if(c == '%'){
 46c:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 470:	75 0c                	jne    47e <printf+0x50>
        state = '%';
 472:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 479:	e9 27 01 00 00       	jmp    5a5 <printf+0x177>
      } else {
        putc(fd, c);
 47e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 481:	0f be c0             	movsbl %al,%eax
 484:	83 ec 08             	sub    $0x8,%esp
 487:	50                   	push   %eax
 488:	ff 75 08             	pushl  0x8(%ebp)
 48b:	e8 c7 fe ff ff       	call   357 <putc>
 490:	83 c4 10             	add    $0x10,%esp
 493:	e9 0d 01 00 00       	jmp    5a5 <printf+0x177>
      }
    } else if(state == '%'){
 498:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 49c:	0f 85 03 01 00 00    	jne    5a5 <printf+0x177>
      if(c == 'd'){
 4a2:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 4a6:	75 1e                	jne    4c6 <printf+0x98>
        printint(fd, *ap, 10, 1);
 4a8:	8b 45 e8             	mov    -0x18(%ebp),%eax
 4ab:	8b 00                	mov    (%eax),%eax
 4ad:	6a 01                	push   $0x1
 4af:	6a 0a                	push   $0xa
 4b1:	50                   	push   %eax
 4b2:	ff 75 08             	pushl  0x8(%ebp)
 4b5:	e8 c0 fe ff ff       	call   37a <printint>
 4ba:	83 c4 10             	add    $0x10,%esp
        ap++;
 4bd:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 4c1:	e9 d8 00 00 00       	jmp    59e <printf+0x170>
      } else if(c == 'x' || c == 'p'){
 4c6:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 4ca:	74 06                	je     4d2 <printf+0xa4>
 4cc:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 4d0:	75 1e                	jne    4f0 <printf+0xc2>
        printint(fd, *ap, 16, 0);
 4d2:	8b 45 e8             	mov    -0x18(%ebp),%eax
 4d5:	8b 00                	mov    (%eax),%eax
 4d7:	6a 00                	push   $0x0
 4d9:	6a 10                	push   $0x10
 4db:	50                   	push   %eax
 4dc:	ff 75 08             	pushl  0x8(%ebp)
 4df:	e8 96 fe ff ff       	call   37a <printint>
 4e4:	83 c4 10             	add    $0x10,%esp
        ap++;
 4e7:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 4eb:	e9 ae 00 00 00       	jmp    59e <printf+0x170>
      } else if(c == 's'){
 4f0:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 4f4:	75 43                	jne    539 <printf+0x10b>
        s = (char*)*ap;
 4f6:	8b 45 e8             	mov    -0x18(%ebp),%eax
 4f9:	8b 00                	mov    (%eax),%eax
 4fb:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 4fe:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 502:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 506:	75 25                	jne    52d <printf+0xff>
          s = "(null)";
 508:	c7 45 f4 09 08 00 00 	movl   $0x809,-0xc(%ebp)
        while(*s != 0){
 50f:	eb 1c                	jmp    52d <printf+0xff>
          putc(fd, *s);
 511:	8b 45 f4             	mov    -0xc(%ebp),%eax
 514:	0f b6 00             	movzbl (%eax),%eax
 517:	0f be c0             	movsbl %al,%eax
 51a:	83 ec 08             	sub    $0x8,%esp
 51d:	50                   	push   %eax
 51e:	ff 75 08             	pushl  0x8(%ebp)
 521:	e8 31 fe ff ff       	call   357 <putc>
 526:	83 c4 10             	add    $0x10,%esp
          s++;
 529:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 52d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 530:	0f b6 00             	movzbl (%eax),%eax
 533:	84 c0                	test   %al,%al
 535:	75 da                	jne    511 <printf+0xe3>
 537:	eb 65                	jmp    59e <printf+0x170>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 539:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 53d:	75 1d                	jne    55c <printf+0x12e>
        putc(fd, *ap);
 53f:	8b 45 e8             	mov    -0x18(%ebp),%eax
 542:	8b 00                	mov    (%eax),%eax
 544:	0f be c0             	movsbl %al,%eax
 547:	83 ec 08             	sub    $0x8,%esp
 54a:	50                   	push   %eax
 54b:	ff 75 08             	pushl  0x8(%ebp)
 54e:	e8 04 fe ff ff       	call   357 <putc>
 553:	83 c4 10             	add    $0x10,%esp
        ap++;
 556:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 55a:	eb 42                	jmp    59e <printf+0x170>
      } else if(c == '%'){
 55c:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 560:	75 17                	jne    579 <printf+0x14b>
        putc(fd, c);
 562:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 565:	0f be c0             	movsbl %al,%eax
 568:	83 ec 08             	sub    $0x8,%esp
 56b:	50                   	push   %eax
 56c:	ff 75 08             	pushl  0x8(%ebp)
 56f:	e8 e3 fd ff ff       	call   357 <putc>
 574:	83 c4 10             	add    $0x10,%esp
 577:	eb 25                	jmp    59e <printf+0x170>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 579:	83 ec 08             	sub    $0x8,%esp
 57c:	6a 25                	push   $0x25
 57e:	ff 75 08             	pushl  0x8(%ebp)
 581:	e8 d1 fd ff ff       	call   357 <putc>
 586:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
 589:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 58c:	0f be c0             	movsbl %al,%eax
 58f:	83 ec 08             	sub    $0x8,%esp
 592:	50                   	push   %eax
 593:	ff 75 08             	pushl  0x8(%ebp)
 596:	e8 bc fd ff ff       	call   357 <putc>
 59b:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 59e:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 5a5:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 5a9:	8b 55 0c             	mov    0xc(%ebp),%edx
 5ac:	8b 45 f0             	mov    -0x10(%ebp),%eax
 5af:	01 d0                	add    %edx,%eax
 5b1:	0f b6 00             	movzbl (%eax),%eax
 5b4:	84 c0                	test   %al,%al
 5b6:	0f 85 94 fe ff ff    	jne    450 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 5bc:	90                   	nop
 5bd:	c9                   	leave  
 5be:	c3                   	ret    

000005bf <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 5bf:	55                   	push   %ebp
 5c0:	89 e5                	mov    %esp,%ebp
 5c2:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 5c5:	8b 45 08             	mov    0x8(%ebp),%eax
 5c8:	83 e8 08             	sub    $0x8,%eax
 5cb:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5ce:	a1 74 0a 00 00       	mov    0xa74,%eax
 5d3:	89 45 fc             	mov    %eax,-0x4(%ebp)
 5d6:	eb 24                	jmp    5fc <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5d8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 5db:	8b 00                	mov    (%eax),%eax
 5dd:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 5e0:	77 12                	ja     5f4 <free+0x35>
 5e2:	8b 45 f8             	mov    -0x8(%ebp),%eax
 5e5:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 5e8:	77 24                	ja     60e <free+0x4f>
 5ea:	8b 45 fc             	mov    -0x4(%ebp),%eax
 5ed:	8b 00                	mov    (%eax),%eax
 5ef:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 5f2:	77 1a                	ja     60e <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5f4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 5f7:	8b 00                	mov    (%eax),%eax
 5f9:	89 45 fc             	mov    %eax,-0x4(%ebp)
 5fc:	8b 45 f8             	mov    -0x8(%ebp),%eax
 5ff:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 602:	76 d4                	jbe    5d8 <free+0x19>
 604:	8b 45 fc             	mov    -0x4(%ebp),%eax
 607:	8b 00                	mov    (%eax),%eax
 609:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 60c:	76 ca                	jbe    5d8 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 60e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 611:	8b 40 04             	mov    0x4(%eax),%eax
 614:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 61b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 61e:	01 c2                	add    %eax,%edx
 620:	8b 45 fc             	mov    -0x4(%ebp),%eax
 623:	8b 00                	mov    (%eax),%eax
 625:	39 c2                	cmp    %eax,%edx
 627:	75 24                	jne    64d <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 629:	8b 45 f8             	mov    -0x8(%ebp),%eax
 62c:	8b 50 04             	mov    0x4(%eax),%edx
 62f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 632:	8b 00                	mov    (%eax),%eax
 634:	8b 40 04             	mov    0x4(%eax),%eax
 637:	01 c2                	add    %eax,%edx
 639:	8b 45 f8             	mov    -0x8(%ebp),%eax
 63c:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 63f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 642:	8b 00                	mov    (%eax),%eax
 644:	8b 10                	mov    (%eax),%edx
 646:	8b 45 f8             	mov    -0x8(%ebp),%eax
 649:	89 10                	mov    %edx,(%eax)
 64b:	eb 0a                	jmp    657 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 64d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 650:	8b 10                	mov    (%eax),%edx
 652:	8b 45 f8             	mov    -0x8(%ebp),%eax
 655:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 657:	8b 45 fc             	mov    -0x4(%ebp),%eax
 65a:	8b 40 04             	mov    0x4(%eax),%eax
 65d:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 664:	8b 45 fc             	mov    -0x4(%ebp),%eax
 667:	01 d0                	add    %edx,%eax
 669:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 66c:	75 20                	jne    68e <free+0xcf>
    p->s.size += bp->s.size;
 66e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 671:	8b 50 04             	mov    0x4(%eax),%edx
 674:	8b 45 f8             	mov    -0x8(%ebp),%eax
 677:	8b 40 04             	mov    0x4(%eax),%eax
 67a:	01 c2                	add    %eax,%edx
 67c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 67f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 682:	8b 45 f8             	mov    -0x8(%ebp),%eax
 685:	8b 10                	mov    (%eax),%edx
 687:	8b 45 fc             	mov    -0x4(%ebp),%eax
 68a:	89 10                	mov    %edx,(%eax)
 68c:	eb 08                	jmp    696 <free+0xd7>
  } else
    p->s.ptr = bp;
 68e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 691:	8b 55 f8             	mov    -0x8(%ebp),%edx
 694:	89 10                	mov    %edx,(%eax)
  freep = p;
 696:	8b 45 fc             	mov    -0x4(%ebp),%eax
 699:	a3 74 0a 00 00       	mov    %eax,0xa74
}
 69e:	90                   	nop
 69f:	c9                   	leave  
 6a0:	c3                   	ret    

000006a1 <morecore>:

static Header*
morecore(uint nu)
{
 6a1:	55                   	push   %ebp
 6a2:	89 e5                	mov    %esp,%ebp
 6a4:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 6a7:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 6ae:	77 07                	ja     6b7 <morecore+0x16>
    nu = 4096;
 6b0:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 6b7:	8b 45 08             	mov    0x8(%ebp),%eax
 6ba:	c1 e0 03             	shl    $0x3,%eax
 6bd:	83 ec 0c             	sub    $0xc,%esp
 6c0:	50                   	push   %eax
 6c1:	e8 79 fc ff ff       	call   33f <sbrk>
 6c6:	83 c4 10             	add    $0x10,%esp
 6c9:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 6cc:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 6d0:	75 07                	jne    6d9 <morecore+0x38>
    return 0;
 6d2:	b8 00 00 00 00       	mov    $0x0,%eax
 6d7:	eb 26                	jmp    6ff <morecore+0x5e>
  hp = (Header*)p;
 6d9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6dc:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 6df:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6e2:	8b 55 08             	mov    0x8(%ebp),%edx
 6e5:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 6e8:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6eb:	83 c0 08             	add    $0x8,%eax
 6ee:	83 ec 0c             	sub    $0xc,%esp
 6f1:	50                   	push   %eax
 6f2:	e8 c8 fe ff ff       	call   5bf <free>
 6f7:	83 c4 10             	add    $0x10,%esp
  return freep;
 6fa:	a1 74 0a 00 00       	mov    0xa74,%eax
}
 6ff:	c9                   	leave  
 700:	c3                   	ret    

00000701 <malloc>:

void*
malloc(uint nbytes)
{
 701:	55                   	push   %ebp
 702:	89 e5                	mov    %esp,%ebp
 704:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 707:	8b 45 08             	mov    0x8(%ebp),%eax
 70a:	83 c0 07             	add    $0x7,%eax
 70d:	c1 e8 03             	shr    $0x3,%eax
 710:	83 c0 01             	add    $0x1,%eax
 713:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 716:	a1 74 0a 00 00       	mov    0xa74,%eax
 71b:	89 45 f0             	mov    %eax,-0x10(%ebp)
 71e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 722:	75 23                	jne    747 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 724:	c7 45 f0 6c 0a 00 00 	movl   $0xa6c,-0x10(%ebp)
 72b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 72e:	a3 74 0a 00 00       	mov    %eax,0xa74
 733:	a1 74 0a 00 00       	mov    0xa74,%eax
 738:	a3 6c 0a 00 00       	mov    %eax,0xa6c
    base.s.size = 0;
 73d:	c7 05 70 0a 00 00 00 	movl   $0x0,0xa70
 744:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 747:	8b 45 f0             	mov    -0x10(%ebp),%eax
 74a:	8b 00                	mov    (%eax),%eax
 74c:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 74f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 752:	8b 40 04             	mov    0x4(%eax),%eax
 755:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 758:	72 4d                	jb     7a7 <malloc+0xa6>
      if(p->s.size == nunits)
 75a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 75d:	8b 40 04             	mov    0x4(%eax),%eax
 760:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 763:	75 0c                	jne    771 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 765:	8b 45 f4             	mov    -0xc(%ebp),%eax
 768:	8b 10                	mov    (%eax),%edx
 76a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 76d:	89 10                	mov    %edx,(%eax)
 76f:	eb 26                	jmp    797 <malloc+0x96>
      else {
        p->s.size -= nunits;
 771:	8b 45 f4             	mov    -0xc(%ebp),%eax
 774:	8b 40 04             	mov    0x4(%eax),%eax
 777:	2b 45 ec             	sub    -0x14(%ebp),%eax
 77a:	89 c2                	mov    %eax,%edx
 77c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 77f:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 782:	8b 45 f4             	mov    -0xc(%ebp),%eax
 785:	8b 40 04             	mov    0x4(%eax),%eax
 788:	c1 e0 03             	shl    $0x3,%eax
 78b:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 78e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 791:	8b 55 ec             	mov    -0x14(%ebp),%edx
 794:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 797:	8b 45 f0             	mov    -0x10(%ebp),%eax
 79a:	a3 74 0a 00 00       	mov    %eax,0xa74
      return (void*)(p + 1);
 79f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7a2:	83 c0 08             	add    $0x8,%eax
 7a5:	eb 3b                	jmp    7e2 <malloc+0xe1>
    }
    if(p == freep)
 7a7:	a1 74 0a 00 00       	mov    0xa74,%eax
 7ac:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 7af:	75 1e                	jne    7cf <malloc+0xce>
      if((p = morecore(nunits)) == 0)
 7b1:	83 ec 0c             	sub    $0xc,%esp
 7b4:	ff 75 ec             	pushl  -0x14(%ebp)
 7b7:	e8 e5 fe ff ff       	call   6a1 <morecore>
 7bc:	83 c4 10             	add    $0x10,%esp
 7bf:	89 45 f4             	mov    %eax,-0xc(%ebp)
 7c2:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 7c6:	75 07                	jne    7cf <malloc+0xce>
        return 0;
 7c8:	b8 00 00 00 00       	mov    $0x0,%eax
 7cd:	eb 13                	jmp    7e2 <malloc+0xe1>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7cf:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7d2:	89 45 f0             	mov    %eax,-0x10(%ebp)
 7d5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7d8:	8b 00                	mov    (%eax),%eax
 7da:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 7dd:	e9 6d ff ff ff       	jmp    74f <malloc+0x4e>
}
 7e2:	c9                   	leave  
 7e3:	c3                   	ret    
