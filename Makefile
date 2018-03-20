##
## EPITECH PROJECT, 2018
## Mini lib c
## File description:
## Created by martin.januario@epitech.eu
##

NAME	=	libasm.so

SRC	=	src/my_strlen.S			\
		src/my_memset.S			\
		src/my_memcpy.S			\
		src/my_strcmp.S			\
		src/my_memmove.S		\
		src/my_strncmp.S		\
		src/my_strcasecmp.S		\
		src/my_rindex.S			\
		src/my_strstr.S			\
		src/my_strpbrk.S		\
		src/my_strchr.S

OBJ	=	$(SRC:.S=.o)

all:		$(NAME)

%.o: 		%.S
		nasm -o $@ $< -f elf64

$(NAME): 	$(OBJ)
		gcc -shared -o $(NAME) $(OBJ)

clean:
		rm -f $(OBJ)

fclean: 	clean
		rm -f $(NAME)

re:		fclean all

.PHONY:		all clean fclean re
