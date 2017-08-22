
_try:     file format elf32-i386


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
	printf(1,"GetPid Prog");
  15:	83 ec 08             	sub    $0x8,%esp
  18:	68 9c 08 00 00       	push   $0x89c
  1d:	6a 01                	push   $0x1
  1f:	e8 c0 04 00 00       	call   4e4 <printf>
  24:	83 c4 10             	add    $0x10,%esp
	printf(2,"%d\n",getpid());
  27:	e8 a1 03 00 00       	call   3cd <getpid>
  2c:	83 ec 04             	sub    $0x4,%esp
  2f:	50                   	push   %eax
  30:	68 a8 08 00 00       	push   $0x8a8
  35:	6a 02                	push   $0x2
  37:	e8 a8 04 00 00       	call   4e4 <printf>
  3c:	83 c4 10             	add    $0x10,%esp
	
	printf(1, "Process scheduling statistics:\n");
  3f:	83 ec 08             	sub    $0x8,%esp
  42:	68 ac 08 00 00       	push   $0x8ac
  47:	6a 01                	push   $0x1
  49:	e8 96 04 00 00       	call   4e4 <printf>
  4e:	83 c4 10             	add    $0x10,%esp
  printf(1, "Slot\tPID\tHigh\tLow\n");
  51:	83 ec 08             	sub    $0x8,%esp
  54:	68 cc 08 00 00       	push   $0x8cc
  59:	6a 01                	push   $0x1
  5b:	e8 84 04 00 00       	call   4e4 <printf>
  60:	83 c4 10             	add    $0x10,%esp
  struct pstat st;
  getAllPids(&st);
  63:	83 ec 0c             	sub    $0xc,%esp
  66:	8d 85 f4 f7 ff ff    	lea    -0x80c(%ebp),%eax
  6c:	50                   	push   %eax
  6d:	e8 73 03 00 00       	call   3e5 <getAllPids>
  72:	83 c4 10             	add    $0x10,%esp
  int i;
  for(i = 0; i < NPROC; i++)
  75:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  7c:	eb 68                	jmp    e6 <main+0xe6>
  		if(st.inuse[i])
  7e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  81:	8b 84 85 f4 f7 ff ff 	mov    -0x80c(%ebp,%eax,4),%eax
  88:	85 c0                	test   %eax,%eax
  8a:	74 56                	je     e2 <main+0xe2>
  			printf(1, "%d\t%d\t%d\t%d\t%s\n", i, st.pid[i], st.hticks[i], st.lticks[i],st.name[i]);
  8c:	8d 85 f4 f7 ff ff    	lea    -0x80c(%ebp),%eax
  92:	8b 55 f4             	mov    -0xc(%ebp),%edx
  95:	83 c2 20             	add    $0x20,%edx
  98:	c1 e2 04             	shl    $0x4,%edx
  9b:	8d 1c 10             	lea    (%eax,%edx,1),%ebx
  9e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  a1:	05 c0 01 00 00       	add    $0x1c0,%eax
  a6:	8b 8c 85 f4 f7 ff ff 	mov    -0x80c(%ebp,%eax,4),%ecx
  ad:	8b 45 f4             	mov    -0xc(%ebp),%eax
  b0:	05 80 01 00 00       	add    $0x180,%eax
  b5:	8b 94 85 f4 f7 ff ff 	mov    -0x80c(%ebp,%eax,4),%edx
  bc:	8b 45 f4             	mov    -0xc(%ebp),%eax
  bf:	83 c0 40             	add    $0x40,%eax
  c2:	8b 84 85 f4 f7 ff ff 	mov    -0x80c(%ebp,%eax,4),%eax
  c9:	83 ec 04             	sub    $0x4,%esp
  cc:	53                   	push   %ebx
  cd:	51                   	push   %ecx
  ce:	52                   	push   %edx
  cf:	50                   	push   %eax
  d0:	ff 75 f4             	pushl  -0xc(%ebp)
  d3:	68 df 08 00 00       	push   $0x8df
  d8:	6a 01                	push   $0x1
  da:	e8 05 04 00 00       	call   4e4 <printf>
  df:	83 c4 20             	add    $0x20,%esp
	printf(1, "Process scheduling statistics:\n");
  printf(1, "Slot\tPID\tHigh\tLow\n");
  struct pstat st;
  getAllPids(&st);
  int i;
  for(i = 0; i < NPROC; i++)
  e2:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  e6:	83 7d f4 3f          	cmpl   $0x3f,-0xc(%ebp)
  ea:	7e 92                	jle    7e <main+0x7e>
	{
	
	//printf(1,"Name = %s\n" ,pstat.pid[i]);
printf(1,"PID = %d\n" ,pstat.pid[i] );
		}*/
		shutdown();
  ec:	e8 fc 02 00 00       	call   3ed <shutdown>
	exit();
  f1:	e8 57 02 00 00       	call   34d <exit>

