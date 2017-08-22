
_listPid:     file format elf32-i386


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
   d:	53                   	push   %ebx
   e:	51                   	push   %ecx
   f:	81 ec 10 08 00 00    	sub    $0x810,%esp
	
	printf(1, "Process scheduling statistics:\n");
  15:	83 ec 08             	sub    $0x8,%esp
  18:	68 6c 08 00 00       	push   $0x86c
  1d:	6a 01                	push   $0x1
  1f:	e8 92 04 00 00       	call   4b6 <printf>
  24:	83 c4 10             	add    $0x10,%esp
  printf(1, "Slot\tPID\tHigh\tLow\n");
  27:	83 ec 08             	sub    $0x8,%esp
  2a:	68 8c 08 00 00       	push   $0x88c
  2f:	6a 01                	push   $0x1
  31:	e8 80 04 00 00       	call   4b6 <printf>
  36:	83 c4 10             	add    $0x10,%esp
  struct pstat st;
  getAllPids(&st);
  39:	83 ec 0c             	sub    $0xc,%esp
  3c:	8d 85 f4 f7 ff ff    	lea    -0x80c(%ebp),%eax
  42:	50                   	push   %eax
  43:	e8 6f 03 00 00       	call   3b7 <getAllPids>
  48:	83 c4 10             	add    $0x10,%esp
  int i;
  for(i = 0; i < NPROC; i++)
  4b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  52:	eb 69                	jmp    bd <main+0xbd>
  		if(st.inuse[i])
  54:	8b 45 f4             	mov    -0xc(%ebp),%eax
  57:	8b 84 85 f4 f7 ff ff 	mov    -0x80c(%ebp,%eax,4),%eax
  5e:	85 c0                	test   %eax,%eax
  60:	74 57                	je     b9 <main+0xb9>
  			printf(i, "%d\t%d\t%d\t%d\t%s\n", i, st.pid[i], st.hticks[i], st.lticks[i],st.name[i]);
  62:	8d 85 f4 f7 ff ff    	lea    -0x80c(%ebp),%eax
  68:	8b 55 f4             	mov    -0xc(%ebp),%edx
  6b:	83 c2 20             	add    $0x20,%edx
  6e:	c1 e2 04             	shl    $0x4,%edx
  71:	8d 1c 10             	lea    (%eax,%edx,1),%ebx
  74:	8b 45 f4             	mov    -0xc(%ebp),%eax
  77:	05 c0 01 00 00       	add    $0x1c0,%eax
  7c:	8b 8c 85 f4 f7 ff ff 	mov    -0x80c(%ebp,%eax,4),%ecx
  83:	8b 45 f4             	mov    -0xc(%ebp),%eax
  86:	05 80 01 00 00       	add    $0x180,%eax
  8b:	8b 94 85 f4 f7 ff ff 	mov    -0x80c(%ebp,%eax,4),%edx
  92:	8b 45 f4             	mov    -0xc(%ebp),%eax
  95:	83 c0 40             	add    $0x40,%eax
  98:	8b 84 85 f4 f7 ff ff 	mov    -0x80c(%ebp,%eax,4),%eax
  9f:	83 ec 04             	sub    $0x4,%esp
  a2:	53                   	push   %ebx
  a3:	51                   	push   %ecx
  a4:	52                   	push   %edx
  a5:	50                   	push   %eax
  a6:	ff 75 f4             	pushl  -0xc(%ebp)
  a9:	68 9f 08 00 00       	push   $0x89f
  ae:	ff 75 f4             	pushl  -0xc(%ebp)
  b1:	e8 00 04 00 00       	call   4b6 <printf>
  b6:	83 c4 20             	add    $0x20,%esp
	printf(1, "Process scheduling statistics:\n");
  printf(1, "Slot\tPID\tHigh\tLow\n");
  struct pstat st;
  getAllPids(&st);
  int i;
  for(i = 0; i < NPROC; i++)
  b9:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  bd:	83 7d f4 3f          	cmpl   $0x3f,-0xc(%ebp)
  c1:	7e 91                	jle    54 <main+0x54>
  		if(st.inuse[i])
  			printf(i, "%d\t%d\t%d\t%d\t%s\n", i, st.pid[i], st.hticks[i], st.lticks[i],st.name[i]);

	exit();
  c3:	e8 57 02 00 00       	call   31f <exit>

000000c8 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  c8:	55                   	push   %ebp
  c9:	89 e5                	mov    %esp,%ebp
  cb:	57                   	push   %edi
  cc:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  cd:	8b 4d 08             	mov    0x8(%ebp),%ecx
  d0:	8b 55 10             	mov    0x10(%ebp),%edx
  d3:	8b 45 0c             	mov    0xc(%ebp),%eax
  d6:	89 cb                	mov    %ecx,%ebx
  d8:	89 df                	mov    %ebx,%edi
  da:	89 d1                	mov    %edx,%ecx
  dc:	fc                   	cld    
  dd:	f3 aa                	rep stos %al,%es:(%edi)
  df:	89 ca                	mov    %ecx,%edx
  e1:	89 fb                	mov    %edi,%ebx
  e3:	89 5d 08             	mov    %ebx,0x8(%ebp)
  e6:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  e9:	90                   	nop
  ea:	5b                   	pop    %ebx
  eb:	5f                   	pop    %edi
  ec:	5d                   	pop    %ebp
  ed:	c3                   	ret    

