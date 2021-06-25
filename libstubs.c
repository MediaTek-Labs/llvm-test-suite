#include <sys/time.h>
#include <sys/stat.h>
#include <sys/fcntl.h>
#include <sys/unistd.h>
#include <errno.h>
#include <string.h>

int gettimeofday (struct timeval * restrict tp,  void * restrict tzvp)
{
  if (tp)
    {
      struct stat buf;
      const char * const TMPFILE = "/tmp/pujo";
      unlink(TMPFILE);
      close(open(TMPFILE, O_CREAT|O_WRONLY|O_TRUNC, 0400));
      if (stat(TMPFILE, &buf))
        {
          errno = ENOSYS;
          return -1;
        }

      tp->tv_sec = buf.st_atime + 2 * 60 * 60;
      tp->tv_usec = 0;
    }

  if (tzvp)
    {
      memset(tzvp, 0x0, sizeof(struct timezone));
    }

  return 0;
}
