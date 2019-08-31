.data
input_spec:       .asciz "%[^\n]"
char_spec:        .asciz "%c"
input:            .space 256
flush:            .asciz "\n"
prompt_msg:       .asciz "Input a string: "

.text
.global main
main:

# print prompt and take in input
ldr x0, =prompt_msg
bl printf
ldr x0, =flush
bl printf
ldr x0, =input_spec
ldr x1, =input
bl scanf

# start loop through string
mov x19, #0
loop:
ldr x0, =input
ldrb w20, [x0, x19]
# if char is null char, end of string so exit loop
cbz w20, exit
# if char is a vowel, print an x
sub x3, x20, #65
cbz x3, print_x
sub x3, x20, #69
cbz x3, print_x
sub x3, x20, #73
cbz x3, print_x
sub x3, x20, #79
cbz x3, print_x
sub x3, x20, #85
cbz x3, print_x
sub x3, x20, #97
cbz x3, print_x
sub x3, x20, #101
cbz x3, print_x
sub x3, x20, #105
cbz x3, print_x
sub x3, x20, #111
cbz x3, print_x
sub x3, x20, #117
cbz x3, print_x
# otherwise, print the char
ldr x0, =char_spec
mov x1, x20
bl printf
b loop_cont

loop_cont:
# increment index and go to top of loop
add x19, x19, #1
b loop

print_x:
ldr x0, =char_spec
mov x1, #120
bl printf
b loop_cont

exit:
ldr x0, =flush
bl printf
mov x0, #0
mov x8, #93
svc #0