000000ee <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  ee:	55                   	push   %ebp
  ef:	89 e5                	mov    %esp,%ebp
  f1:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  f4:	8b 45 08             	mov    0x8(%ebp),%eax
  f7:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  fa:	90                   	nop
  fb:	8b 45 08             	mov    0x8(%ebp),%eax
  fe:	8d 50 01             	lea    0x1(%eax),%edx
 101:	89 55 08             	mov    %edx,0x8(%ebp)
 104:	8b 55 0c             	mov    0xc(%ebp),%edx
 107:	8d 4a 01             	lea    0x1(%edx),%ecx
 10a:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 10d:	0f b6 12             	movzbl (%edx),%edx
 110:	88 10                	mov    %dl,(%eax)
 112:	0f b6 00             	movzbl (%eax),%eax
 115:	84 c0                	test   %al,%al
 117:	75 e2                	jne    fb <strcpy+0xd>
    ;
  return os;
 119:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 11c:	c9                   	leave  
 11d:	c3                   	ret    

0000011e <strcmp>:

int
strcmp(const char *p, const char *q)
{
 11e:	55                   	push   %ebp
 11f:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 121:	eb 08                	jmp    12b <strcmp+0xd>
    p++, q++;
 123:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 127:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 12b:	8b 45 08             	mov    0x8(%ebp),%eax
 12e:	0f b6 00             	movzbl (%eax),%eax
 131:	84 c0                	test   %al,%al
 133:	74 10                	je     145 <strcmp+0x27>
 135:	8b 45 08             	mov    0x8(%ebp),%eax
 138:	0f b6 10             	movzbl (%eax),%edx
 13b:	8b 45 0c             	mov    0xc(%ebp),%eax
 13e:	0f b6 00             	movzbl (%eax),%eax
 141:	38 c2                	cmp    %al,%dl
 143:	74 de                	je     123 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 145:	8b 45 08             	mov    0x8(%ebp),%eax
 148:	0f b6 00             	movzbl (%eax),%eax
 14b:	0f b6 d0             	movzbl %al,%edx
 14e:	8b 45 0c             	mov    0xc(%ebp),%eax
 151:	0f b6 00             	movzbl (%eax),%eax
 154:	0f b6 c0             	movzbl %al,%eax
 157:	29 c2                	sub    %eax,%edx
 159:	89 d0                	mov    %edx,%eax
}
 15b:	5d                   	pop    %ebp
 15c:	c3                   	ret    

0000015d <strlen>:

