#include <asm-generic/errno-base.h>
#include <fcntl.h>
#include <sys/ioctl.h>
#include <unistd.h>

#define BLKROSET_PERMANENT _IO(0x12,92)

int main(int argc, char **argv)
{
    int fd;
    int val = 1;

    if (argc != 2)
        return -EINVAL;

    fd = open(argv[1], O_RDONLY | O_CLOEXEC);
    if (fd < 0)
        return -ENOENT;

    if (ioctl(fd, BLKROSET_PERMANENT, &val))
        return -EIO;

    close(fd);

    return 0;
}