000000f6 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  f6:	55                   	push   %ebp
  f7:	89 e5                	mov    %esp,%ebp
  f9:	57                   	push   %edi
  fa:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  fb:	8b 4d 08             	mov    0x8(%ebp),%ecx
  fe:	8b 55 10             	mov    0x10(%ebp),%edx
 101:	8b 45 0c             	mov    0xc(%ebp),%eax
 104:	89 cb                	mov    %ecx,%ebx
 106:	89 df                	mov    %ebx,%edi
 108:	89 d1                	mov    %edx,%ecx
 10a:	fc                   	cld    
 10b:	f3 aa                	rep stos %al,%es:(%edi)
 10d:	89 ca                	mov    %ecx,%edx
 10f:	89 fb                	mov    %edi,%ebx
 111:	89 5d 08             	mov    %ebx,0x8(%ebp)
 114:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 117:	90                   	nop
 118:	5b                   	pop    %ebx
 119:	5f                   	pop    %edi
 11a:	5d                   	pop    %ebp
 11b:	c3                   	ret    

0000011c <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 11c:	55                   	push   %ebp
 11d:	89 e5                	mov    %esp,%ebp
 11f:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 122:	8b 45 08             	mov    0x8(%ebp),%eax
 125:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 128:	90                   	nop
 129:	8b 45 08             	mov    0x8(%ebp),%eax
 12c:	8d 50 01             	lea    0x1(%eax),%edx
 12f:	89 55 08             	mov    %edx,0x8(%ebp)
 132:	8b 55 0c             	mov    0xc(%ebp),%edx
 135:	8d 4a 01             	lea    0x1(%edx),%ecx
 138:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 13b:	0f b6 12             	movzbl (%edx),%edx
 13e:	88 10                	mov    %dl,(%eax)
 140:	0f b6 00             	movzbl (%eax),%eax
 143:	84 c0                	test   %al,%al
 145:	75 e2                	jne    129 <strcpy+0xd>
    ;
  return os;
 147:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 14a:	c9                   	leave  
 14b:	c3                   	ret    

0000014c <strcmp>:

int
strcmp(const char *p, const char *q)
{
 14c:	55                   	push   %ebp
 14d:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 14f:	eb 08                	jmp    159 <strcmp+0xd>
    p++, q++;
 151:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 155:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 159:	8b 45 08             	mov    0x8(%ebp),%eax
 15c:	0f b6 00             	movzbl (%eax),%eax
 15f:	84 c0                	test   %al,%al
 161:	74 10                	je     173 <strcmp+0x27>
 163:	8b 45 08             	mov    0x8(%ebp),%eax
 166:	0f b6 10             	movzbl (%eax),%edx
 169:	8b 45 0c             	mov    0xc(%ebp),%eax
 16c:	0f b6 00             	movzbl (%eax),%eax
 16f:	38 c2                	cmp    %al,%dl
 171:	74 de                	je     151 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 173:	8b 45 08             	mov    0x8(%ebp),%eax
 176:	0f b6 00             	movzbl (%eax),%eax
 179:	0f b6 d0             	movzbl %al,%edx
 17c:	8b 45 0c             	mov    0xc(%ebp),%eax
 17f:	0f b6 00             	movzbl (%eax),%eax
 182:	0f b6 c0             	movzbl %al,%eax
 185:	29 c2                	sub    %eax,%edx
 187:	89 d0                	mov    %edx,%eax
}
 189:	5d                   	pop    %ebp
 18a:	c3                   	ret    

0000018b <strlen>:

uint
strlen(char *s)
{
 18b:	55                   	push   %ebp
 18c:	89 e5                	mov    %esp,%ebp
 18e:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 191:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 198:	eb 04                	jmp    19e <strlen+0x13>
 19a:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 19e:	8b 55 fc             	mov    -0x4(%ebp),%edx
 1a1:	8b 45 08             	mov    0x8(%ebp),%eax
 1a4:	01 d0                	add    %edx,%eax
 1a6:	0f b6 00             	movzbl (%eax),%eax
 1a9:	84 c0                	test   %al,%al
 1ab:	75 ed                	jne    19a <strlen+0xf>
    ;
  return n;
 1ad:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 1b0:	c9                   	leave  
 1b1:	c3                   	ret    

000001b2 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1b2:	55                   	push   %ebp
 1b3:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
 1b5:	8b 45 10             	mov    0x10(%ebp),%eax
 1b8:	50                   	push   %eax
 1b9:	ff 75 0c             	pushl  0xc(%ebp)
 1bc:	ff 75 08             	pushl  0x8(%ebp)
 1bf:	e8 32 ff ff ff       	call   f6 <stosb>
 1c4:	83 c4 0c             	add    $0xc,%esp
  return dst;
 1c7:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1ca:	c9                   	leave  
 1cb:	c3                   	ret    

000001cc <strchr>:

char*
strchr(const char *s, char c)
{
 1cc:	55                   	push   %ebp
 1cd:	89 e5                	mov    %esp,%ebp
 1cf:	83 ec 04             	sub    $0x4,%esp
 1d2:	8b 45 0c             	mov    0xc(%ebp),%eax
 1d5:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 1d8:	eb 14                	jmp    1ee <strchr+0x22>
    if(*s == c)
 1da:	8b 45 08             	mov    0x8(%ebp),%eax
 1dd:	0f b6 00             	movzbl (%eax),%eax
 1e0:	3a 45 fc             	cmp    -0x4(%ebp),%al
 1e3:	75 05                	jne    1ea <strchr+0x1e>
      return (char*)s;
 1e5:	8b 45 08             	mov    0x8(%ebp),%eax
 1e8:	eb 13                	jmp    1fd <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 1ea:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 1ee:	8b 45 08             	mov    0x8(%ebp),%eax
 1f1:	0f b6 00             	movzbl (%eax),%eax
 1f4:	84 c0                	test   %al,%al
 1f6:	75 e2                	jne    1da <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 1f8:	b8 00 00 00 00       	mov    $0x0,%eax
}
 1fd:	c9                   	leave  
 1fe:	c3                   	ret    

000001ff <gets>:

char*
gets(char *buf, int max)
{
 1ff:	55                   	push   %ebp
 200:	89 e5                	mov    %esp,%ebp
 202:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 205:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 20c:	eb 42                	jmp    250 <gets+0x51>
    cc = read(0, &c, 1);
 20e:	83 ec 04             	sub    $0x4,%esp
 211:	6a 01                	push   $0x1
 213:	8d 45 ef             	lea    -0x11(%ebp),%eax
 216:	50                   	push   %eax
 217:	6a 00                	push   $0x0
 219:	e8 47 01 00 00       	call   365 <read>
 21e:	83 c4 10             	add    $0x10,%esp
 221:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 224:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 228:	7e 33                	jle    25d <gets+0x5e>
      break;
    buf[i++] = c;
 22a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 22d:	8d 50 01             	lea    0x1(%eax),%edx
 230:	89 55 f4             	mov    %edx,-0xc(%ebp)
 233:	89 c2                	mov    %eax,%edx
 235:	8b 45 08             	mov    0x8(%ebp),%eax
 238:	01 c2                	add    %eax,%edx
 23a:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 23e:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 240:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 244:	3c 0a                	cmp    $0xa,%al
 246:	74 16                	je     25e <gets+0x5f>
 248:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 24c:	3c 0d                	cmp    $0xd,%al
 24e:	74 0e                	je     25e <gets+0x5f>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 250:	8b 45 f4             	mov    -0xc(%ebp),%eax
 253:	83 c0 01             	add    $0x1,%eax
 256:	3b 45 0c             	cmp    0xc(%ebp),%eax
 259:	7c b3                	jl     20e <gets+0xf>
 25b:	eb 01                	jmp    25e <gets+0x5f>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 25d:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 25e:	8b 55 f4             	mov    -0xc(%ebp),%edx
 261:	8b 45 08             	mov    0x8(%ebp),%eax
 264:	01 d0                	add    %edx,%eax
 266:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 269:	8b 45 08             	mov    0x8(%ebp),%eax
}
 26c:	c9                   	leave  
 26d:	c3                   	ret    

0000026e <stat>:

int
stat(char *n, struct stat *st)
{
 26e:	55                   	push   %ebp
 26f:	89 e5                	mov    %esp,%ebp
 271:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 274:	83 ec 08             	sub    $0x8,%esp
 277:	6a 00                	push   $0x0
 279:	ff 75 08             	pushl  0x8(%ebp)
 27c:	e8 0c 01 00 00       	call   38d <open>
 281:	83 c4 10             	add    $0x10,%esp
 284:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 287:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 28b:	79 07                	jns    294 <stat+0x26>
    return -1;
 28d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 292:	eb 25                	jmp    2b9 <stat+0x4b>
  r = fstat(fd, st);
 294:	83 ec 08             	sub    $0x8,%esp
 297:	ff 75 0c             	pushl  0xc(%ebp)
 29a:	ff 75 f4             	pushl  -0xc(%ebp)
 29d:	e8 03 01 00 00       	call   3a5 <fstat>
 2a2:	83 c4 10             	add    $0x10,%esp
 2a5:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 2a8:	83 ec 0c             	sub    $0xc,%esp
 2ab:	ff 75 f4             	pushl  -0xc(%ebp)
 2ae:	e8 c2 00 00 00       	call   375 <close>
 2b3:	83 c4 10             	add    $0x10,%esp
  return r;
 2b6:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 2b9:	c9                   	leave  
 2ba:	c3                   	ret    

000002bb <atoi>:

int
atoi(const char *s)
{
 2bb:	55                   	push   %ebp
 2bc:	89 e5                	mov    %esp,%ebp
 2be:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 2c1:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 2c8:	eb 25                	jmp    2ef <atoi+0x34>
    n = n*10 + *s++ - '0';
 2ca:	8b 55 fc             	mov    -0x4(%ebp),%edx
 2cd:	89 d0                	mov    %edx,%eax
 2cf:	c1 e0 02             	shl    $0x2,%eax
 2d2:	01 d0                	add    %edx,%eax
 2d4:	01 c0                	add    %eax,%eax
 2d6:	89 c1                	mov    %eax,%ecx
 2d8:	8b 45 08             	mov    0x8(%ebp),%eax
 2db:	8d 50 01             	lea    0x1(%eax),%edx
 2de:	89 55 08             	mov    %edx,0x8(%ebp)
 2e1:	0f b6 00             	movzbl (%eax),%eax
 2e4:	0f be c0             	movsbl %al,%eax
 2e7:	01 c8                	add    %ecx,%eax
 2e9:	83 e8 30             	sub    $0x30,%eax
 2ec:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2ef:	8b 45 08             	mov    0x8(%ebp),%eax
 2f2:	0f b6 00             	movzbl (%eax),%eax
 2f5:	3c 2f                	cmp    $0x2f,%al
 2f7:	7e 0a                	jle    303 <atoi+0x48>
 2f9:	8b 45 08             	mov    0x8(%ebp),%eax
 2fc:	0f b6 00             	movzbl (%eax),%eax
 2ff:	3c 39                	cmp    $0x39,%al
 301:	7e c7                	jle    2ca <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 303:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 306:	c9                   	leave  
 307:	c3                   	ret    

00000308 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 308:	55                   	push   %ebp
 309:	89 e5                	mov    %esp,%ebp
 30b:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 30e:	8b 45 08             	mov    0x8(%ebp),%eax
 311:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 314:	8b 45 0c             	mov    0xc(%ebp),%eax
 317:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 31a:	eb 17                	jmp    333 <memmove+0x2b>
    *dst++ = *src++;
 31c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 31f:	8d 50 01             	lea    0x1(%eax),%edx
 322:	89 55 fc             	mov    %edx,-0x4(%ebp)
 325:	8b 55 f8             	mov    -0x8(%ebp),%edx
 328:	8d 4a 01             	lea    0x1(%edx),%ecx
 32b:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 32e:	0f b6 12             	movzbl (%edx),%edx
 331:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 333:	8b 45 10             	mov    0x10(%ebp),%eax
 336:	8d 50 ff             	lea    -0x1(%eax),%edx
 339:	89 55 10             	mov    %edx,0x10(%ebp)
 33c:	85 c0                	test   %eax,%eax
 33e:	7f dc                	jg     31c <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 340:	8b 45 08             	mov    0x8(%ebp),%eax
}
 343:	c9                   	leave  
 344:	c3                   	ret    

00000345 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 345:	b8 01 00 00 00       	mov    $0x1,%eax
 34a:	cd 40                	int    $0x40
 34c:	c3                   	ret    

0000034d <exit>:
SYSCALL(exit)
 34d:	b8 02 00 00 00       	mov    $0x2,%eax
 352:	cd 40                	int    $0x40
 354:	c3                   	ret    

00000355 <wait>:
SYSCALL(wait)
 355:	b8 03 00 00 00       	mov    $0x3,%eax
 35a:	cd 40                	int    $0x40
 35c:	c3                   	ret    

0000035d <pipe>:
SYSCALL(pipe)
 35d:	b8 04 00 00 00       	mov    $0x4,%eax
 362:	cd 40                	int    $0x40
 364:	c3                   	ret    

00000365 <read>:
SYSCALL(read)
 365:	b8 05 00 00 00       	mov    $0x5,%eax
 36a:	cd 40                	int    $0x40
 36c:	c3                   	ret    

0000036d <write>:
SYSCALL(write)
 36d:	b8 10 00 00 00       	mov    $0x10,%eax
 372:	cd 40                	int    $0x40
 374:	c3                   	ret    

00000375 <close>:
SYSCALL(close)
 375:	b8 15 00 00 00       	mov    $0x15,%eax
 37a:	cd 40                	int    $0x40
 37c:	c3                   	ret    

0000037d <kill>:
SYSCALL(kill)
 37d:	b8 06 00 00 00       	mov    $0x6,%eax
 382:	cd 40                	int    $0x40
 384:	c3                   	ret    

00000385 <exec>:
SYSCALL(exec)
 385:	b8 07 00 00 00       	mov    $0x7,%eax
 38a:	cd 40                	int    $0x40
 38c:	c3                   	ret    

0000038d <open>:
SYSCALL(open)
 38d:	b8 0f 00 00 00       	mov    $0xf,%eax
 392:	cd 40                	int    $0x40
 394:	c3                   	ret    

00000395 <mknod>:
SYSCALL(mknod)
 395:	b8 11 00 00 00       	mov    $0x11,%eax
 39a:	cd 40                	int    $0x40
 39c:	c3                   	ret    

0000039d <unlink>:
SYSCALL(unlink)
 39d:	b8 12 00 00 00       	mov    $0x12,%eax
 3a2:	cd 40                	int    $0x40
 3a4:	c3                   	ret    

000003a5 <fstat>:
SYSCALL(fstat)
 3a5:	b8 08 00 00 00       	mov    $0x8,%eax
 3aa:	cd 40                	int    $0x40
 3ac:	c3                   	ret    

000003ad <link>:
SYSCALL(link)
 3ad:	b8 13 00 00 00       	mov    $0x13,%eax
 3b2:	cd 40                	int    $0x40
 3b4:	c3                   	ret    

000003b5 <mkdir>:
SYSCALL(mkdir)
 3b5:	b8 14 00 00 00       	mov    $0x14,%eax
 3ba:	cd 40                	int    $0x40
 3bc:	c3                   	ret    

000003bd <chdir>:
SYSCALL(chdir)
 3bd:	b8 09 00 00 00       	mov    $0x9,%eax
 3c2:	cd 40                	int    $0x40
 3c4:	c3                   	ret    

000003c5 <dup>:
SYSCALL(dup)
 3c5:	b8 0a 00 00 00       	mov    $0xa,%eax
 3ca:	cd 40                	int    $0x40
 3cc:	c3                   	ret    

000003cd <getpid>:
SYSCALL(getpid)
 3cd:	b8 0b 00 00 00       	mov    $0xb,%eax
 3d2:	cd 40                	int    $0x40
 3d4:	c3                   	ret    

000003d5 <getppid>:
SYSCALL(getppid)
 3d5:	b8 18 00 00 00       	mov    $0x18,%eax
 3da:	cd 40                	int    $0x40
 3dc:	c3                   	ret    

000003dd <getsyscallinfo>:
SYSCALL(getsyscallinfo)
 3dd:	b8 19 00 00 00       	mov    $0x19,%eax
 3e2:	cd 40                	int    $0x40
 3e4:	c3                   	ret    

000003e5 <getAllPids>:
SYSCALL(getAllPids)
 3e5:	b8 16 00 00 00       	mov    $0x16,%eax
 3ea:	cd 40                	int    $0x40
 3ec:	c3                   	ret    

000003ed <shutdown>:
SYSCALL(shutdown)
 3ed:	b8 17 00 00 00       	mov    $0x17,%eax
 3f2:	cd 40                	int    $0x40
 3f4:	c3                   	ret    

000003f5 <sbrk>:
SYSCALL(sbrk)
 3f5:	b8 0c 00 00 00       	mov    $0xc,%eax
 3fa:	cd 40                	int    $0x40
 3fc:	c3                   	ret    

000003fd <sleep>:
SYSCALL(sleep)
 3fd:	b8 0d 00 00 00       	mov    $0xd,%eax
 402:	cd 40                	int    $0x40
 404:	c3                   	ret    

00000405 <uptime>:
SYSCALL(uptime)
 405:	b8 0e 00 00 00       	mov    $0xe,%eax
 40a:	cd 40                	int    $0x40
 40c:	c3                   	ret    

0000040d <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 40d:	55                   	push   %ebp
 40e:	89 e5                	mov    %esp,%ebp
 410:	83 ec 18             	sub    $0x18,%esp
 413:	8b 45 0c             	mov    0xc(%ebp),%eax
 416:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 419:	83 ec 04             	sub    $0x4,%esp
 41c:	6a 01                	push   $0x1
 41e:	8d 45 f4             	lea    -0xc(%ebp),%eax
 421:	50                   	push   %eax
 422:	ff 75 08             	pushl  0x8(%ebp)
 425:	e8 43 ff ff ff       	call   36d <write>
 42a:	83 c4 10             	add    $0x10,%esp
}
 42d:	90                   	nop
 42e:	c9                   	leave  
 42f:	c3                   	ret    

00000430 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 430:	55                   	push   %ebp
 431:	89 e5                	mov    %esp,%ebp
 433:	53                   	push   %ebx
 434:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 437:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 43e:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 442:	74 17                	je     45b <printint+0x2b>
 444:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 448:	79 11                	jns    45b <printint+0x2b>
    neg = 1;
 44a:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 451:	8b 45 0c             	mov    0xc(%ebp),%eax
 454:	f7 d8                	neg    %eax
 456:	89 45 ec             	mov    %eax,-0x14(%ebp)
 459:	eb 06                	jmp    461 <printint+0x31>
  } else {
    x = xx;
 45b:	8b 45 0c             	mov    0xc(%ebp),%eax
 45e:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 461:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 468:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 46b:	8d 41 01             	lea    0x1(%ecx),%eax
 46e:	89 45 f4             	mov    %eax,-0xc(%ebp)
 471:	8b 5d 10             	mov    0x10(%ebp),%ebx
 474:	8b 45 ec             	mov    -0x14(%ebp),%eax
 477:	ba 00 00 00 00       	mov    $0x0,%edx
 47c:	f7 f3                	div    %ebx
 47e:	89 d0                	mov    %edx,%eax
 480:	0f b6 80 44 0b 00 00 	movzbl 0xb44(%eax),%eax
 487:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 48b:	8b 5d 10             	mov    0x10(%ebp),%ebx
 48e:	8b 45 ec             	mov    -0x14(%ebp),%eax
 491:	ba 00 00 00 00       	mov    $0x0,%edx
 496:	f7 f3                	div    %ebx
 498:	89 45 ec             	mov    %eax,-0x14(%ebp)
 49b:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 49f:	75 c7                	jne    468 <printint+0x38>
  if(neg)
 4a1:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 4a5:	74 2d                	je     4d4 <printint+0xa4>
    buf[i++] = '-';
 4a7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4aa:	8d 50 01             	lea    0x1(%eax),%edx
 4ad:	89 55 f4             	mov    %edx,-0xc(%ebp)
 4b0:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 4b5:	eb 1d                	jmp    4d4 <printint+0xa4>
    putc(fd, buf[i]);
 4b7:	8d 55 dc             	lea    -0x24(%ebp),%edx
 4ba:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4bd:	01 d0                	add    %edx,%eax
 4bf:	0f b6 00             	movzbl (%eax),%eax
 4c2:	0f be c0             	movsbl %al,%eax
 4c5:	83 ec 08             	sub    $0x8,%esp
 4c8:	50                   	push   %eax
 4c9:	ff 75 08             	pushl  0x8(%ebp)
 4cc:	e8 3c ff ff ff       	call   40d <putc>
 4d1:	83 c4 10             	add    $0x10,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 4d4:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 4d8:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 4dc:	79 d9                	jns    4b7 <printint+0x87>
    putc(fd, buf[i]);
}
 4de:	90                   	nop
 4df:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4e2:	c9                   	leave  
 4e3:	c3                   	ret    