uint
strlen(char *s)
{
 15d:	55                   	push   %ebp
 15e:	89 e5                	mov    %esp,%ebp
 160:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 163:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 16a:	eb 04                	jmp    170 <strlen+0x13>
 16c:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 170:	8b 55 fc             	mov    -0x4(%ebp),%edx
 173:	8b 45 08             	mov    0x8(%ebp),%eax
 176:	01 d0                	add    %edx,%eax
 178:	0f b6 00             	movzbl (%eax),%eax
 17b:	84 c0                	test   %al,%al
 17d:	75 ed                	jne    16c <strlen+0xf>
    ;
  return n;
 17f:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 182:	c9                   	leave  
 183:	c3                   	ret    

00000184 <memset>:

void*
memset(void *dst, int c, uint n)
{
 184:	55                   	push   %ebp
 185:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
 187:	8b 45 10             	mov    0x10(%ebp),%eax
 18a:	50                   	push   %eax
 18b:	ff 75 0c             	pushl  0xc(%ebp)
 18e:	ff 75 08             	pushl  0x8(%ebp)
 191:	e8 32 ff ff ff       	call   c8 <stosb>
 196:	83 c4 0c             	add    $0xc,%esp
  return dst;
 199:	8b 45 08             	mov    0x8(%ebp),%eax
}
 19c:	c9                   	leave  
 19d:	c3                   	ret    

0000019e <strchr>:

char*
strchr(const char *s, char c)
{
 19e:	55                   	push   %ebp
 19f:	89 e5                	mov    %esp,%ebp
 1a1:	83 ec 04             	sub    $0x4,%esp
 1a4:	8b 45 0c             	mov    0xc(%ebp),%eax
 1a7:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 1aa:	eb 14                	jmp    1c0 <strchr+0x22>
    if(*s == c)
 1ac:	8b 45 08             	mov    0x8(%ebp),%eax
 1af:	0f b6 00             	movzbl (%eax),%eax
 1b2:	3a 45 fc             	cmp    -0x4(%ebp),%al
 1b5:	75 05                	jne    1bc <strchr+0x1e>
      return (char*)s;
 1b7:	8b 45 08             	mov    0x8(%ebp),%eax
 1ba:	eb 13                	jmp    1cf <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 1bc:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 1c0:	8b 45 08             	mov    0x8(%ebp),%eax
 1c3:	0f b6 00             	movzbl (%eax),%eax
 1c6:	84 c0                	test   %al,%al
 1c8:	75 e2                	jne    1ac <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 1ca:	b8 00 00 00 00       	mov    $0x0,%eax
}
 1cf:	c9                   	leave  
 1d0:	c3                   	ret    

000001d1 <gets>:

char*
gets(char *buf, int max)
{
 1d1:	55                   	push   %ebp
 1d2:	89 e5                	mov    %esp,%ebp
 1d4:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1d7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 1de:	eb 42                	jmp    222 <gets+0x51>
    cc = read(0, &c, 1);
 1e0:	83 ec 04             	sub    $0x4,%esp
 1e3:	6a 01                	push   $0x1
 1e5:	8d 45 ef             	lea    -0x11(%ebp),%eax
 1e8:	50                   	push   %eax
 1e9:	6a 00                	push   $0x0
 1eb:	e8 47 01 00 00       	call   337 <read>
 1f0:	83 c4 10             	add    $0x10,%esp
 1f3:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 1f6:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 1fa:	7e 33                	jle    22f <gets+0x5e>
      break;
    buf[i++] = c;
 1fc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1ff:	8d 50 01             	lea    0x1(%eax),%edx
 202:	89 55 f4             	mov    %edx,-0xc(%ebp)
 205:	89 c2                	mov    %eax,%edx
 207:	8b 45 08             	mov    0x8(%ebp),%eax
 20a:	01 c2                	add    %eax,%edx
 20c:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 210:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 212:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 216:	3c 0a                	cmp    $0xa,%al
 218:	74 16                	je     230 <gets+0x5f>
 21a:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 21e:	3c 0d                	cmp    $0xd,%al
 220:	74 0e                	je     230 <gets+0x5f>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 222:	8b 45 f4             	mov    -0xc(%ebp),%eax
 225:	83 c0 01             	add    $0x1,%eax
 228:	3b 45 0c             	cmp    0xc(%ebp),%eax
 22b:	7c b3                	jl     1e0 <gets+0xf>
 22d:	eb 01                	jmp    230 <gets+0x5f>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 22f:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 230:	8b 55 f4             	mov    -0xc(%ebp),%edx
 233:	8b 45 08             	mov    0x8(%ebp),%eax
 236:	01 d0                	add    %edx,%eax
 238:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 23b:	8b 45 08             	mov    0x8(%ebp),%eax
}
 23e:	c9                   	leave  
 23f:	c3                   	ret    

00000240 <stat>:

int
stat(char *n, struct stat *st)
{
 240:	55                   	push   %ebp
 241:	89 e5                	mov    %esp,%ebp
 243:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 246:	83 ec 08             	sub    $0x8,%esp
 249:	6a 00                	push   $0x0
 24b:	ff 75 08             	pushl  0x8(%ebp)
 24e:	e8 0c 01 00 00       	call   35f <open>
 253:	83 c4 10             	add    $0x10,%esp
 256:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 259:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 25d:	79 07                	jns    266 <stat+0x26>
    return -1;
 25f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 264:	eb 25                	jmp    28b <stat+0x4b>
  r = fstat(fd, st);
 266:	83 ec 08             	sub    $0x8,%esp
 269:	ff 75 0c             	pushl  0xc(%ebp)
 26c:	ff 75 f4             	pushl  -0xc(%ebp)
 26f:	e8 03 01 00 00       	call   377 <fstat>
 274:	83 c4 10             	add    $0x10,%esp
 277:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 27a:	83 ec 0c             	sub    $0xc,%esp
 27d:	ff 75 f4             	pushl  -0xc(%ebp)
 280:	e8 c2 00 00 00       	call   347 <close>
 285:	83 c4 10             	add    $0x10,%esp
  return r;
 288:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 28b:	c9                   	leave  
 28c:	c3                   	ret    

0000028d <atoi>:

int
atoi(const char *s)
{
 28d:	55                   	push   %ebp
 28e:	89 e5                	mov    %esp,%ebp
 290:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 293:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 29a:	eb 25                	jmp    2c1 <atoi+0x34>
    n = n*10 + *s++ - '0';
 29c:	8b 55 fc             	mov    -0x4(%ebp),%edx
 29f:	89 d0                	mov    %edx,%eax
 2a1:	c1 e0 02             	shl    $0x2,%eax
 2a4:	01 d0                	add    %edx,%eax
 2a6:	01 c0                	add    %eax,%eax
 2a8:	89 c1                	mov    %eax,%ecx
 2aa:	8b 45 08             	mov    0x8(%ebp),%eax
 2ad:	8d 50 01             	lea    0x1(%eax),%edx
 2b0:	89 55 08             	mov    %edx,0x8(%ebp)
 2b3:	0f b6 00             	movzbl (%eax),%eax
 2b6:	0f be c0             	movsbl %al,%eax
 2b9:	01 c8                	add    %ecx,%eax
 2bb:	83 e8 30             	sub    $0x30,%eax
 2be:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2c1:	8b 45 08             	mov    0x8(%ebp),%eax
 2c4:	0f b6 00             	movzbl (%eax),%eax
 2c7:	3c 2f                	cmp    $0x2f,%al
 2c9:	7e 0a                	jle    2d5 <atoi+0x48>
 2cb:	8b 45 08             	mov    0x8(%ebp),%eax
 2ce:	0f b6 00             	movzbl (%eax),%eax
 2d1:	3c 39                	cmp    $0x39,%al
 2d3:	7e c7                	jle    29c <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 2d5:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 2d8:	c9                   	leave  
 2d9:	c3                   	ret    

000002da <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 2da:	55                   	push   %ebp
 2db:	89 e5                	mov    %esp,%ebp
 2dd:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 2e0:	8b 45 08             	mov    0x8(%ebp),%eax
 2e3:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 2e6:	8b 45 0c             	mov    0xc(%ebp),%eax
 2e9:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 2ec:	eb 17                	jmp    305 <memmove+0x2b>
    *dst++ = *src++;
 2ee:	8b 45 fc             	mov    -0x4(%ebp),%eax
 2f1:	8d 50 01             	lea    0x1(%eax),%edx
 2f4:	89 55 fc             	mov    %edx,-0x4(%ebp)
 2f7:	8b 55 f8             	mov    -0x8(%ebp),%edx
 2fa:	8d 4a 01             	lea    0x1(%edx),%ecx
 2fd:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 300:	0f b6 12             	movzbl (%edx),%edx
 303:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 305:	8b 45 10             	mov    0x10(%ebp),%eax
 308:	8d 50 ff             	lea    -0x1(%eax),%edx
 30b:	89 55 10             	mov    %edx,0x10(%ebp)
 30e:	85 c0                	test   %eax,%eax
 310:	7f dc                	jg     2ee <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 312:	8b 45 08             	mov    0x8(%ebp),%eax
}
 315:	c9                   	leave  
 316:	c3                   	ret    

00000317 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 317:	b8 01 00 00 00       	mov    $0x1,%eax
 31c:	cd 40                	int    $0x40
 31e:	c3                   	ret    

0000031f <exit>:
SYSCALL(exit)
 31f:	b8 02 00 00 00       	mov    $0x2,%eax
 324:	cd 40                	int    $0x40
 326:	c3                   	ret    

00000327 <wait>:
SYSCALL(wait)
 327:	b8 03 00 00 00       	mov    $0x3,%eax
 32c:	cd 40                	int    $0x40
 32e:	c3                   	ret    

0000032f <pipe>:
SYSCALL(pipe)
 32f:	b8 04 00 00 00       	mov    $0x4,%eax
 334:	cd 40                	int    $0x40
 336:	c3                   	ret    

00000337 <read>:
SYSCALL(read)
 337:	b8 05 00 00 00       	mov    $0x5,%eax
 33c:	cd 40                	int    $0x40
 33e:	c3                   	ret    

0000033f <write>:
SYSCALL(write)
 33f:	b8 10 00 00 00       	mov    $0x10,%eax
 344:	cd 40                	int    $0x40
 346:	c3                   	ret    

00000347 <close>:
SYSCALL(close)
 347:	b8 15 00 00 00       	mov    $0x15,%eax
 34c:	cd 40                	int    $0x40
 34e:	c3                   	ret    

0000034f <kill>:
SYSCALL(kill)
 34f:	b8 06 00 00 00       	mov    $0x6,%eax
 354:	cd 40                	int    $0x40
 356:	c3                   	ret    

00000357 <exec>:
SYSCALL(exec)
 357:	b8 07 00 00 00       	mov    $0x7,%eax
 35c:	cd 40                	int    $0x40
 35e:	c3                   	ret    

0000035f <open>:
SYSCALL(open)
 35f:	b8 0f 00 00 00       	mov    $0xf,%eax
 364:	cd 40                	int    $0x40
 366:	c3                   	ret    

00000367 <mknod>:
SYSCALL(mknod)
 367:	b8 11 00 00 00       	mov    $0x11,%eax
 36c:	cd 40                	int    $0x40
 36e:	c3                   	ret    

0000036f <unlink>:
SYSCALL(unlink)
 36f:	b8 12 00 00 00       	mov    $0x12,%eax
 374:	cd 40                	int    $0x40
 376:	c3                   	ret    

00000377 <fstat>:
SYSCALL(fstat)
 377:	b8 08 00 00 00       	mov    $0x8,%eax
 37c:	cd 40                	int    $0x40
 37e:	c3                   	ret    

0000037f <link>:
SYSCALL(link)
 37f:	b8 13 00 00 00       	mov    $0x13,%eax
 384:	cd 40                	int    $0x40
 386:	c3                   	ret    

00000387 <mkdir>:
SYSCALL(mkdir)
 387:	b8 14 00 00 00       	mov    $0x14,%eax
 38c:	cd 40                	int    $0x40
 38e:	c3                   	ret    

0000038f <chdir>:
SYSCALL(chdir)
 38f:	b8 09 00 00 00       	mov    $0x9,%eax
 394:	cd 40                	int    $0x40
 396:	c3                   	ret    

00000397 <dup>:
SYSCALL(dup)
 397:	b8 0a 00 00 00       	mov    $0xa,%eax
 39c:	cd 40                	int    $0x40
 39e:	c3                   	ret    

0000039f <getpid>:
SYSCALL(getpid)
 39f:	b8 0b 00 00 00       	mov    $0xb,%eax
 3a4:	cd 40                	int    $0x40
 3a6:	c3                   	ret    

000003a7 <getppid>:
SYSCALL(getppid)
 3a7:	b8 18 00 00 00       	mov    $0x18,%eax
 3ac:	cd 40                	int    $0x40
 3ae:	c3                   	ret    

000003af <getsyscallinfo>:
SYSCALL(getsyscallinfo)
 3af:	b8 19 00 00 00       	mov    $0x19,%eax
 3b4:	cd 40                	int    $0x40
 3b6:	c3                   	ret    

000003b7 <getAllPids>:
SYSCALL(getAllPids)
 3b7:	b8 16 00 00 00       	mov    $0x16,%eax
 3bc:	cd 40                	int    $0x40
 3be:	c3                   	ret    

000003bf <shutdown>:
SYSCALL(shutdown)
 3bf:	b8 17 00 00 00       	mov    $0x17,%eax
 3c4:	cd 40                	int    $0x40
 3c6:	c3                   	ret    

000003c7 <sbrk>:
SYSCALL(sbrk)
 3c7:	b8 0c 00 00 00       	mov    $0xc,%eax
 3cc:	cd 40                	int    $0x40
 3ce:	c3                   	ret    

000003cf <sleep>:
SYSCALL(sleep)
 3cf:	b8 0d 00 00 00       	mov    $0xd,%eax
 3d4:	cd 40                	int    $0x40
 3d6:	c3                   	ret    

000003d7 <uptime>:
SYSCALL(uptime)
 3d7:	b8 0e 00 00 00       	mov    $0xe,%eax
 3dc:	cd 40                	int    $0x40
 3de:	c3                   	ret    

000003df <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 3df:	55                   	push   %ebp
 3e0:	89 e5                	mov    %esp,%ebp
 3e2:	83 ec 18             	sub    $0x18,%esp
 3e5:	8b 45 0c             	mov    0xc(%ebp),%eax
 3e8:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 3eb:	83 ec 04             	sub    $0x4,%esp
 3ee:	6a 01                	push   $0x1
 3f0:	8d 45 f4             	lea    -0xc(%ebp),%eax
 3f3:	50                   	push   %eax
 3f4:	ff 75 08             	pushl  0x8(%ebp)
 3f7:	e8 43 ff ff ff       	call   33f <write>
 3fc:	83 c4 10             	add    $0x10,%esp
}
 3ff:	90                   	nop
 400:	c9                   	leave  
 401:	c3                   	ret    

00000402 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 402:	55                   	push   %ebp
 403:	89 e5                	mov    %esp,%ebp
 405:	53                   	push   %ebx
 406:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 409:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 410:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 414:	74 17                	je     42d <printint+0x2b>
 416:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 41a:	79 11                	jns    42d <printint+0x2b>
    neg = 1;
 41c:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 423:	8b 45 0c             	mov    0xc(%ebp),%eax
 426:	f7 d8                	neg    %eax
 428:	89 45 ec             	mov    %eax,-0x14(%ebp)
 42b:	eb 06                	jmp    433 <printint+0x31>
  } else {
    x = xx;
 42d:	8b 45 0c             	mov    0xc(%ebp),%eax
 430:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 433:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 43a:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 43d:	8d 41 01             	lea    0x1(%ecx),%eax
 440:	89 45 f4             	mov    %eax,-0xc(%ebp)
 443:	8b 5d 10             	mov    0x10(%ebp),%ebx
 446:	8b 45 ec             	mov    -0x14(%ebp),%eax
 449:	ba 00 00 00 00       	mov    $0x0,%edx
 44e:	f7 f3                	div    %ebx
 450:	89 d0                	mov    %edx,%eax
 452:	0f b6 80 04 0b 00 00 	movzbl 0xb04(%eax),%eax
 459:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 45d:	8b 5d 10             	mov    0x10(%ebp),%ebx
 460:	8b 45 ec             	mov    -0x14(%ebp),%eax
 463:	ba 00 00 00 00       	mov    $0x0,%edx
 468:	f7 f3                	div    %ebx
 46a:	89 45 ec             	mov    %eax,-0x14(%ebp)
 46d:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 471:	75 c7                	jne    43a <printint+0x38>
  if(neg)
 473:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 477:	74 2d                	je     4a6 <printint+0xa4>
    buf[i++] = '-';
 479:	8b 45 f4             	mov    -0xc(%ebp),%eax
 47c:	8d 50 01             	lea    0x1(%eax),%edx
 47f:	89 55 f4             	mov    %edx,-0xc(%ebp)
 482:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 487:	eb 1d                	jmp    4a6 <printint+0xa4>
    putc(fd, buf[i]);
 489:	8d 55 dc             	lea    -0x24(%ebp),%edx
 48c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 48f:	01 d0                	add    %edx,%eax
 491:	0f b6 00             	movzbl (%eax),%eax
 494:	0f be c0             	movsbl %al,%eax
 497:	83 ec 08             	sub    $0x8,%esp
 49a:	50                   	push   %eax
 49b:	ff 75 08             	pushl  0x8(%ebp)
 49e:	e8 3c ff ff ff       	call   3df <putc>
 4a3:	83 c4 10             	add    $0x10,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 4a6:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 4aa:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 4ae:	79 d9                	jns    489 <printint+0x87>
    putc(fd, buf[i]);
}
 4b0:	90                   	nop
 4b1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4b4:	c9                   	leave  
 4b5:	c3                   	ret    