000004e4 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 4e4:	55                   	push   %ebp
 4e5:	89 e5                	mov    %esp,%ebp
 4e7:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 4ea:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 4f1:	8d 45 0c             	lea    0xc(%ebp),%eax
 4f4:	83 c0 04             	add    $0x4,%eax
 4f7:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 4fa:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 501:	e9 59 01 00 00       	jmp    65f <printf+0x17b>
    c = fmt[i] & 0xff;
 506:	8b 55 0c             	mov    0xc(%ebp),%edx
 509:	8b 45 f0             	mov    -0x10(%ebp),%eax
 50c:	01 d0                	add    %edx,%eax
 50e:	0f b6 00             	movzbl (%eax),%eax
 511:	0f be c0             	movsbl %al,%eax
 514:	25 ff 00 00 00       	and    $0xff,%eax
 519:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 51c:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 520:	75 2c                	jne    54e <printf+0x6a>
      if(c == '%'){
 522:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 526:	75 0c                	jne    534 <printf+0x50>
        state = '%';
 528:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 52f:	e9 27 01 00 00       	jmp    65b <printf+0x177>
      } else {
        putc(fd, c);
 534:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 537:	0f be c0             	movsbl %al,%eax
 53a:	83 ec 08             	sub    $0x8,%esp
 53d:	50                   	push   %eax
 53e:	ff 75 08             	pushl  0x8(%ebp)
 541:	e8 c7 fe ff ff       	call   40d <putc>
 546:	83 c4 10             	add    $0x10,%esp
 549:	e9 0d 01 00 00       	jmp    65b <printf+0x177>
      }
    } else if(state == '%'){
 54e:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 552:	0f 85 03 01 00 00    	jne    65b <printf+0x177>
      if(c == 'd'){
 558:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 55c:	75 1e                	jne    57c <printf+0x98>
        printint(fd, *ap, 10, 1);
 55e:	8b 45 e8             	mov    -0x18(%ebp),%eax
 561:	8b 00                	mov    (%eax),%eax
 563:	6a 01                	push   $0x1
 565:	6a 0a                	push   $0xa
 567:	50                   	push   %eax
 568:	ff 75 08             	pushl  0x8(%ebp)
 56b:	e8 c0 fe ff ff       	call   430 <printint>
 570:	83 c4 10             	add    $0x10,%esp
        ap++;
 573:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 577:	e9 d8 00 00 00       	jmp    654 <printf+0x170>
      } else if(c == 'x' || c == 'p'){
 57c:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 580:	74 06                	je     588 <printf+0xa4>
 582:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 586:	75 1e                	jne    5a6 <printf+0xc2>
        printint(fd, *ap, 16, 0);
 588:	8b 45 e8             	mov    -0x18(%ebp),%eax
 58b:	8b 00                	mov    (%eax),%eax
 58d:	6a 00                	push   $0x0
 58f:	6a 10                	push   $0x10
 591:	50                   	push   %eax
 592:	ff 75 08             	pushl  0x8(%ebp)
 595:	e8 96 fe ff ff       	call   430 <printint>
 59a:	83 c4 10             	add    $0x10,%esp
        ap++;
 59d:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 5a1:	e9 ae 00 00 00       	jmp    654 <printf+0x170>
      } else if(c == 's'){
 5a6:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 5aa:	75 43                	jne    5ef <printf+0x10b>
        s = (char*)*ap;
 5ac:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5af:	8b 00                	mov    (%eax),%eax
 5b1:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 5b4:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 5b8:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 5bc:	75 25                	jne    5e3 <printf+0xff>
          s = "(null)";
 5be:	c7 45 f4 ef 08 00 00 	movl   $0x8ef,-0xc(%ebp)
        while(*s != 0){
 5c5:	eb 1c                	jmp    5e3 <printf+0xff>
          putc(fd, *s);
 5c7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5ca:	0f b6 00             	movzbl (%eax),%eax
 5cd:	0f be c0             	movsbl %al,%eax
 5d0:	83 ec 08             	sub    $0x8,%esp
 5d3:	50                   	push   %eax
 5d4:	ff 75 08             	pushl  0x8(%ebp)
 5d7:	e8 31 fe ff ff       	call   40d <putc>
 5dc:	83 c4 10             	add    $0x10,%esp
          s++;
 5df:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 5e3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5e6:	0f b6 00             	movzbl (%eax),%eax
 5e9:	84 c0                	test   %al,%al
 5eb:	75 da                	jne    5c7 <printf+0xe3>
 5ed:	eb 65                	jmp    654 <printf+0x170>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 5ef:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 5f3:	75 1d                	jne    612 <printf+0x12e>
        putc(fd, *ap);
 5f5:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5f8:	8b 00                	mov    (%eax),%eax
 5fa:	0f be c0             	movsbl %al,%eax
 5fd:	83 ec 08             	sub    $0x8,%esp
 600:	50                   	push   %eax
 601:	ff 75 08             	pushl  0x8(%ebp)
 604:	e8 04 fe ff ff       	call   40d <putc>
 609:	83 c4 10             	add    $0x10,%esp
        ap++;
 60c:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 610:	eb 42                	jmp    654 <printf+0x170>
      } else if(c == '%'){
 612:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 616:	75 17                	jne    62f <printf+0x14b>
        putc(fd, c);
 618:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 61b:	0f be c0             	movsbl %al,%eax
 61e:	83 ec 08             	sub    $0x8,%esp
 621:	50                   	push   %eax
 622:	ff 75 08             	pushl  0x8(%ebp)
 625:	e8 e3 fd ff ff       	call   40d <putc>
 62a:	83 c4 10             	add    $0x10,%esp
 62d:	eb 25                	jmp    654 <printf+0x170>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 62f:	83 ec 08             	sub    $0x8,%esp
 632:	6a 25                	push   $0x25
 634:	ff 75 08             	pushl  0x8(%ebp)
 637:	e8 d1 fd ff ff       	call   40d <putc>
 63c:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
 63f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 642:	0f be c0             	movsbl %al,%eax
 645:	83 ec 08             	sub    $0x8,%esp
 648:	50                   	push   %eax
 649:	ff 75 08             	pushl  0x8(%ebp)
 64c:	e8 bc fd ff ff       	call   40d <putc>
 651:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 654:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 65b:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 65f:	8b 55 0c             	mov    0xc(%ebp),%edx
 662:	8b 45 f0             	mov    -0x10(%ebp),%eax
 665:	01 d0                	add    %edx,%eax
 667:	0f b6 00             	movzbl (%eax),%eax
 66a:	84 c0                	test   %al,%al
 66c:	0f 85 94 fe ff ff    	jne    506 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 672:	90                   	nop
 673:	c9                   	leave  
 674:	c3                   	ret    

00000675 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 675:	55                   	push   %ebp
 676:	89 e5                	mov    %esp,%ebp
 678:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 67b:	8b 45 08             	mov    0x8(%ebp),%eax
 67e:	83 e8 08             	sub    $0x8,%eax
 681:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 684:	a1 60 0b 00 00       	mov    0xb60,%eax
 689:	89 45 fc             	mov    %eax,-0x4(%ebp)
 68c:	eb 24                	jmp    6b2 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 68e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 691:	8b 00                	mov    (%eax),%eax
 693:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 696:	77 12                	ja     6aa <free+0x35>
 698:	8b 45 f8             	mov    -0x8(%ebp),%eax
 69b:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 69e:	77 24                	ja     6c4 <free+0x4f>
 6a0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6a3:	8b 00                	mov    (%eax),%eax
 6a5:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 6a8:	77 1a                	ja     6c4 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6aa:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6ad:	8b 00                	mov    (%eax),%eax
 6af:	89 45 fc             	mov    %eax,-0x4(%ebp)
 6b2:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6b5:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6b8:	76 d4                	jbe    68e <free+0x19>
 6ba:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6bd:	8b 00                	mov    (%eax),%eax
 6bf:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 6c2:	76 ca                	jbe    68e <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 6c4:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6c7:	8b 40 04             	mov    0x4(%eax),%eax
 6ca:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 6d1:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6d4:	01 c2                	add    %eax,%edx
 6d6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6d9:	8b 00                	mov    (%eax),%eax
 6db:	39 c2                	cmp    %eax,%edx
 6dd:	75 24                	jne    703 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 6df:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6e2:	8b 50 04             	mov    0x4(%eax),%edx
 6e5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6e8:	8b 00                	mov    (%eax),%eax
 6ea:	8b 40 04             	mov    0x4(%eax),%eax
 6ed:	01 c2                	add    %eax,%edx
 6ef:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6f2:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 6f5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6f8:	8b 00                	mov    (%eax),%eax
 6fa:	8b 10                	mov    (%eax),%edx
 6fc:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6ff:	89 10                	mov    %edx,(%eax)
 701:	eb 0a                	jmp    70d <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 703:	8b 45 fc             	mov    -0x4(%ebp),%eax
 706:	8b 10                	mov    (%eax),%edx
 708:	8b 45 f8             	mov    -0x8(%ebp),%eax
 70b:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 70d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 710:	8b 40 04             	mov    0x4(%eax),%eax
 713:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 71a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 71d:	01 d0                	add    %edx,%eax
 71f:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 722:	75 20                	jne    744 <free+0xcf>
    p->s.size += bp->s.size;
 724:	8b 45 fc             	mov    -0x4(%ebp),%eax
 727:	8b 50 04             	mov    0x4(%eax),%edx
 72a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 72d:	8b 40 04             	mov    0x4(%eax),%eax
 730:	01 c2                	add    %eax,%edx
 732:	8b 45 fc             	mov    -0x4(%ebp),%eax
 735:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 738:	8b 45 f8             	mov    -0x8(%ebp),%eax
 73b:	8b 10                	mov    (%eax),%edx
 73d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 740:	89 10                	mov    %edx,(%eax)
 742:	eb 08                	jmp    74c <free+0xd7>
  } else
    p->s.ptr = bp;
 744:	8b 45 fc             	mov    -0x4(%ebp),%eax
 747:	8b 55 f8             	mov    -0x8(%ebp),%edx
 74a:	89 10                	mov    %edx,(%eax)
  freep = p;
 74c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 74f:	a3 60 0b 00 00       	mov    %eax,0xb60
}
 754:	90                   	nop
 755:	c9                   	leave  
 756:	c3                   	ret    

00000757 <morecore>:

static Header*
morecore(uint nu)
{
 757:	55                   	push   %ebp
 758:	89 e5                	mov    %esp,%ebp
 75a:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 75d:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 764:	77 07                	ja     76d <morecore+0x16>
    nu = 4096;
 766:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 76d:	8b 45 08             	mov    0x8(%ebp),%eax
 770:	c1 e0 03             	shl    $0x3,%eax
 773:	83 ec 0c             	sub    $0xc,%esp
 776:	50                   	push   %eax
 777:	e8 79 fc ff ff       	call   3f5 <sbrk>
 77c:	83 c4 10             	add    $0x10,%esp
 77f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 782:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 786:	75 07                	jne    78f <morecore+0x38>
    return 0;
 788:	b8 00 00 00 00       	mov    $0x0,%eax
 78d:	eb 26                	jmp    7b5 <morecore+0x5e>
  hp = (Header*)p;
 78f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 792:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 795:	8b 45 f0             	mov    -0x10(%ebp),%eax
 798:	8b 55 08             	mov    0x8(%ebp),%edx
 79b:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 79e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7a1:	83 c0 08             	add    $0x8,%eax
 7a4:	83 ec 0c             	sub    $0xc,%esp
 7a7:	50                   	push   %eax
 7a8:	e8 c8 fe ff ff       	call   675 <free>
 7ad:	83 c4 10             	add    $0x10,%esp
  return freep;
 7b0:	a1 60 0b 00 00       	mov    0xb60,%eax
}
 7b5:	c9                   	leave  
 7b6:	c3                   	ret    

000007b7 <malloc>:

void*
malloc(uint nbytes)
{
 7b7:	55                   	push   %ebp
 7b8:	89 e5                	mov    %esp,%ebp
 7ba:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7bd:	8b 45 08             	mov    0x8(%ebp),%eax
 7c0:	83 c0 07             	add    $0x7,%eax
 7c3:	c1 e8 03             	shr    $0x3,%eax
 7c6:	83 c0 01             	add    $0x1,%eax
 7c9:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 7cc:	a1 60 0b 00 00       	mov    0xb60,%eax
 7d1:	89 45 f0             	mov    %eax,-0x10(%ebp)
 7d4:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 7d8:	75 23                	jne    7fd <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 7da:	c7 45 f0 58 0b 00 00 	movl   $0xb58,-0x10(%ebp)
 7e1:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7e4:	a3 60 0b 00 00       	mov    %eax,0xb60
 7e9:	a1 60 0b 00 00       	mov    0xb60,%eax
 7ee:	a3 58 0b 00 00       	mov    %eax,0xb58
    base.s.size = 0;
 7f3:	c7 05 5c 0b 00 00 00 	movl   $0x0,0xb5c
 7fa:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7fd:	8b 45 f0             	mov    -0x10(%ebp),%eax
 800:	8b 00                	mov    (%eax),%eax
 802:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 805:	8b 45 f4             	mov    -0xc(%ebp),%eax
 808:	8b 40 04             	mov    0x4(%eax),%eax
 80b:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 80e:	72 4d                	jb     85d <malloc+0xa6>
      if(p->s.size == nunits)
 810:	8b 45 f4             	mov    -0xc(%ebp),%eax
 813:	8b 40 04             	mov    0x4(%eax),%eax
 816:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 819:	75 0c                	jne    827 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 81b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 81e:	8b 10                	mov    (%eax),%edx
 820:	8b 45 f0             	mov    -0x10(%ebp),%eax
 823:	89 10                	mov    %edx,(%eax)
 825:	eb 26                	jmp    84d <malloc+0x96>
      else {
        p->s.size -= nunits;
 827:	8b 45 f4             	mov    -0xc(%ebp),%eax
 82a:	8b 40 04             	mov    0x4(%eax),%eax
 82d:	2b 45 ec             	sub    -0x14(%ebp),%eax
 830:	89 c2                	mov    %eax,%edx
 832:	8b 45 f4             	mov    -0xc(%ebp),%eax
 835:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 838:	8b 45 f4             	mov    -0xc(%ebp),%eax
 83b:	8b 40 04             	mov    0x4(%eax),%eax
 83e:	c1 e0 03             	shl    $0x3,%eax
 841:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 844:	8b 45 f4             	mov    -0xc(%ebp),%eax
 847:	8b 55 ec             	mov    -0x14(%ebp),%edx
 84a:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 84d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 850:	a3 60 0b 00 00       	mov    %eax,0xb60
      return (void*)(p + 1);
 855:	8b 45 f4             	mov    -0xc(%ebp),%eax
 858:	83 c0 08             	add    $0x8,%eax
 85b:	eb 3b                	jmp    898 <malloc+0xe1>
    }
    if(p == freep)
 85d:	a1 60 0b 00 00       	mov    0xb60,%eax
 862:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 865:	75 1e                	jne    885 <malloc+0xce>
      if((p = morecore(nunits)) == 0)
 867:	83 ec 0c             	sub    $0xc,%esp
 86a:	ff 75 ec             	pushl  -0x14(%ebp)
 86d:	e8 e5 fe ff ff       	call   757 <morecore>
 872:	83 c4 10             	add    $0x10,%esp
 875:	89 45 f4             	mov    %eax,-0xc(%ebp)
 878:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 87c:	75 07                	jne    885 <malloc+0xce>
        return 0;
 87e:	b8 00 00 00 00       	mov    $0x0,%eax
 883:	eb 13                	jmp    898 <malloc+0xe1>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 885:	8b 45 f4             	mov    -0xc(%ebp),%eax
 888:	89 45 f0             	mov    %eax,-0x10(%ebp)
 88b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 88e:	8b 00                	mov    (%eax),%eax
 890:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 893:	e9 6d ff ff ff       	jmp    805 <malloc+0x4e>
}
 898:	c9                   	leave  
 899:	c3                   	ret    