000004b6 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 4b6:	55                   	push   %ebp
 4b7:	89 e5                	mov    %esp,%ebp
 4b9:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 4bc:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 4c3:	8d 45 0c             	lea    0xc(%ebp),%eax
 4c6:	83 c0 04             	add    $0x4,%eax
 4c9:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 4cc:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 4d3:	e9 59 01 00 00       	jmp    631 <printf+0x17b>
    c = fmt[i] & 0xff;
 4d8:	8b 55 0c             	mov    0xc(%ebp),%edx
 4db:	8b 45 f0             	mov    -0x10(%ebp),%eax
 4de:	01 d0                	add    %edx,%eax
 4e0:	0f b6 00             	movzbl (%eax),%eax
 4e3:	0f be c0             	movsbl %al,%eax
 4e6:	25 ff 00 00 00       	and    $0xff,%eax
 4eb:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 4ee:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 4f2:	75 2c                	jne    520 <printf+0x6a>
      if(c == '%'){
 4f4:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 4f8:	75 0c                	jne    506 <printf+0x50>
        state = '%';
 4fa:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 501:	e9 27 01 00 00       	jmp    62d <printf+0x177>
      } else {
        putc(fd, c);
 506:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 509:	0f be c0             	movsbl %al,%eax
 50c:	83 ec 08             	sub    $0x8,%esp
 50f:	50                   	push   %eax
 510:	ff 75 08             	pushl  0x8(%ebp)
 513:	e8 c7 fe ff ff       	call   3df <putc>
 518:	83 c4 10             	add    $0x10,%esp
 51b:	e9 0d 01 00 00       	jmp    62d <printf+0x177>
      }
    } else if(state == '%'){
 520:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 524:	0f 85 03 01 00 00    	jne    62d <printf+0x177>
      if(c == 'd'){
 52a:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 52e:	75 1e                	jne    54e <printf+0x98>
        printint(fd, *ap, 10, 1);
 530:	8b 45 e8             	mov    -0x18(%ebp),%eax
 533:	8b 00                	mov    (%eax),%eax
 535:	6a 01                	push   $0x1
 537:	6a 0a                	push   $0xa
 539:	50                   	push   %eax
 53a:	ff 75 08             	pushl  0x8(%ebp)
 53d:	e8 c0 fe ff ff       	call   402 <printint>
 542:	83 c4 10             	add    $0x10,%esp
        ap++;
 545:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 549:	e9 d8 00 00 00       	jmp    626 <printf+0x170>
      } else if(c == 'x' || c == 'p'){
 54e:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 552:	74 06                	je     55a <printf+0xa4>
 554:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 558:	75 1e                	jne    578 <printf+0xc2>
        printint(fd, *ap, 16, 0);
 55a:	8b 45 e8             	mov    -0x18(%ebp),%eax
 55d:	8b 00                	mov    (%eax),%eax
 55f:	6a 00                	push   $0x0
 561:	6a 10                	push   $0x10
 563:	50                   	push   %eax
 564:	ff 75 08             	pushl  0x8(%ebp)
 567:	e8 96 fe ff ff       	call   402 <printint>
 56c:	83 c4 10             	add    $0x10,%esp
        ap++;
 56f:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 573:	e9 ae 00 00 00       	jmp    626 <printf+0x170>
      } else if(c == 's'){
 578:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 57c:	75 43                	jne    5c1 <printf+0x10b>
        s = (char*)*ap;
 57e:	8b 45 e8             	mov    -0x18(%ebp),%eax
 581:	8b 00                	mov    (%eax),%eax
 583:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 586:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 58a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 58e:	75 25                	jne    5b5 <printf+0xff>
          s = "(null)";
 590:	c7 45 f4 af 08 00 00 	movl   $0x8af,-0xc(%ebp)
        while(*s != 0){
 597:	eb 1c                	jmp    5b5 <printf+0xff>
          putc(fd, *s);
 599:	8b 45 f4             	mov    -0xc(%ebp),%eax
 59c:	0f b6 00             	movzbl (%eax),%eax
 59f:	0f be c0             	movsbl %al,%eax
 5a2:	83 ec 08             	sub    $0x8,%esp
 5a5:	50                   	push   %eax
 5a6:	ff 75 08             	pushl  0x8(%ebp)
 5a9:	e8 31 fe ff ff       	call   3df <putc>
 5ae:	83 c4 10             	add    $0x10,%esp
          s++;
 5b1:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 5b5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5b8:	0f b6 00             	movzbl (%eax),%eax
 5bb:	84 c0                	test   %al,%al
 5bd:	75 da                	jne    599 <printf+0xe3>
 5bf:	eb 65                	jmp    626 <printf+0x170>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 5c1:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 5c5:	75 1d                	jne    5e4 <printf+0x12e>
        putc(fd, *ap);
 5c7:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5ca:	8b 00                	mov    (%eax),%eax
 5cc:	0f be c0             	movsbl %al,%eax
 5cf:	83 ec 08             	sub    $0x8,%esp
 5d2:	50                   	push   %eax
 5d3:	ff 75 08             	pushl  0x8(%ebp)
 5d6:	e8 04 fe ff ff       	call   3df <putc>
 5db:	83 c4 10             	add    $0x10,%esp
        ap++;
 5de:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 5e2:	eb 42                	jmp    626 <printf+0x170>
      } else if(c == '%'){
 5e4:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 5e8:	75 17                	jne    601 <printf+0x14b>
        putc(fd, c);
 5ea:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5ed:	0f be c0             	movsbl %al,%eax
 5f0:	83 ec 08             	sub    $0x8,%esp
 5f3:	50                   	push   %eax
 5f4:	ff 75 08             	pushl  0x8(%ebp)
 5f7:	e8 e3 fd ff ff       	call   3df <putc>
 5fc:	83 c4 10             	add    $0x10,%esp
 5ff:	eb 25                	jmp    626 <printf+0x170>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 601:	83 ec 08             	sub    $0x8,%esp
 604:	6a 25                	push   $0x25
 606:	ff 75 08             	pushl  0x8(%ebp)
 609:	e8 d1 fd ff ff       	call   3df <putc>
 60e:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
 611:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 614:	0f be c0             	movsbl %al,%eax
 617:	83 ec 08             	sub    $0x8,%esp
 61a:	50                   	push   %eax
 61b:	ff 75 08             	pushl  0x8(%ebp)
 61e:	e8 bc fd ff ff       	call   3df <putc>
 623:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 626:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 62d:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 631:	8b 55 0c             	mov    0xc(%ebp),%edx
 634:	8b 45 f0             	mov    -0x10(%ebp),%eax
 637:	01 d0                	add    %edx,%eax
 639:	0f b6 00             	movzbl (%eax),%eax
 63c:	84 c0                	test   %al,%al
 63e:	0f 85 94 fe ff ff    	jne    4d8 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 644:	90                   	nop
 645:	c9                   	leave  
 646:	c3                   	ret    

00000647 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 647:	55                   	push   %ebp
 648:	89 e5                	mov    %esp,%ebp
 64a:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 64d:	8b 45 08             	mov    0x8(%ebp),%eax
 650:	83 e8 08             	sub    $0x8,%eax
 653:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 656:	a1 20 0b 00 00       	mov    0xb20,%eax
 65b:	89 45 fc             	mov    %eax,-0x4(%ebp)
 65e:	eb 24                	jmp    684 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 660:	8b 45 fc             	mov    -0x4(%ebp),%eax
 663:	8b 00                	mov    (%eax),%eax
 665:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 668:	77 12                	ja     67c <free+0x35>
 66a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 66d:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 670:	77 24                	ja     696 <free+0x4f>
 672:	8b 45 fc             	mov    -0x4(%ebp),%eax
 675:	8b 00                	mov    (%eax),%eax
 677:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 67a:	77 1a                	ja     696 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 67c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 67f:	8b 00                	mov    (%eax),%eax
 681:	89 45 fc             	mov    %eax,-0x4(%ebp)
 684:	8b 45 f8             	mov    -0x8(%ebp),%eax
 687:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 68a:	76 d4                	jbe    660 <free+0x19>
 68c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 68f:	8b 00                	mov    (%eax),%eax
 691:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 694:	76 ca                	jbe    660 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 696:	8b 45 f8             	mov    -0x8(%ebp),%eax
 699:	8b 40 04             	mov    0x4(%eax),%eax
 69c:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 6a3:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6a6:	01 c2                	add    %eax,%edx
 6a8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6ab:	8b 00                	mov    (%eax),%eax
 6ad:	39 c2                	cmp    %eax,%edx
 6af:	75 24                	jne    6d5 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 6b1:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6b4:	8b 50 04             	mov    0x4(%eax),%edx
 6b7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6ba:	8b 00                	mov    (%eax),%eax
 6bc:	8b 40 04             	mov    0x4(%eax),%eax
 6bf:	01 c2                	add    %eax,%edx
 6c1:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6c4:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 6c7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6ca:	8b 00                	mov    (%eax),%eax
 6cc:	8b 10                	mov    (%eax),%edx
 6ce:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6d1:	89 10                	mov    %edx,(%eax)
 6d3:	eb 0a                	jmp    6df <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 6d5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6d8:	8b 10                	mov    (%eax),%edx
 6da:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6dd:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 6df:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6e2:	8b 40 04             	mov    0x4(%eax),%eax
 6e5:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 6ec:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6ef:	01 d0                	add    %edx,%eax
 6f1:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 6f4:	75 20                	jne    716 <free+0xcf>
    p->s.size += bp->s.size;
 6f6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6f9:	8b 50 04             	mov    0x4(%eax),%edx
 6fc:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6ff:	8b 40 04             	mov    0x4(%eax),%eax
 702:	01 c2                	add    %eax,%edx
 704:	8b 45 fc             	mov    -0x4(%ebp),%eax
 707:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 70a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 70d:	8b 10                	mov    (%eax),%edx
 70f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 712:	89 10                	mov    %edx,(%eax)
 714:	eb 08                	jmp    71e <free+0xd7>
  } else
    p->s.ptr = bp;
 716:	8b 45 fc             	mov    -0x4(%ebp),%eax
 719:	8b 55 f8             	mov    -0x8(%ebp),%edx
 71c:	89 10                	mov    %edx,(%eax)
  freep = p;
 71e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 721:	a3 20 0b 00 00       	mov    %eax,0xb20
}
 726:	90                   	nop
 727:	c9                   	leave  
 728:	c3                   	ret    

00000729 <morecore>:

static Header*
morecore(uint nu)
{
 729:	55                   	push   %ebp
 72a:	89 e5                	mov    %esp,%ebp
 72c:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 72f:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 736:	77 07                	ja     73f <morecore+0x16>
    nu = 4096;
 738:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 73f:	8b 45 08             	mov    0x8(%ebp),%eax
 742:	c1 e0 03             	shl    $0x3,%eax
 745:	83 ec 0c             	sub    $0xc,%esp
 748:	50                   	push   %eax
 749:	e8 79 fc ff ff       	call   3c7 <sbrk>
 74e:	83 c4 10             	add    $0x10,%esp
 751:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 754:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 758:	75 07                	jne    761 <morecore+0x38>
    return 0;
 75a:	b8 00 00 00 00       	mov    $0x0,%eax
 75f:	eb 26                	jmp    787 <morecore+0x5e>
  hp = (Header*)p;
 761:	8b 45 f4             	mov    -0xc(%ebp),%eax
 764:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 767:	8b 45 f0             	mov    -0x10(%ebp),%eax
 76a:	8b 55 08             	mov    0x8(%ebp),%edx
 76d:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 770:	8b 45 f0             	mov    -0x10(%ebp),%eax
 773:	83 c0 08             	add    $0x8,%eax
 776:	83 ec 0c             	sub    $0xc,%esp
 779:	50                   	push   %eax
 77a:	e8 c8 fe ff ff       	call   647 <free>
 77f:	83 c4 10             	add    $0x10,%esp
  return freep;
 782:	a1 20 0b 00 00       	mov    0xb20,%eax
}
 787:	c9                   	leave  
 788:	c3                   	ret    

00000789 <malloc>:

void*
malloc(uint nbytes)
{
 789:	55                   	push   %ebp
 78a:	89 e5                	mov    %esp,%ebp
 78c:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 78f:	8b 45 08             	mov    0x8(%ebp),%eax
 792:	83 c0 07             	add    $0x7,%eax
 795:	c1 e8 03             	shr    $0x3,%eax
 798:	83 c0 01             	add    $0x1,%eax
 79b:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 79e:	a1 20 0b 00 00       	mov    0xb20,%eax
 7a3:	89 45 f0             	mov    %eax,-0x10(%ebp)
 7a6:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 7aa:	75 23                	jne    7cf <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 7ac:	c7 45 f0 18 0b 00 00 	movl   $0xb18,-0x10(%ebp)
 7b3:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7b6:	a3 20 0b 00 00       	mov    %eax,0xb20
 7bb:	a1 20 0b 00 00       	mov    0xb20,%eax
 7c0:	a3 18 0b 00 00       	mov    %eax,0xb18
    base.s.size = 0;
 7c5:	c7 05 1c 0b 00 00 00 	movl   $0x0,0xb1c
 7cc:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7cf:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7d2:	8b 00                	mov    (%eax),%eax
 7d4:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 7d7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7da:	8b 40 04             	mov    0x4(%eax),%eax
 7dd:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 7e0:	72 4d                	jb     82f <malloc+0xa6>
      if(p->s.size == nunits)
 7e2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7e5:	8b 40 04             	mov    0x4(%eax),%eax
 7e8:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 7eb:	75 0c                	jne    7f9 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 7ed:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7f0:	8b 10                	mov    (%eax),%edx
 7f2:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7f5:	89 10                	mov    %edx,(%eax)
 7f7:	eb 26                	jmp    81f <malloc+0x96>
      else {
        p->s.size -= nunits;
 7f9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7fc:	8b 40 04             	mov    0x4(%eax),%eax
 7ff:	2b 45 ec             	sub    -0x14(%ebp),%eax
 802:	89 c2                	mov    %eax,%edx
 804:	8b 45 f4             	mov    -0xc(%ebp),%eax
 807:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 80a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80d:	8b 40 04             	mov    0x4(%eax),%eax
 810:	c1 e0 03             	shl    $0x3,%eax
 813:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 816:	8b 45 f4             	mov    -0xc(%ebp),%eax
 819:	8b 55 ec             	mov    -0x14(%ebp),%edx
 81c:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 81f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 822:	a3 20 0b 00 00       	mov    %eax,0xb20
      return (void*)(p + 1);
 827:	8b 45 f4             	mov    -0xc(%ebp),%eax
 82a:	83 c0 08             	add    $0x8,%eax
 82d:	eb 3b                	jmp    86a <malloc+0xe1>
    }
    if(p == freep)
 82f:	a1 20 0b 00 00       	mov    0xb20,%eax
 834:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 837:	75 1e                	jne    857 <malloc+0xce>
      if((p = morecore(nunits)) == 0)
 839:	83 ec 0c             	sub    $0xc,%esp
 83c:	ff 75 ec             	pushl  -0x14(%ebp)
 83f:	e8 e5 fe ff ff       	call   729 <morecore>
 844:	83 c4 10             	add    $0x10,%esp
 847:	89 45 f4             	mov    %eax,-0xc(%ebp)
 84a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 84e:	75 07                	jne    857 <malloc+0xce>
        return 0;
 850:	b8 00 00 00 00       	mov    $0x0,%eax
 855:	eb 13                	jmp    86a <malloc+0xe1>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 857:	8b 45 f4             	mov    -0xc(%ebp),%eax
 85a:	89 45 f0             	mov    %eax,-0x10(%ebp)
 85d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 860:	8b 00                	mov    (%eax),%eax
 862:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 865:	e9 6d ff ff ff       	jmp    7d7 <malloc+0x4e>
}
 86a:	c9                   	leave  
 86b:	c3                   	ret    
